`include "defines.v"
//ID模块的作用是对指令进行译码,得到最终运算的类型,子类型,源操作数1,源操作数2,要写入的目的寄存器地址等信息
//ID中的电路都是组合逻辑电路,与Regfile模块有接口连接
module id(
	//下面信号中_i表示input,_o表示output
    input wire rst,
    input wire [`InstAddrBus] pc_i, //译码阶段的指令对应的地址
    input wire [`InstBus] inst_i, //译码阶段的指令(instruction)
    //读取的Regfile的值
    input wire [`RegBus] reg1_data_i, //从Regfile输入的第一个读寄存器端口的输入
    input wire [`RegBus] reg2_data_i,
    //输出到Regfile的信息
    output reg reg1_read_o, //Regfile模块的第一个读寄存器端口的使能信号
    output reg reg2_read_o,
    output reg [`RegAddrBus] reg1_addr_o, //Regfile模块的第一个读寄存器端口的读地址信号
    output reg [`RegAddrBus] reg2_addr_o,
    //送到执行阶段的信息
    output reg[`AluOpBus] aluop_o, //译码阶段的指令要进行的运算的子类型
    //运算类型指逻辑运算,算术运算,移位运算;子类型:如当运算类型是逻辑运算时,运算子类型可以是逻辑"或",逻辑"与"
    output reg[`AluSelBus] alusel_o, //译码阶段的指令要进行的运算的类型
    output reg [`RegBus] reg1_o, //译码阶段的指令要进行的运算的源操作数1
    output reg [`RegBus] reg2_o,
    output reg [`RegAddrBus] wd_o, //译码阶段的指令要写入的目的寄存器地址
    output reg wreg_o //译码阶段的指令是否有要写入的目的寄存器
);

//取得指令的指令码,功能码
//对于ori指令只需通过判断第26-31bit的值,即可判断是否是ori指令
wire[5:0] op = inst_i[31:26];
wire[4:0] op2 = inst_i[10:6];
wire[5:0] op3 = inst_i[5:0];
wire[4:0] op4 = inst_i[20:16];

//保存指令执行需要的立即数
reg[`RegBus] imm;
//指示指令是否有效
reg instValid;

//*****对指令进行译码*****
//对于ori指令而言,只需识别26-32bit的指令码是否为6'b001101即可判断是否为ori指令
always @(*) begin
    // 复位有效
	if (rst == `RstEnable) begin
		aluop_o <= `EXE_NOP_OP;		// 运算子类型，8'b00000000
		alusel_o <= `EXE_RES_NOP;	// 运算类型，3'b000
		
		wd_o <= `NOPRegAddr;
		wreg_o <= `NOPRegAddr;
		imm <= 32'h0000_0000;
        reg1_addr_o <= `NOPRegAddr;
		reg1_read_o <= 1'b0;
		reg2_addr_o <= `NOPRegAddr;
		reg2_read_o <= 1'b0;
		
	// 正常情况下，下面的是默认运算
	end else begin
		// 操作子类型和操作类型
		aluop_o <= `EXE_NOP_OP;
		alusel_o <= `EXE_RES_NOP;
		
		// 要写入的目的寄存器
		wd_o <= inst_i[15:11];
		wreg_o <= `WriteDisable;
		
		// InstVaild = 1，指令有效
		instValid <= `InstValid;
		
		// 需不需要去读寄存器？
		// 这里显然不需要，因为ori指令是对immediate操作的
		reg1_o <= 1'b0;
		reg2_o <= 1'b0;
		
		// 要通过指令去寄存器取值
		reg1_addr_o <= inst_i[25:21];//默认通过Regfile读端口1读取的寄存器地址
		reg2_addr_o <= inst_i[20:16];//默认通过Regfile读端口2读取的寄存器地址
		
		imm <= `ZeroWord;
		
		case (op) //根据op的值判断是否是ori指令
			`EXE_ORI: begin
				// 首先肯定是要写回的，修改下使能
				wreg_o <= `WriteEnable;
				// 运算子类型是逻辑"或"运算
				aluop_o <= `EXE_OR_OP;
				// 运算类型是逻辑运算
				alusel_o <= `EXE_RES_LOGIC;
				// 需要通过读一个寄存器，另一个是imm，控制使能
				// 由于I型指令只需要一个寄存器和一个立即数,所以reg2_read_o=0
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				// 立即数进行无符号扩展
				imm <= {16'h0, inst_i[15:0]};
                //wd_o为要写入的目的寄存器的地址
				wd_o <= inst_i[20:16];
				// 此指令有效
				instValid <= `InstValid;
			end
			default:begin
			end
		endcase
	end
end

/********************************************
*********	第二阶段：控制源操作数1	*********
********************************************/
//如果reg1_read_o为1,那么就将从Regfile模块读端口1读取的寄存器的值作为源操作数1
//如果reg1_read_o为0,那么就将立即数作为源操作数1
always @ (*) begin
	if (rst == `RstEnable) begin
		reg1_o <= `ZeroWord;
	end else if (reg1_read_o == 1'b1) begin
        //Regfile读端口1的输出值
		reg1_o <= reg1_data_i;
	end else if (reg1_read_o == 1'b0) begin
		reg1_o <= imm;
	end else begin
		reg1_o <= `ZeroWord;
	end
end

/********************************************
*********	第三阶段：控制源操作数2	*********
********************************************/
// 与上面的一样，1改成2
always @ (*) begin
	if (rst == `RstEnable) begin
		reg2_o <= 1'b0;
	end else if (reg2_read_o == 1'b1) begin
        //Regfile读端口2的输出值
		reg2_o <= reg2_data_i;
	end else if (reg2_read_o == 1'b0) begin
		reg2_o <= imm;
	end else begin
		reg2_o <= `ZeroWord;
	end
end


endmodule