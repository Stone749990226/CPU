`include "defines.v"
//ID模块的作用是对指令进行译码,得到最终运算的类型,子类型,源操作数1,源操作数2,要写入的目的寄存器地址等信息
//ID中的电路都是组合逻辑电路,与Regfile模块有接口连接
/* 新增功能
 * 1.新增了movn,movz指令(不涉及特殊寄存器HI,LO)
 * movn指令(move Conditional on Not Zero)用法:movn rd, rs, rt
 * 指令作用:if rt != 0, then rd<-rs  判断地址为rt的通用寄存器的值,如果不为零,那么将地址为rs的通用寄存器的值赋值给地址为rd的通用寄存器
 * 反之,保持地址为rd的通用寄存器不变.
 * movz指令(move Conditional on Zero)用法:movz rd, rs, rt
 * 指令作用:与movn相反
 * 2.新增了mfhi,mflo,mthi,mtlo指令(涉及特殊寄存器HI,LO)
 * mfhi rd:将特殊寄存器HI的值赋值给地址为rd的通用寄存器(move from)
 * mflo rd:将特殊寄存器L0的值赋值给地址为rd的通用寄存器
 * mthi rs:将地址为rs的通用寄存器的值赋值给特殊寄存器HI(move to)
 * mtlo rs:将地址为rs的通用寄存器的值赋值给特殊寄存器lO(move to)
 */
module id(
	//下面信号中_i表示input,_o表示output
    input wire rst,
    input wire [`InstAddrBus] pc_i, //译码阶段的指令对应的地址
    input wire [`InstBus] inst_i, //译码阶段的指令(instruction)
    //读取的Regfile的值
    input wire [`RegBus] reg1_data_i, //从Regfile输入的第一个读寄存器端口的输入
    input wire [`RegBus] reg2_data_i,

	input wire[4:0]		ex_wd_i,		// 要写回的目的寄存器地址
	input wire			ex_wreg_i,		// //处于执行阶段的指令是否要写入目的寄存器
	input wire[31:0] 	ex_wdata_i,		// 将什么数据写回
	// 访存模块输出的内容连接到译码模块
	input wire[4:0]		mem_wd_i,		
	input wire 			mem_wreg_i,			
	input wire[31:0] 	mem_wdata_i,

    //输出到Regfile的信息
    output reg reg1_read_o, //Regfile模块的第一个读寄存器端口的使能信号
    output reg reg2_read_o,
    output reg [`RegAddrBus] reg1_addr_o, //Regfile模块的第一个读寄存器端口的读地址信号
    output reg [`RegAddrBus] reg2_addr_o,
    //送到执行阶段的信息
    output reg[`AluOpBus] aluop_o, //译码阶段的指令要进行的运算的子类型
    //运算类型指逻辑运算,算术运算,移位运算;子类型:如当运算类型是逻辑运算时,运算子类型可以是逻辑"或",逻辑"与"
    output reg[`AluSelBus] alusel_o, //译码阶段的指令要进行的运算的类型
	//送到执行阶段的源操作数1,源操作数2
    output reg [`RegBus] reg1_o, 
    output reg [`RegBus] reg2_o,
    output reg [`RegAddrBus] wd_o, //译码阶段的指令要写入的目的寄存器地址
    output reg wreg_o //译码阶段的指令是否有要写入的目的寄存器
);

