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
// 移动操作指令
`define EXE_MOVN		6'b001011
`define EXE_MOVZ		6'b001010
`define EXE_MFHI		6'b010000
`define EXE_MFLO		6'b010010
`define EXE_MTHI		6'b010001
`define EXE_MTLO		6'b010011
`define EXE_RES_MOVE	3'b011			// 移动操作指令
/*!
 * EX/MEM模块
 * 作用：暂存信息，等待时钟信号后将信息转发给MEM模块
 * 只有一个时序逻辑电路,在时钟上升沿将执行阶段的结果传递到访存阶段
*/
`include "defines.v"
module ex_mem(
	input wire rst,
	input wire clk,
	
	// 接收来自ex的信号
	input wire[4:0] ex_wd,		// 要写回的目的寄存器地址
	input wire ex_wreg,			// 是否写回
	input wire[31:0] ex_wdata,	// 讲什么数据写回

	input wire[`RegBus] ex_hi,
	input wire[`RegBus] ex_lo,
	input wire ex_whilo,

	input  wire [5:0] stall,
	
	input wire[`DoubleRegBus]     hilo_i,	//保存的乘法结果
	input wire[1:0]               cnt_i,    //下一个时钟周期是执行阶段的第几个时钟周期

	// 转发信号到mem模块
	output reg[4:0] mem_wd,		//访存阶段的指令要写入的目的寄存器地址
	output reg mem_wreg,	    //访存阶段的指令要是否有要写入的目的寄存器
	output reg[31:0] mem_wdata,  //访存阶段的指令要写入目的寄存器的值
	output reg[`RegBus] mem_hi,
	output reg[`RegBus] mem_lo,
	output reg mem_whilo,

	output reg[`DoubleRegBus]    hilo_o,  //保存的乘法结果
	output reg[1:0]              cnt_o	  //当前处于执行阶段的第几个时钟周期
);

// 遇到上升沿时钟信号就将信号转发到mem模块
always @ (posedge clk) begin
	if (rst == `RstEnable) begin
		mem_wd <= `NOPRegAddr;
		mem_wreg <= `WriteDisable;
		mem_wdata <= `ZeroWord;
		mem_hi <= `ZeroWord;
		mem_lo <= `ZeroWord;
		mem_whilo <= `WriteDisable;
		hilo_o <= {`ZeroWord, `ZeroWord};
		cnt_o <= 2'b00;	
	end else if(stall[3] == `Stop && stall[4] == `NoStop) begin //当stall[3]为Stop,stall[4]为NoStop时,表示执行阶段暂停,而访存阶段继续,所以使用空指令作为下一个周期进入访存阶段的指令
		mem_wd <= `NOPRegAddr;
		mem_wreg <= `WriteDisable;
		mem_wdata <= `ZeroWord;
		mem_hi <= `ZeroWord;
		mem_lo <= `ZeroWord;
		mem_whilo <= `WriteDisable;
		hilo_o <= hilo_i;
		cnt_o <= cnt_i;	
	end else if (stall[3] == `NoStop) begin
		mem_wd <= ex_wd;
		mem_wreg <= ex_wreg;
		mem_wdata <= ex_wdata;
		mem_hi <= ex_hi;
		mem_lo <= ex_lo;
		mem_whilo <= ex_whilo;
		hilo_o <= {`ZeroWord, `ZeroWord};
		cnt_o <= 2'b00;
	end else begin
	    hilo_o <= hilo_i;
		cnt_o <= cnt_i;											
	end 

end

endmodule