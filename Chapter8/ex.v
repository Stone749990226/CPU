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
`define EXE_MADD_OP     8'b10100110
`define EXE_MADDU_OP    8'b10101000
`define EXE_MSUB_OP     8'b10101010
`define EXE_MSUBU_OP    8'b10101011

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
/*!
 * EX模块 执行指令
 * 作用：根据译码的结果，对源操作数1、源操作数2进行指定的运算
 *		  执行阶段包括EX和EX/MEM两个模块
 *        EX模块中都是组合逻辑电路
*/
`include "defines.v"
module ex(
	input wire rst,

	// 译码阶段送到执行阶段的信号
	input wire[7:0] aluop_i,	// 运算子类型
	input wire[2:0] alusel_i,	// 运算类型
	input wire[4:0] wd_i,		// EX（执行）后要写入的目的寄存器地址
	input wire wreg_i,			// 是否有要写入的目的寄存器
	input wire[31:0] reg1_i,	// 参与运算的源操作数1
	input wire[31:0] reg2_i,	// 参与运算的源操作数2
	//HILO模块给出的HI,LO寄存器
	input wire[`RegBus] hi_i,
	input wire[`RegBus] lo_i,
	input wire[`RegBus] wb_hi_i,
	input wire[`RegBus] wb_lo_i,
	input wire wb_whilo_i,
	input wire[`RegBus] mem_hi_i,
	input wire[`RegBus] mem_lo_i,
	input wire mem_whilo_i,

	//第7.8.2节新增
	input wire[`DoubleRegBus] hilo_temp_i, //第一个执行周期得到的乘法结果
	input wire[1:0]               cnt_i,   //当前处于执行阶段的第几个时钟周期


	// 执行结果的输出
	output reg[4:0] wd_o,		// 要写回的目的寄存器地址
	output reg wreg_o,			// 是否写回
	output reg[31:0] wdata_o,	// 最终要协会目的寄存器的值
	//执行阶段为HI,LO寄存器的写请求
	output reg[`RegBus] hi_o,
	output reg[`RegBus] lo_o,
	output reg whilo_o,

	//第7.8.2节新增
	output reg[`DoubleRegBus]     hilo_temp_o, //第一个执行周期得到的乘法结果
	output reg[1:0]               cnt_o,	   //下一个时钟周期处于执行阶段的第几个时钟周期
	output reg					  stallreq  
);

// 这个变量专门用来保存逻辑运算的运算结果
reg[31:0] logicout;
// 这个变量专门用来保存移位运算的运算结果
reg[31:0] shiftres;
// 移动操作的结果
reg[`RegBus] moveres;
// 保存HI寄存器的最新值
reg[`RegBus] HI;
// 保存LO寄存器的最新值
reg[`RegBus] LO;

//第7章新定义的变量
wire ov_sum; //指示加减法溢出情况
wire reg1_eq_reg2; //第一个操作数是否等于第二个操作数
wire reg1_lt_reg2; //第一个操作数是否小于第二个操作数
reg[`RegBus] arithmeticres; //保存算术运算的结果,res为result
wire[`RegBus] reg2_i_mux; //保存输入的第二个操作数reg2_i的补码
wire[`RegBus] reg1_i_not; //保存输入的第一个操作数reg1_i按位取反后的值
wire[`RegBus] result_sum; //保存加减法结果
wire[`RegBus] opdata1_mult; //乘法操作中的被乘数
wire[`RegBus] opdata2_mult; //乘法操作中的被乘数
wire[`DoubleRegBus] hilo_temp; //临时保存乘法结果,宽度为64位
reg[`DoubleRegBus] mulres; //保存乘法结果,宽度为64位

