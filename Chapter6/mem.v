/*��
 * �ô�
 * ���ã�����oriָ���Ϊ����Ҫ����RAM������ֻ��Ҫ�򵥵Ľ��źŴ�����ȥ����
 * ֻ��һ������߼���·,�������ִ�н׶εĽ��ֱ����Ϊ���
*/
`include "defines.v"
module mem(
	input wire rst,
	
	// ����ex_mem���ź�
	input wire[4:0] wd_i,		// Ҫд�ص�Ŀ�ļĴ�����ַ
	input wire wreg_i,			// �Ƿ�д��
	input wire[31:0] wdata_i,	// ��д�ص�����
	
	// ����mem_wbģ��            
	output reg[4:0] wd_o,		//Ҫд�ص�Ŀ�ļĴ�����ַ
	output reg wreg_o,			//�Ƿ�д��
	output reg[31:0] wdata_o    //��д�ص�����
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