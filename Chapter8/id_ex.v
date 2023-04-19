/*!
 * ID/EX模块
 *	作用：将id模块的输出连接到ID/EX模块，即将译码阶段取得的运算类型,源操作数,要写的目的寄存器地址等结果在下一个时钟传递到执行模块（EX）
*/
`include "defines.v"
module id_ex(
	// 控制信息
	input wire rst,
	input wire clk,
	
	//从执行阶段获得的信息
	input wire[7:0] id_aluop,		// 运算子类型
	input wire[2:0] id_alusel,	// 运算类型	
	input wire[4:0] id_wd,			// EX（执行）后要写入的目的寄存器地址
	input wire id_wreg,				// 是否有要写入的目的寄存器	
	input wire[31:0] id_reg1,		// 传原操作数1给EX
	input wire[31:0] id_reg2,		// 传原操作数2给EX

	input  wire [5:0] stall,
	
	// 第八章新增
	input wire[`RegBus]           id_link_address,   //处于译码阶段的转移指令要保存的返回地址
	input wire                    id_is_in_delayslot,//当前处于译码阶段的指令是否位于延迟槽
	input wire                    next_inst_in_delayslot_i,	//下一条进入译码阶段的指令是否位于延迟槽
	// 传给EX
	output reg[7:0] ex_aluop,	// 运算子类型
	output reg[2:0] ex_alusel,	// 运算类型
	output reg[4:0] ex_wd,		// EX（执行）后要写入的目的寄存器地址
	output reg ex_wreg,			// 是否有要写入的目的寄存器
	output reg[31:0] ex_reg1,	// 传原操作数1给EX
	output reg[31:0] ex_reg2,	// 传原操作数2给EX
	//第八章新增
	output reg[`RegBus]           ex_link_address,    //当前处于执行阶段的转移指令要保存的返回地址
  	output reg                    ex_is_in_delayslot, //当前处于执行阶段的指令是否位于延迟槽
	output reg                    is_in_delayslot_o	  //当前处于译码阶段的指令是否位于延迟槽
);

always @ (posedge clk) begin	// 上升沿触发
	if (rst == `RstEnable) begin
		ex_aluop <= `EXE_NOP_OP;	
		ex_alusel <= `EXE_RES_NOP;	
		ex_wd <= `NOPRegAddr;		
		ex_wreg <= `WriteDisable;			
		ex_reg1 <= `ZeroWord;	
		ex_reg2 <= `ZeroWord;	
		ex_link_address <= `ZeroWord;
		ex_is_in_delayslot <= `NotInDelaySlot;
	    is_in_delayslot_o <= `NotInDelaySlot;	
	end else if (stall[2] == `Stop && stall[3] == `NoStop) begin //当stall[2]为Stop,stall[3]为NoStop时,表示译码阶段暂停,而执行阶段继续,所以使用空指令作为下一个周期进入执行阶段的指令
		ex_aluop <= `EXE_NOP_OP;
		ex_alusel <= `EXE_RES_NOP;
		ex_reg1 <= `ZeroWord;
		ex_reg2 <= `ZeroWord;
		ex_wd <= `NOPRegAddr;
		ex_wreg <= `WriteDisable;
		ex_wreg <= `WriteDisable;	
		ex_link_address <= `ZeroWord;
	    ex_is_in_delayslot <= `NotInDelaySlot;	
	end else if (stall[2] == `NoStop) begin //当stall[2]为Nostop时,译码阶段继续,译码后的指令进入执行阶段;其余情况下,保持执行阶段的寄存器ex_aluop,ex_alusel,ex_reg1,ex_reg2,ex_wd,ex_wreg不变
		ex_aluop <= id_aluop;
		ex_alusel <= id_alusel;	
		ex_wd <= id_wd;		
		ex_wreg <= id_wreg;			
		ex_reg1 <= id_reg1;	
		ex_reg2 <= id_reg2;
		ex_link_address <= id_link_address;
		ex_is_in_delayslot <= id_is_in_delayslot;
	    is_in_delayslot_o <= next_inst_in_delayslot_i;	
	end
end

endmodule

