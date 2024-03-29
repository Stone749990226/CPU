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
`define EXE_RES_JUMP_BRANCH 3'b110
`define EXE_RES_NOP 3'b000
`define EXE_RES_ARITHMETIC  3'b100      // 算数操作指令
`define EXE_RES_MOVE	3'b011			// 移动操作指令
`define EXE_RES_MUL 3'b101
`define EXE_RES_SHIFT 	3'b010			// 移位运算

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
`define EXE_REGIMM_INST 6'b000001

// 移动操作指令
`define EXE_MOVN		6'b001011
`define EXE_MOVZ		6'b001010
`define EXE_MFHI		6'b010000
`define EXE_MFLO		6'b010010
`define EXE_MTHI		6'b010001
`define EXE_MTLO		6'b010011


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

//第八章:分支指令
`define EXE_J  6'b000010
`define EXE_JAL  6'b000011
`define EXE_JALR  6'b001001
`define EXE_JR  6'b001000
`define EXE_BEQ  6'b000100
`define EXE_BGEZ  5'b00001
`define EXE_BGEZAL  5'b10001
`define EXE_BGTZ  6'b000111
`define EXE_BLEZ  6'b000110
`define EXE_BLTZ  5'b00000
`define EXE_BLTZAL  5'b10000
`define EXE_BNE  6'b000101

`define EXE_AND_OP   	8'b00100100
`define EXE_OR_OP    	8'b00100101
`define EXE_XOR_OP  	8'b00100110
`define EXE_NOR_OP  	8'b00100111
`define EXE_LUI_OP  	8'b01011100 
`define EXE_SLL_OP  	8'b01111100 
`define EXE_SRL_OP  	8'b00000010
`define EXE_SRA_OP		8'b00000011

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

`define EXE_J_OP  8'b01001111
`define EXE_JAL_OP  8'b01010000
`define EXE_JALR_OP  8'b00001001
`define EXE_JR_OP  8'b00001000
`define EXE_BEQ_OP  8'b01010001
`define EXE_BGEZ_OP  8'b01000001
`define EXE_BGEZAL_OP  8'b01001011
`define EXE_BGTZ_OP  8'b01010100
`define EXE_BLEZ_OP  8'b01010011
`define EXE_BLTZ_OP  8'b01000000
`define EXE_BLTZAL_OP  8'b01001010
`define EXE_BNE_OP  8'b01010010

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

//第八章新增
`define Branch 1'b1
`define NotBranch 1'b0
`define InterruptAssert 1'b1
`define InterruptNotAssert 1'b0
`define TrapAssert 1'b1
`define TrapNotAssert 1'b0