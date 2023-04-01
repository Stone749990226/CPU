/*!
 * MEM/WBģ�� �ô�/��д ģ��
 *	���ܣ���������mem�źţ����ݵ�wbģ��
 *  ����һ��ʱ���߼���·
 *  ��д�׶�ʵ��������Regfile��ʵ�ֵ�
*/
`include "defines.v"
module mem_wb(
	input wire rst,
	input wire clk,
	
	// ����mem���ź�
	input wire[4:0] mem_wd,			// Ҫд�ص�Ŀ�ļĴ�����ַ		
	input wire mem_wreg,				// �Ƿ�д��
	input wire[31:0] mem_wdata,	// ��ʲô����д��
	
	// ���ݸ�wbģ��
	output reg[4:0] wb_wd,			
	output reg wb_wreg,			
	output reg[31:0] wb_wdata	
);

always @ (posedge clk) begin
	if (rst == `RstEnable) begin
		wb_wd <= `NOPRegAddr;			
		wb_wreg <= `WriteDisable;		
		wb_wdata <= `ZeroWord;	
	end else begin
		wb_wd <= mem_wd;			
		wb_wreg <= mem_wreg;		
		wb_wdata <= mem_wdata;
	end
end

endmodule