//取得指令的指令码,功能码
wire[5:0] op = inst_i[31:26]; //指令码 
wire[4:0] op2 = inst_i[10:6];
wire[5:0] op3 = inst_i[5:0]; //功能码
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
		instValid <= `InstValid;
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
		
		// InstValid = 1，指令有效
		instValid <= `InstValid;
		
		// 需不需要去读寄存器？
		// 这里显然不需要，因为ori指令是对immediate操作的
		reg1_o <= 1'b0;
		reg2_o <= 1'b0;
		
		// 要通过指令去寄存器取值
		reg1_addr_o <= inst_i[25:21];//默认通过Regfile读端口1读取的寄存器地址
		reg2_addr_o <= inst_i[20:16];//默认通过Regfile读端口2读取的寄存器地址
		
		imm <= `ZeroWord;
		/*首先根据指令码op进行判断,如果是SPECIAL类指令,再判断指令的第6-10bit即op2是否为0,如果为0,再依据功能码op3的值进行最终判断
		 *如果指令码op不为SEPECIAL,那么就直接依据指令码op的值进行判断
		**/
		case (op) 
			`EXE_SPECIAL_INST: begin //指令码是SPECIAL
				case (op2)
					5'b0000: begin
						case (op3) //根据功能码判断是哪种指令
							// R型指令
							`EXE_AND: begin						// and指令
								// 问？以下这六个从哪来的？
								// 答：看ex的输入端口，ex要什么，我们就输出什么给它。
								aluop_o <= `EXE_AND_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= 1'b1;					//是否有要写入的目的寄存器
								//and指令要读取rs,rt寄存器的值,所以设置reg1_read_o,reg2_read_o为1
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							`EXE_OR: begin						// or指令
								aluop_o <= `EXE_OR_OP;			// 运算子类型
								alusel_o <= `EXE_RES_LOGIC;		// 运算类型	
								// R型指令需要将两个寄存器data传给后面执行模块
								// 所以需要先从regfile中获取data
								wreg_o <= 1'b1;					// 需要将结果写入的目的寄存器
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;		
							end
							`EXE_XOR: begin
								aluop_o <= `EXE_XOR_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= 1'b1;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;			// InstValid = 1'b1
							end
							`EXE_NOR: begin
								aluop_o <= `EXE_NOR_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= 1'b1;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							// 移位指令，不指定移动位数，将rt寄存器中的值移动rs位，放到rd中。
							`EXE_SLLV: begin
								alusel_o <=	`EXE_RES_SHIFT;		// 运算类型
								aluop_o <= `EXE_SLL_OP;			// 运算子类型
								wreg_o <= 1'b1;					// 是否最后要写入目的寄存器		
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;	
							end
							`EXE_SRLV: begin
								alusel_o <=	`EXE_RES_SHIFT;		
								aluop_o <= `EXE_SRL_OP;			
								wreg_o <= 1'b1;						
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;	
							end
							`EXE_SRAV: begin
								alusel_o <=	`EXE_RES_SHIFT;		
								aluop_o <= `EXE_SRA_OP;			
								wreg_o <= 1'b1;						
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							// 空指令 sync，是一种R型指令
							`EXE_SYNC: begin
								alusel_o <= `EXE_RES_NOP;
								aluop_o <= `EXE_NOP_OP;
								wreg_o <= 1'b0;
								// 下面这两个比较难理解
								// 端口1不读，端口2读。会执行下面的 reg1_o <= imm;，也就是立即数 32'h0000_0000 送到reg1_o，从而传给执行阶段的 reg1_i（源操作数1）。
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b1;
								// 传给执行阶段，但因为不让返回，所以执行阶段也没必要处理。
								instValid <= `InstValid;
							end
						endcase
					end
				endcase
			end
			// I型指令
			`EXE_ORI: begin							// ori指令				
				wreg_o <= 1'b1;						// 首先肯定是要写回的，修改下使能				
				aluop_o <= `EXE_OR_OP;				// 运算子类型				
				alusel_o <= `EXE_RES_LOGIC;			// 运算类型
				// 需要通过读一个寄存器，另一个是imm，控制使能
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				instValid <= `InstValid;			// 首先肯定是要写回的，修改下使能
				
				// 因为ori指令需要用到立即数，所以才需要下面的两行
				imm <= {16'h0, inst_i[15:0]};		// 立即数进行无符号扩展
				wd_o <= inst_i[20:16];					
			end
			`EXE_ANDI: begin
				alusel_o <= `EXE_RES_LOGIC;
				aluop_o <= `EXE_AND_OP;		
				wreg_o <= 1'b1;
				//andi指令只需要读取rs寄存器的值,所以设置reg1_read_o的值为1,reg2_read_o的值为0,暗含使用立即数作为运算的操作数
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				instValid <= `InstValid;
			end
			`EXE_XORI: begin
				alusel_o <= `EXE_RES_LOGIC;
				aluop_o <= `EXE_XOR_OP;		
				wreg_o <= 1'b1;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				instValid <= `InstValid;
			end
			`EXE_LUI: begin
				alusel_o <= `EXE_RES_LOGIC;
				aluop_o <= `EXE_OR_OP;				// 这里比较特殊，我们让lui指令以逻辑或的方式运算	
				wreg_o <= 1'b1;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {inst_i[15:0], 16'h0};
				wd_o <= inst_i[20:16];
				instValid <= `InstValid;
			end
		endcase
		// 逻辑指令 逻辑左移、逻辑右移、算数右移（移动位数是指定的，为6~10位）
		if (inst_i[31:21] == 11'b00000000000) begin
			case (op3)
				`EXE_SLL: begin
					alusel_o <=	`EXE_RES_SHIFT;		// 运算类型
					aluop_o <=	`EXE_SLL_OP;		// 运算子类型
					wreg_o <= 1'b1;					// 需要写回寄存器
					reg1_read_o <= 1'b0;			// 端口1是shamt，代表移动的位数，不需要从寄存器中读
					reg2_read_o <= 1'b1;			// 源操作数rt，需要从端口2，从寄存器堆中读取
					imm[4:0] <= inst_i[10:6];		// 移动的位数，最多5位（可以移动0-5位），注意哈，移动的位数可不是从寄存器堆中取得的，而是从指令的第6-10位取到的。
					wd_o <=	inst_i[15:11];			// 需要写回的寄存器编号
					instValid <= `InstValid;
				end
				`EXE_SRL: begin
					alusel_o <=	`EXE_RES_SHIFT;		
					aluop_o <=	`EXE_SRL_OP;		
					wreg_o <= 1'b1;					
					reg1_read_o <= 1'b0;			
					reg2_read_o <= 1'b1;			
					imm[4:0] <= inst_i[10:6];		
					wd_o <=	inst_i[15:11];			
				end
				`EXE_SRA: begin
					alusel_o <=	`EXE_RES_SHIFT;		
					aluop_o <=	`EXE_SRA_OP;		
					wreg_o <= 1'b1;					
					reg1_read_o <= 1'b0;			
					reg2_read_o <= 1'b1;			
					imm[4:0] <= inst_i[10:6];		
					wd_o <=	inst_i[15:11];
				end
			endcase
		end
	end
end

/********************************************
*********	第二阶段：控制源操作数1	*********
********************************************/
//如果reg1_read_o为1,那么就将从Regfile模块读端口1读取的寄存器的值作为源操作数1
//如果reg1_read_o为0,那么就将立即数作为源操作数1
/*新增了两种情况
 *1.如果Regfile模块读端口1要读取的寄存器就是执行阶段要写的目的寄存器,那么直接把执行阶段的结果ex_wdata_i作为reg1_o的值
 *2.如果Regfile模块读端口1要读取的寄存器就是访存阶段要写的目的寄存器,那么直接把访存阶段的结果mem_wdaya_i作为reg1_o的值
 */
always @ (*) begin
	if (rst == `RstEnable) begin
		reg1_o <= `ZeroWord;
	end else if ((reg1_read_o == 1'b1) && (ex_wreg_i == 1'b1) && (ex_wd_i == reg1_addr_o)) begin
		reg1_o <= ex_wdata_i;
	end else if ((reg1_read_o == 1'b1) && (mem_wreg_i == 1'b1) && (mem_wd_i == reg1_addr_o)) begin
		reg1_o <= mem_wdata_i;
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
	end else if ((reg2_read_o == 1'b1) && (ex_wreg_i == 1'b1) && (ex_wd_i == reg2_addr_o)) begin
		reg2_o <= ex_wdata_i;
	end else if ((reg2_read_o == 1'b1) && (mem_wreg_i == 1'b1) && (mem_wd_i == reg2_addr_o)) begin
		reg2_o <= mem_wdata_i;
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