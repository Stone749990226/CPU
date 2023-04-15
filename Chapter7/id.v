//复位信号
`define RstEnable 1'b1 
`define RstDisable 1'b0

//32位的数值0
`define ZeroWord 32'h00000000 

//写使能
`define WriteEnable 1'b1 
`define WriteDisable 1'b0

//读使能
`define ReadEnable 1'b1 
`define ReadDisable 1'b0

//译码阶段的输出aluop_o的宽度
`define AluOpBus 7:0 
//译码阶段的输出alusel_o的宽度
`define AluSelBus 2:0 

//指令有效信号
`define InstValid 1'b0 
`define InstInvalid 1'b1 

//逻辑真假
`define True_v 1'b1 
`define False_v 1'b0

//芯片使能
`define ChipEnable 1'b1 
`define ChipDisable 1'b0 

//AluOp
`define EXE_OR_OP 8'b00100101
`define EXE_NOP_OP 8'b00000000

//AluSel
`define EXE_RES_LOGIC 3'b001

`define EXE_RES_NOP 3'b000

//**********与指令存储器ROM有关的宏定义**********
//ROM的地址总线宽度
`define InstAddrBus 31:0
//ROM的数据总线宽度
`define InstBus 31:0
//ROM的实际大小为128kb
`define InstMemNum 131071
//ROM实际使用的地址线
`define InstMemNumLog2 17

//**********与通用寄存器Regfile有关的宏定义**********
//Regfile的地址线宽度
`define RegAddrBus 4:0
//Regfile模块的数据线宽度
`define RegBus 31:0
//通用寄存器的宽度
`define RegWidth 32
//两倍的通用寄存器的宽度
`define DoubleRegWidth 64
//两倍的通用寄存器数据线的宽度
`define DoubleRegBus 63:0
//通用寄存器数量
`define RegNum 32
//寻址通用寄存器使用的地址位数
`define RegNumLog2 5
`define NOPRegAddr 5'b00000

// 指令码（op）
`define EXE_NOP			6'b000000		// 空操作
`define EXE_ORI			6'b001101		// ori指令码
`define EXE_ANDI		6'b001100		// andi
`define EXE_XORI		6'b001110		// xori
`define EXE_LUI			6'b001111		// lui

// 功能码（op3）
`define EXE_AND			6'b100100		// and指令
`define EXE_OR			6'b100101		// or指令
`define EXE_XOR			6'b100110		// xor指令
`define EXE_NOR			6'b100111		// nor指令

// 逻辑指令 逻辑左移、逻辑右移、算数右移（移动位数是指定的，为6~10位）
`define EXE_SLL			6'b000000		// sll指令
`define EXE_SRL  		6'b000010
`define EXE_SRA			6'b000011

// 移位指令，不指定移动位数，将rt寄存器中的值移动rs位，放到rd中。
`define EXE_SLLV		6'b000100
`define EXE_SRLV		6'b000110
`define EXE_SRAV		6'b000111


`define EXE_SYNC		6'b001111//sync指令的功能码
`define EXE_PREF        6'b110011//pref指令的指令码

`define EXE_SPECIAL_INST 6'b000000//SPECIAL类型指令的指令码
`define EXE_SPECIAL2_INST 6'b011100
`define EXE_RES_ARITHMETIC  3'b100      // 算数操作指令
`define EXE_REGIMM_INST 6'b000001

// 移动操作指令
`define EXE_MOVN		6'b001011
`define EXE_MOVZ		6'b001010
`define EXE_MFHI		6'b010000
`define EXE_MFLO		6'b010010
`define EXE_MTHI		6'b010001
`define EXE_MTLO		6'b010011
`define EXE_RES_MOVE	3'b011			// 移动操作指令
`define EXE_RES_MUL 3'b101

