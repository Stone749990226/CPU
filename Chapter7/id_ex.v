/*!
 * ID/EXģ��
 *	���ã���idģ���������ӵ�ID/EXģ�飬��������׶�ȡ�õ���������,Դ������,Ҫд��Ŀ�ļĴ�����ַ�Ƚ������һ��ʱ�Ӵ��ݵ�ִ��ģ�飨EX��
*/
`include "defines.v"
module id_ex(
	// ������Ϣ
	input wire rst,
	input wire clk,
	
	//��ִ�н׶λ�õ���Ϣ
	input wire[7:0] id_aluop,		// ����������
	input wire[2:0] id_alusel,	// ��������	
	input wire[4:0] id_wd,			// EX��ִ�У���Ҫд���Ŀ�ļĴ�����ַ
	input wire id_wreg,				// �Ƿ���Ҫд���Ŀ�ļĴ���	
	input wire[31:0] id_reg1,		// ��ԭ������1��EX
	input wire[31:0] id_reg2,		// ��ԭ������2��EX

	input  wire [5:0] stall,
	
	// ����EX
	output reg[7:0] ex_aluop,	// ����������
	output reg[2:0] ex_alusel,	// ��������
	output reg[4:0] ex_wd,		// EX��ִ�У���Ҫд���Ŀ�ļĴ�����ַ
	output reg ex_wreg,			// �Ƿ���Ҫд���Ŀ�ļĴ���
	output reg[31:0] ex_reg1,	// ��ԭ������1��EX
	output reg[31:0] ex_reg2	// ��ԭ������2��EX
);

always @ (posedge clk) begin	// �����ش���
	if (rst == `RstEnable) begin
		ex_aluop <= `EXE_NOP_OP;	
		ex_alusel <= `EXE_RES_NOP;	
		ex_wd <= `NOPRegAddr;		
		ex_wreg <= `WriteDisable;			
		ex_reg1 <= `ZeroWord;	
		ex_reg2 <= `ZeroWord;	
	end else if (stall[2] == `Stop && stall[3] == `NoStop) begin //��stall[2]ΪStop,stall[3]ΪNoStopʱ,��ʾ����׶���ͣ,��ִ�н׶μ���,����ʹ�ÿ�ָ����Ϊ��һ�����ڽ���ִ�н׶ε�ָ��
		ex_aluop <= `EXE_NOP_OP;
		ex_alusel <= `EXE_RES_NOP;
		ex_reg1 <= `ZeroWord;
		ex_reg2 <= `ZeroWord;
		ex_wd <= `NOPRegAddr;
		ex_wreg <= `WriteDisable;
	end else if (stall[2] == `NoStop) begin //��stall[2]ΪNosʱ,����׶μ���,������ָ�����ִ�н׶�;���������,����ִ�н׶εļĴ���ex_aluop,ex_alusel,ex_reg1,ex_reg2,ex_wd,ex_wreg����
		ex_aluop <= id_aluop;
		ex_alusel <= id_alusel;	
		ex_wd <= id_wd;		
		ex_wreg <= id_wreg;			
		ex_reg1 <= id_reg1;	
		ex_reg2 <= id_reg2;
	end
end

endmodule
