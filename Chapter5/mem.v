/*！
 * 访存
 * 作用：单条ori指令：因为不需要访问RAM，所以只需要简单的将信号传递下去即可
 * 只有一个组合逻辑电路,将输入的执行阶段的结果直接作为输出
*/
`include "defines.v"
module mem(
	input wire rst,
	
	// 来自ex_mem的信号
	input wire[4:0] wd_i,		// 要写回的目的寄存器地址
	input wire wreg_i,			// 是否写回
	input wire[31:0] wdata_i,	// 将写回的数据
	
	// 传给mem_wb模块            
	output reg[4:0] wd_o,		//要写回的目的寄存器地址
	output reg wreg_o,			//是否写回
	output reg[31:0] wdata_o    //将写回的数据
);

always @ (*) begin
	if (rst == `RstEnable) begin
		wd_o <= `NOPRegAddr;	
		wreg_o <= `WriteDisable;	
		wdata_o <= `ZeroWord;
	end else begin
		wd_o <= wd_i;	
		wreg_o <= wreg_i;	
		wdata_o <= wdata_i;
	end
end

endmodule