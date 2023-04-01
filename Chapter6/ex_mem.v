/*!
 * EX/MEMģ��
 * ���ã��ݴ���Ϣ���ȴ�ʱ���źź���Ϣת����MEMģ��
 * ֻ��һ��ʱ���߼���·,��ʱ�������ؽ�ִ�н׶εĽ�����ݵ��ô�׶�
*/
`include "defines.v"
module ex_mem(
	input wire rst,
	input wire clk,
	
	// ��������ex���ź�
	input wire[4:0] ex_wd,		// Ҫд�ص�Ŀ�ļĴ�����ַ
	input wire ex_wreg,			// �Ƿ�д��
	input wire[31:0] ex_wdata,	// ��ʲô����д��
	
	// ת���źŵ�memģ��
	output reg[4:0] mem_wd,		//�ô�׶ε�ָ��Ҫд���Ŀ�ļĴ�����ַ
	output reg mem_wreg,	    //�ô�׶ε�ָ��Ҫ�Ƿ���Ҫд���Ŀ�ļĴ���
	output reg[31:0] mem_wdata  //�ô�׶ε�ָ��Ҫд��Ŀ�ļĴ�����ֵ
);

// ����������ʱ���źžͽ��ź�ת����memģ��
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