// 算数操作指令
`define EXE_ADD         6'b100000
`define EXE_ADDU        6'b100001
`define EXE_SUB         6'b100010
`define EXE_SUBU        6'b100011
`define EXE_SLT         6'b101010
`define EXE_SLTU        6'b101011
`define EXE_CLZ         6'b100000
`define EXE_CLO         6'b100001
`define EXE_MUL         6'b000010
`define EXE_MULT        6'b011000
`define EXE_MULTU       6'b011001
`define EXE_MADD  6'b000000
`define EXE_MADDU  6'b000001
`define EXE_MSUB  6'b000100
`define EXE_MSUBU  6'b000101


`define EXE_AND_OP   	8'b00100100
`define EXE_OR_OP    	8'b00100101
`define EXE_XOR_OP  	8'b00100110
`define EXE_NOR_OP  	8'b00100111
`define EXE_LUI_OP  	8'b01011100 
`define EXE_SLL_OP  	8'b01111100 
`define EXE_SRL_OP  	8'b00000010
`define EXE_SRA_OP		8'b00000011
`define EXE_RES_SHIFT 	3'b010			// 移位运算
// 移动操作指令
`define EXE_MOVN_OP		8'b00001011
`define EXE_MOVZ_OP		8'b00001010
`define EXE_MFHI_OP		8'b00010000
`define EXE_MFLO_OP		8'b00010010
`define EXE_MTHI_OP		8'b00010001
`define EXE_MTLO_OP		8'b00010011

