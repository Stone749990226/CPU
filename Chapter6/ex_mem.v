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
	
	// 转发信号到mem模块
	output reg[4:0] mem_wd,		//访存阶段的指令要写入的目的寄存器地址
	output reg mem_wreg,	    //访存阶段的指令要是否有要写入的目的寄存器
	output reg[31:0] mem_wdata  //访存阶段的指令要写入目的寄存器的值
);

// 遇到上升沿时钟信号就将信号转发到mem模块
always @ (posedge clk) begin
	if (rst == `RstEnable) begin
		mem_wd <= `NOPRegAddr;
		mem_wreg <= `WriteDisable;
		mem_wdata <= `ZeroWord;
	end else begin
		mem_wd <= ex_wd;
		mem_wreg <= ex_wreg;
		mem_wdata <= ex_wdata;
	end
end

endmodule