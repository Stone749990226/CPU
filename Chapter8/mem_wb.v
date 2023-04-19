/*!
 * MEM/WB模块 访存/回写 模块
 *	功能：接受来自mem信号，传递到wb模块
 *  这是一个时序逻辑电路
 *  回写阶段实际上是在Regfile中实现的
*/
`include "defines.v"
module mem_wb(
	input wire rst,
	input wire clk,
	
	// 来自mem的信号
	input wire[4:0] mem_wd,			// 要写回的目的寄存器地址		
	input wire mem_wreg,				// 是否写回
	input wire[31:0] mem_wdata,	// 讲什么数据写回
	input wire[`RegBus] mem_hi, 
	input wire[`RegBus] mem_lo, 
	input wire mem_whilo, 
	
	input  wire[5:0] stall,

	// 传递给wb模块
	output reg[4:0] wb_wd,			
	output reg wb_wreg,			
	output reg[31:0] wb_wdata,
	output reg[`RegBus] wb_hi, 
	output reg[`RegBus] wb_lo, 
	output reg wb_whilo
);

always @ (posedge clk) begin
	if (rst == `RstEnable) begin
		wb_wd <= `NOPRegAddr;			
		wb_wreg <= `WriteDisable;		
		wb_wdata <= `ZeroWord;	
		wb_hi <= `ZeroWord;
		wb_lo <= `ZeroWord;
		wb_whilo <= `WriteDisable;
	end else if(stall[4] == `Stop && stall[5] == `NoStop) begin
		wb_wd <= `NOPRegAddr;
		wb_wreg <= `WriteDisable;
		wb_wdata <= `ZeroWord;	
		wb_hi <= `ZeroWord;
		wb_lo <= `ZeroWord;
		wb_whilo <= `WriteDisable;
	end else if(stall[4] == `NoStop) begin
		wb_wd <= mem_wd;			
		wb_wreg <= mem_wreg;		
		wb_wdata <= mem_wdata;
		wb_hi <= mem_hi;
		wb_lo <= mem_lo;
		wb_whilo <= mem_whilo;
	end
end

endmodule