`define EXE_ADD_OP      8'b10000000
`define EXE_ADDI_OP     8'b10000001
`define EXE_ADDU_OP     8'b10000010
`define EXE_SUB_OP      8'b10000011
`define EXE_SUBU_OP     8'b10000100
`define EXE_ADDIU_OP    8'b10000101
`define EXE_SLT_OP      8'b10000110
`define EXE_SLTU_OP     8'b10000111
`define EXE_SLTI_OP     8'b10001000  
`define EXE_SLTIU_OP    8'b10001001
`define EXE_CLZ_OP      8'b10001010
`define EXE_CLO_OP      8'b10001011
`define EXE_MUL_OP      8'b10001100
`define EXE_MULT_OP     8'b10001101
`define EXE_MULTU_OP    8'b10001110

`define EXE_MADD_OP  8'b10100110
`define EXE_MADDU_OP  8'b10101000
`define EXE_MSUB_OP  8'b10101010
`define EXE_MSUBU_OP  8'b10101011

// 下面是I指令的算数操作指令的操作符
`define EXE_ADDI        6'b001000
`define EXE_ADDIU       6'b001001
`define EXE_SLTI        6'b001010
`define EXE_SLTIU       6'b001011

//流水线暂停
`define Stop 1'b1   
//流水线继续         
`define NoStop 1'b0
`define InDelaySlot 1'b1
`define NotInDelaySlot 1'b0
`include "defines.v"
//ID模块的作用是对指令进行译码,得到最终运算的类型,子类型,源操作数1,源操作数2,要写入的目的寄存器地址等信息
//ID中的电路都是组合逻辑电路,与Regfile模块有接口连接
/* 新增功能
 * 以下六条指令都是special类型的
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

 /* Chapter7新增功能
 * 实现了乘累加,乘累减的4条指令madd,maddu,msub,msubu,这4条指令的指令码都是SPECIAL2,第6-15bit都是0,可依据第0~5bit的功能码确定是哪一种指令
 * SPECIAL2 rs rt 0000 0000 MADD/MADDU/MSUB/MSUBU
 * madd(multiply add):有符号乘累加运算 madd rs, rt:{HI, LO} <- {HI, LO} + rs×rt,将地址为rs的通用寄存器的值与地址为rt的通用寄存器的值作为有符号数进行乘法运算
 * 运算结果与{HI, LO}相加,想家的结果保存到{HI, LO}中.此处{HI, LO}表示HI,LO寄存器连接形成的64位数
 * maddu(multiply-add unsigned):无法好乘累加运算,将其作为无符号数进行乘法运算
 * msub rs, rt:{HI, LO} <- {HI, LO} - rs×rt
 * 实现思路:必须要保存两个信息:
 * (1)当前是第几个时钟周期
 * (2)乘法结果
 * OpenMIPS通过在EX/MEM模块中添加两个寄存器cnt,hilo,分别保存上述信息
 * 执行阶段EX模块的输出hilo_temp_o是乘法结果,传递到EX/MEM模块,并在下一个时钟周期送回EX模块,参与第二个时钟周期的加减法运算
 * 执行阶段EX模块的输出cnt_o表示当前是第几个时钟周期,传递到EX/MEM模块,并在下一个时钟周期送回EX模块,后者据此判断当前处于乘累加/乘累减指令的第几个执行周期
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
    output reg   wreg_o, //译码阶段的指令是否有要写入的目的寄存器
	output wire  stallreq	
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

assign stallreq = `NoStop;

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
		imm <= 32'h0;
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
		wd_o <= inst_i[15:11]; //默认目的寄存器地址wd_o
		wreg_o <= `WriteDisable;
		
		// InstValid = 1，指令有效
		instValid <= `InstValid;
		
		// 需不需要去读寄存器？
		reg1_read_o <= 1'b0;
		reg2_read_o <= 1'b0;
		
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
					5'b00000: begin
						case (op3) //根据功能码判断是哪种指令
							// R型指令
							`EXE_AND: begin						// and指令
								// 问？以下这六个从哪来的？
								// 答：看ex的输入端口，ex要什么，我们就输出什么给它。
								aluop_o <= `EXE_AND_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= `WriteEnable;					//是否有要写入的目的寄存器
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
								wreg_o <= `WriteEnable;			// 需要将结果写入的目的寄存器
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;		
							end
							`EXE_XOR: begin
								aluop_o <= `EXE_XOR_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= `WriteEnable;
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
							`EXE_MFHI: begin
								wreg_o <= `WriteEnable;
								aluop_o <= `EXE_MFHI_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MFLO:begin
								wreg_o <= `WriteEnable;
								aluop_o <= `EXE_MFLO_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MTHI:begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MTHI_OP;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MTLO:begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MTLO_OP;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MOVN:begin
								aluop_o <= `EXE_MOVN_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
								if (reg2_o != `ZeroWord) begin //读取地址为rt的通用寄存器的值是否为0,判断是否要写入目的寄存器
									wreg_o <= `WriteEnable;
								end else begin
									wreg_o <= `WriteDisable;
								end
							end
							`EXE_MOVZ:begin
								aluop_o <= `EXE_MOVZ_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
								if (reg2_o == `ZeroWord) begin
									wreg_o <= `WriteEnable;
								end else begin
									wreg_o <= `WriteDisable;
								end
							end
							//add,addu,sub,subu,slt,sltu这留条指令都是R型指令,且指令码都是6'b000000
							//需要根据指令中第0-5bit功能码的值进一步判断是哪一种指令
							//SPECIAL rs rt rd 00000 ADD/ADDU/SUB/SUBU/SLT/SLTU
							`EXE_ADD: begin // add rd, rs, rt作用:rd <- rs + rt,如果加法运算溢出,那么会产生溢出异常,同时不保存结果
                                aluop_o <= `EXE_ADD_OP;
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                wreg_o <= `WriteEnable;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_ADDU: begin //addu rd, rs, rt作用:rd <- rs + rt,与add指令的不同之处在于addu指令不进行溢出检查,总是将结果保存到目的寄存器
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_ADDU_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_SUB: begin //sub rd, rs, rt作用:rd <- rs - rt,如果减法运算溢出,那么产生溢出异常,同时不保存结果
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SUB_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_SUBU: begin //subu rd, rs, rt作用:rd <- rs - rt,不进行溢出检查,总是将结果保存到目的寄存器
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SUBU_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							`EXE_SLT: begin //(Set on Less Than)slt rd, rs, rt作用:rd <- (rs<rt),将地址为rs的通用寄存器的值域地址为rt的通用寄存器的值按照有符号数进行比较
							// 如果前者小于后者,那么将1保存到地址为rd的通用寄存器中,反之,将0保存到通用寄存器中
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SLT_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							`EXE_SLTU: begin //(Set on Less Than Unsigned)sltu rd, rs, rt作用:rd <- (rs<rt),将地址为rs的通用寄存器的值域地址为rt的通用寄存器的值按照无符号数进行比较
							// 如果前者小于后者,那么将1保存到地址为rd的通用寄存器中,反之,将0保存到通用寄存器中
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SLTU_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							//mult,multu的指令码是SPECIAL,而mul指令的指令码是SPECIAL2
							`EXE_MULT:begin //mult rs, rt作用:{hi, lo} <- rs × rt
							//将地址为rs的通用寄存器的值域地址为rt的通用寄存器的值作为有符号数相乘,乘法结果的低32bit保存到LO寄存器中,高32bit保存到HI寄存器中
                                // alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_MULT_OP;
                                wreg_o <= `WriteDisable; //因为最终结果不写入通用寄存器,而是HI,LO寄存器
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_MULTU: begin //multu rs, rt作用:{hi, lo} <- rs × rt,与mult的区别在于这里是作为无符号数相乘
                                // alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_MULTU_OP;
                                wreg_o <= `WriteDisable;             // 不写入到通用寄存器，所以使能设置为0。需要保存到特殊寄存器 hi lo 中。
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							default: begin
							end
						endcase
					end
					default: begin
					end
				endcase
			end
			// 算术运算指令：clo clz指令
            `EXE_SPECIAL2_INST: begin
                case (op2)
                    5'b00000: begin
                        case (op3)
							//clo,clz指令都是R型指令,指令码都是6'b011100,再MIPS32指令集架构中表示SPECIAL2类
							//另外,第6-10bit都为0,需要依据指令中第0-5bit功能码的值进一步判断是哪一种指令
                            `EXE_CLZ: begin //clz指令(Count Leading Zeroes):clz rd, rs作用:rd <- count_leading_zeros rs
							//对地址为rs的通用寄存器的值,从其最高位开始向最低位方向检查,直到遇到值为"1"的位,将该位之前"0"的个数保存到地址为rd的通用寄存器中
							//如果地址为rs的通用寄存器的所有位都为0(即0x00000000),那么将32保存到地址为rd的通用寄存器中
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_CLZ_OP;
                                wreg_o <= `WriteEnable;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b0;
                                instValid <= `InstValid;
                            end
                            `EXE_CLO: begin //clo指令(Count Leading Ones)
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_CLO_OP;
                                wreg_o <= `WriteEnable;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b0;
                                instValid <= `InstValid;
                            end
                            `EXE_MUL: begin //mul rd, rs, rt作用:rd <- rs × rt
							//将地址为rs的通用寄存器的值域地址为rt的通用寄存器的值作为有符号相乘,乘法结果的低32bit保存到地址为rd的通用寄存器中
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_MUL_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							//以下四条指令,因为最终结果都是写入HI,LO寄存器,而不是通用寄存器,所以设置wrge_o为WriteDisable
							//因为要读取两个寄存器的值,所以设置reg1_read_o,reg2_read_o为1'b1
							`EXE_MADD: begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MADD_OP;
								alusel_o <= `EXE_RES_MUL;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							`EXE_MADDU: begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MADDU_OP;
								alusel_o <= `EXE_RES_MUL;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							`EXE_MSUB:	begin
								wreg_o <= `WriteDisable;		
								aluop_o <= `EXE_MSUB_OP;
		  						alusel_o <= `EXE_RES_MUL; 
								reg1_read_o <= 1'b1;	
								reg2_read_o <= 1'b1;	  			
		  						instValid <= `InstValid;	
							end
							`EXE_MSUBU:	begin
								wreg_o <= `WriteDisable;		
								aluop_o <= `EXE_MSUBU_OP;
		  						alusel_o <= `EXE_RES_MUL; 
								reg1_read_o <= 1'b1;	
								reg2_read_o <= 1'b1;	  			
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
			//addi,addiu,slti,sltiu这四条指令都是I型指令,能够根据指令中的第26~31bit指令码的值判断是哪一种指令
			//ADDI/ADDIU/SLTI/SLTIU rs rt immediate
			`EXE_ADDI: begin//addi rt, rs, immediate作用:rt <- rs + (sign_extended)immediate
			//将指令中的16位立即数进行符号扩展,与地址为rs的通用寄存器的值进行加法运算,结果保存到地址为rt的通用寄存器中.
			//如果加法运算溢出,那么产生溢出异常,不保存结果
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_ADDI_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};    // 有符号扩展
				wd_o <= inst_i[20:16];
                instValid <= `InstValid;
            end
            `EXE_ADDIU: begin//addiu rt, rs, immediate作用:rt <- rs + (sign_extended)immediate
			//将指令中的16位立即数进行符号扩展,与地址为rs的通用寄存器的值进行加法运算,结果保存到地址为rt的通用寄存器中.
			//与addi指令的区别在于,其不进行溢出检查,总是将结果保存到目的寄存器
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_ADDIU_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                wd_o <= inst_i[20:16];
                instValid <= `InstValid;
            end
			`EXE_SLTI: begin //slti rt, rs, immediate作用:rt <- (rs<(sign_extended)immediate)
			//将指令中的16为立即数进行符号扩展,与地址为rs的通用寄存器的值按照有符号数进行比较
			//如果前者大于后者,那么将1保存到地址为rt的通用寄存器中;反之将0保存到地址为rt的通用寄存器中
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_SLTI_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                wd_o <= inst_i[20:16];
                instValid <= `InstValid;
            end
            `EXE_SLTIU: begin //sltiu rt, rs, immediate作用:rt <- (rs<(sign_extended)immediate)
			//将指令中的16为立即数进行符号扩展,与地址为rs的通用寄存器的值按照无符号数进行比较
			//如果前者大于后者,那么将1保存到地址为rt的通用寄存器中;反之将0保存到地址为rt的通用寄存器中
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_SLTIU_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};
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