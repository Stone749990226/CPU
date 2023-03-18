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

//指令ori的指令码
`define EXE_ORI 6'b001101 
`define EXE_NOP 6'b000000 

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