reg[`DoubleRegBus] hilo_temp1;
reg stallreq_for_madd_msub;	

//(1)如果是减法或者有符号比较运算,那么reg2_i_mux等于第二个操作数reg2_i的补码,否则reg2_i_mux就等于第二个操作数reg2_i
assign reg2_i_mux = ((aluop_i==`EXE_SUB_OP)||(aluop_i==`EXE_SUBU_OP)||(aluop_i==`EXE_SLT_OP)) ? (~reg2_i)+1 : reg2_i;
//(2)分三种情况:
//a.如果是加法运算,此时reg2_i_mux就是第二个操作数reg2_i,所以result_sum就是加法运算的结果
//b.如果是减法运算,此时reg2_i_mux是第二个操作数reg2_i的补码,所以result_sum就是减法运算的结果
//c.如果是有符号比较运算,此时reg_2_i_mux也是第二个操作数reg2_i的补码,所以result_sum也是减法运算的结果,可以通过判断减法的结果是佛小于0从而判断第一个操作数reg1_i是否小于第二个操作数reg2_i
assign result_sum = reg1_i + reg2_i_mux;
//(3)计算是否溢出,加法指令(add和addi),减法指令(sub)执行的时候需要判断是否溢出,满足下面两种情况之一时有溢出
//a.reg1_i为正数,reg2_i_mux为正数,但是两者之和为负数
//b.reg1_i为负数,reg2_i_mux为负数,但是两者之和为正数
assign ov_sum = ((!reg1_i[31] && !reg2_i_mux[31]) && result_sum[31]) || ((reg1_i[31] && reg2_i_mux[31]) && (!result_sum[31]));
//(4)计算操作数1是否小于操作数2,分两种情况
//a.aluop_i为EXE_SLT_OP表示有符号比较运算,此时又分为3种情况
//	a1.reg1_i为负数,reg2_i为正数,显然reg1_i小于reg2_i
//	a2.reg1_i为正数,reg2_i为正数,并且reg1_i减去reg2_i的值小于0(即result_sum为负),此时也有reg1_i小于reg2_i
//  a3.reg1_i为负数,reg2_i为负数,并且reg1_i减去reg2_i的值小于0(即result_sum为负),此时也有reg1_i小于reg2_i
//b.无符号数的比较的时候,直接使用比较运算符比较reg1_i与rge2_i
assign reg1_lt_reg2 = ((aluop_i == `EXE_SLT_OP)) ? ((reg1_i[31] && !reg2_i[31]) || (!reg1_i[31] && !reg2_i[31] && result_sum[31]) || (reg1_i[31] && reg2_i[31] && result_sum[31])) : (reg1_i<reg2_i);
//(5)对操作数1逐位取反,赋给reg1_i_not
assign reg1_i_not = ~reg1_i;


/***************************************************************************
************	根据不同的算术运算类型,给arithmeticres变量赋值	***************
****************************************************************************/
always @(*) begin
	if(rst == `RstEnable) begin
		arithmeticres <= `ZeroWord;
	end else begin
		case (aluop_i)
			`EXE_SLT_OP, `EXE_SLTU_OP: begin
				arithmeticres <= reg1_lt_reg2; // 比较运算
			end 
			`EXE_ADD_OP, `EXE_ADDU_OP, `EXE_ADDI_OP, `EXE_ADDIU_OP: begin
				arithmeticres <= result_sum; //加法运算
			end
			`EXE_SUB_OP, `EXE_SUBU_OP: begin
				arithmeticres <= result_sum;//减法运算
			end
			`EXE_CLZ_OP: begin
				arithmeticres <= reg1_i[31] ? 0 : 
								 reg1_i[30] ? 1 : 
								 reg1_i[29] ? 2 : 
								 reg1_i[28] ? 3 : 
								 reg1_i[27] ? 4 : 
								 reg1_i[26] ? 5 : 
								 reg1_i[25] ? 6 : 
								 reg1_i[24] ? 7 : 
								 reg1_i[23] ? 8 : 
								 reg1_i[22] ? 9 : 
								 reg1_i[21] ? 10 : 
								 reg1_i[20] ? 11 : 
								 reg1_i[19] ? 12 : 
								 reg1_i[18] ? 13 : 
								 reg1_i[17] ? 14 : 
								 reg1_i[16] ? 15 : 
								 reg1_i[15] ? 16 : 
								 reg1_i[14] ? 17 : 
								 reg1_i[13] ? 18 : 
								 reg1_i[12] ? 19 : 
								 reg1_i[11] ? 20 : 
								 reg1_i[10] ? 21 : 
								 reg1_i[9] ? 22 : 
								 reg1_i[8] ? 23 : 
								 reg1_i[7] ? 24 : 
								 reg1_i[6] ? 25 : 
								 reg1_i[5] ? 26 : 
								 reg1_i[4] ? 27 : 
								 reg1_i[3] ? 28 : 
								 reg1_i[2] ? 29 : 
								 reg1_i[1] ? 30 : 
								 reg1_i[0] ? 31 : 32;
			end
			`EXE_CLO_OP: begin
				arithmeticres <= reg1_i_not[31] ? 0 :
								 reg1_i_not[30] ? 1 :
								 reg1_i_not[29] ? 2 :
								 reg1_i_not[28] ? 3 :
								 reg1_i_not[27] ? 4 :
								 reg1_i_not[26] ? 5 :
								 reg1_i_not[25] ? 6 :
								 reg1_i_not[24] ? 7 :
								 reg1_i_not[23] ? 8 :
								 reg1_i_not[22] ? 9 :
								 reg1_i_not[21] ? 10 :
								 reg1_i_not[20] ? 11 :
								 reg1_i_not[19] ? 12 :
								 reg1_i_not[18] ? 13 :
								 reg1_i_not[17] ? 14 :
								 reg1_i_not[16] ? 15 :
								 reg1_i_not[15] ? 16 :
								 reg1_i_not[14] ? 17 :
								 reg1_i_not[13] ? 18 :
								 reg1_i_not[12] ? 19 :
								 reg1_i_not[11] ? 20 :
								 reg1_i_not[10] ? 21 :
								 reg1_i_not[9] ? 22 :
								 reg1_i_not[8] ? 23 :
								 reg1_i_not[7] ? 24 :
								 reg1_i_not[6] ? 25 :
								 reg1_i_not[5] ? 26 :
								 reg1_i_not[4] ? 27 :
								 reg1_i_not[3] ? 28 :
								 reg1_i_not[2] ? 29 :
								 reg1_i_not[1] ? 30 :
								 reg1_i_not[0] ? 31 : 32;
			end
			default: begin
				arithmeticres <= `ZeroWord;
			end
		endcase
	end
end

/********************************************
************	进行乘法运算	***************
*********************************************/
//(1)取得乘法运算的被乘数,如果是有符号乘法并且被乘数是负数,那么取补码
assign opdata1_mult = (((aluop_i==`EXE_MUL_OP) || (aluop_i==`EXE_MULT_OP) || (aluop_i==`EXE_MADD_OP) || (aluop_i==`EXE_MSUB_OP)) && (reg1_i[31]==1'b1)) ? (~reg1_i+1) : reg1_i;
//(2)取得乘法运算的乘数,如果是有符号乘法且乘数是负数,那么取补码
assign opdata2_mult = (((aluop_i==`EXE_MUL_OP) || (aluop_i==`EXE_MULT_OP) || (aluop_i==`EXE_MADD_OP) || (aluop_i==`EXE_MSUB_OP)) && (reg2_i[31]==1'b1)) ? (~reg2_i+1) : reg2_i;
//(3)得到临时乘法结果,保存在变量hilo_temp中
assign hilo_temp = opdata1_mult * opdata2_mult;
//(4)对临时乘法结果进行修正,最终的乘法结果保存在变量mulres中,主要有两点
//a.如果是有符号乘法指令mult,mul,那么需要修正临时乘法结果,如下:
//	a1.如果被乘数与乘数两者一正一负,那么需要对临时乘法结果hilo_temp求补码,作为最终的乘法运算结果,赋值给变量multes
//	a2.如果被乘数与乘数同号,那么hilo_temp的值就作为最终的乘法结果,赋给变量mulres
//b.如果是无符号乘法运算maddu,msubu,那么hilo_temp的值作为最终的乘法结果,赋值给变量mulres
always @(*) begin
	if(rst == `RstEnable) begin
		mulres <= {`ZeroWord, `ZeroWord};
	end else if((aluop_i == `EXE_MULT_OP) || (aluop_i == `EXE_MUL_OP) || (aluop_i==`EXE_MADD_OP) || (aluop_i==`EXE_MSUB_OP)) begin
		if(reg1_i[31] ^ reg2_i[31] == 1'b1) begin //如果被乘数与乘数两者一正一负
			mulres <= ~hilo_temp + 1;
		end else begin //如果被乘数与乘数同号
			mulres <= hilo_temp; 
		end
	end
end

/********************************************
************	乘累加,乘累减	***************
*********************************************/
//MADD,MADDU,MSUB,MSUBU指令
always @(*) begin
	if(rst == `RstEnable) begin
		hilo_temp_o <= {`ZeroWord, `ZeroWord};
		cnt_o <= 2'b00;
		stallreq_for_madd_msub <= `NoStop;
	end else begin
		case (aluop_i)
			`EXE_MADD_OP, `EXE_MADDU_OP: begin
				if (cnt_i==2'b00) begin //执行阶段第一个时钟周期
				//此时将乘法结果mulres通过接口hilo_temp_o输出到EX/MEM模块,以便在下一个时钟周期使用
				//同时,设置变量stallreq_for_madd_msub为Stop,表示乘累加指令请求流水线暂停
					hilo_temp_o <= mulres;
					cnt_o <= 2'b01;
					hilo_temp1 <= {`ZeroWord, `ZeroWord};
					stallreq_for_madd_msub <= `Stop;
				end else if(cnt_i==2'b01) begin //执行阶段第二个时钟周期
				//此时EX模块的输入hilo_temp_i就是上一个时钟周期得到的乘法结果,随意将hilo_temp_i与HI,LO寄存器的值相加,得到最终的运算结果保存到变量hilo_temp1中
				//同时,设置变量stallreq_for_madd_msub为NoStop,表示乘累加指令执行结束,不再请求流水线暂停
				//最后,设置cnt_o为2'b10,而不是直接设置为2'b00,目的:如果因为其他原因导致流水线保持暂停,那么由于cnt_o为2'b10,所以EX阶段不再计算,从而防止乘累加指令重复执行
					hilo_temp_o <= {`ZeroWord, `ZeroWord};
					cnt_o <= 2'b10;
					hilo_temp1 <= hilo_temp_i + {HI,LO};
					stallreq_for_madd_msub <= `NoStop;
				end
			end
			`EXE_MSUB_OP, `EXE_MSUBU_OP: begin
				if (cnt_i == 2'b00) begin //执行阶段第一个时钟周期
					hilo_temp_o <=  ~mulres + 1 ;
					cnt_o <= 2'b01;
					stallreq_for_madd_msub <= `Stop;
				end else if(cnt_i == 2'b01)begin //执行阶段第二个时钟周期
					hilo_temp_o <= {`ZeroWord,`ZeroWord};						
					cnt_o <= 2'b10;
					hilo_temp1 <= hilo_temp_i + {HI,LO};
					stallreq_for_madd_msub <= `NoStop;
				end				
			end
			default:	begin
				hilo_temp_o <= {`ZeroWord,`ZeroWord};
				cnt_o <= 2'b00;
				stallreq_for_madd_msub <= `NoStop;				
			end
		endcase
	end
end

/*****************************************
************	暂停流水线	***************
******************************************/
//截止7.8节,只有乘累加,乘累减指令会导致流水线暂停,所以stallreq就直接等于stallreq_for_madd_msub的值
always @ (*) begin
    stallreq = stallreq_for_madd_msub;
end

/***************************************************************************
************	得到最新的HI,LO寄存器的值,此处要解决数据相关问题	***************
****************************************************************************/
//首先判断当前处于访存阶段的指令是否要写HI,LO寄存器,即mem_whilo_o是否为WriteEnable,如果是,那么访存阶段的指令要写入的值就是HI,LO寄存器的最新值
//如果不是,那么回写阶段的指令要写入的值就是HI,LO指令的最新值,如果不是,那么从HILO模块输入的值hi_i,lo_i就是HI,LO寄存器的最新值
always @(*) begin
	if(rst == `RstEnable) begin
		{HI, LO} <= {`ZeroWord, `ZeroWord};
	end else if(mem_whilo_i == `WriteEnable) begin
		{HI, LO} <= {mem_hi_i, mem_lo_i}; //访存阶段的指令要写HI,LO寄存器
	end else if(wb_whilo_i == `WriteEnable) begin
		{HI, LO} <= {wb_hi_i, wb_lo_i}; //回写阶段的指令要写HI,LO寄存器
	end else begin
		{HI, LO} <= {hi_i, lo_i};
	end
end
/*****************************************************
************	MFHI,MFLO,MOBN,MOVZ指令	***************
******************************************************/
//针对不同的移动操作指令,确定moveres的值
always @(*) begin
	if(rst == `RstEnable) begin
		moveres <= `ZeroWord;
	end else begin
		moveres <= `ZeroWord;
		case (aluop_i)
			`EXE_MFHI_OP: begin //如果是mfhi指令,那么将HI的值作为移动操作的结果
				moveres <= HI;
			end
			`EXE_MFLO_OP: begin //如果是mflo指令,那么将LO的值作为移动操作的结果
				moveres <= LO;
			end
			`EXE_MOVZ_OP: begin
				moveres <= reg1_i; //如果是movn指令,那么将reg1_i的值作为移动操作的结果
			end
			default : begin
				
			end
		endcase
	end
end

/**********************************************************
************	根据aluop指示的子类型进行运算	***************
***********************************************************/

//进行逻辑运算
always @ (*) begin
	if (rst == `RstEnable) begin
		logicout <= `ZeroWord;
	end else begin
		// 子类型运算
		case (aluop_i)
			`EXE_OR_OP: begin
				logicout <= reg1_i | reg2_i;
			end
			`EXE_AND_OP: begin
				logicout <= reg1_i & reg2_i;
			end
			`EXE_NOR_OP: begin
				logicout <= reg1_i ^ reg2_i;
			end
			default: begin
				logicout <= `ZeroWord;
			end
		endcase
	end
end 

//进行移位运算
always @(*) begin
	if(rst == `RstEnable) begin
		shiftres <= `ZeroWord;
	end else begin
		case (aluop_i)
			`EXE_SLL_OP: begin
				shiftres <= reg2_i << reg1_i[4:0];
			end
			`EXE_SRL_OP: begin
				shiftres <= reg2_i >> reg1_i[4:0];
			end
			`EXE_SRA_OP: begin
				shiftres <= ({32{reg2_i[31]}}<<(6'd32-{1'b0,reg1_i[4:0]})) | reg2_i >> reg1_i[4:0];
			end
			default :begin
				shiftres <= `ZeroWord;
			end	
		endcase
	end
end

/*************************************************************
**	根据运算类型alusel_i的值确定wdata_o的值,即要写回寄存器的数据   **
**************************************************************/
always @ (*) begin
    //wreg_o,wd_o均来自译码阶段,不需要改变
	wd_o <= wd_i; //直接把要写回的寄存器地址向后传递
	//如果是add,addi,sub,subi指令且发生溢出,那么设置wreg_o为WriteDisable,表示不写回目的寄存器
	if(((aluop_i==`EXE_ADD_OP) || (aluop_i==`EXE_ADDI_OP) || (aluop_i==`EXE_SUB_OP)) && (ov_sum==1'b1)) begin
		wreg_o <= `WriteDisable;
	end else begin
		wreg_o <= wreg_i;
	end
	
    //wdata_o要依据运算类型进行选择,如果是逻辑运算,将logicout的值付给wdata_o.当以后添加其他类型的指令时,只需修改这里的case
	// 回写数据
	case (alusel_i)
		`EXE_RES_LOGIC: begin
			// 将逻辑运算作为最终结果
			wdata_o <= logicout;
		end
		`EXE_RES_SHIFT: begin
			wdata_o <= shiftres;
		end
		`EXE_RES_MOVE: begin
			wdata_o <= moveres;
		end
		`EXE_RES_ARITHMETIC: begin
			wdata_o <= arithmeticres;
		end
		`EXE_RES_MUL: begin
			wdata_o <= mulres[31:0];
		end
		default: begin
			wdata_o <= `ZeroWord;
		end
	endcase
end


/*************************************************************
**	确定对HI,LO寄存器的操作信息   **
**************************************************************/
always @(*) begin
	if(rst == `ReadEnable) begin
		whilo_o <= `WriteDisable;
		hi_o <= `ZeroWord;
		lo_o <= `ZeroWord;
	end else if((aluop_i == `EXE_MULT_OP) || (aluop_i == `EXE_MULTU_OP)) begin
		whilo_o <= `WriteEnable;
		hi_o <= mulres[63:32];
		lo_o <= mulres[31:0];
	end else if((aluop_i == `EXE_MADD_OP) || (aluop_i == `EXE_MADDU_OP)) begin
		whilo_o <= `WriteEnable;
		hi_o <= hilo_temp1[63:32];
		lo_o <= hilo_temp1[31:0];
	end else if((aluop_i == `EXE_MSUB_OP) || (aluop_i == `EXE_MSUBU_OP)) begin
		whilo_o <= `WriteEnable;
		hi_o <= hilo_temp1[63:32];
		lo_o <= hilo_temp1[31:0];
	end else if(aluop_i == `EXE_MTHI_OP) begin
		whilo_o <= `WriteEnable;
		hi_o <= reg1_i;
		lo_o <= LO; //写HI寄存器,LO保持不变
	end else if(aluop_i == `EXE_MTLO_OP) begin
		whilo_o <= `WriteDisable;
		hi_o <= `ZeroWord;
		lo_o <= `ZeroWord;
	end
end

endmodule


