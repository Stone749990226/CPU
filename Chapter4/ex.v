/*!
 * EXģ�� ִ��ָ��
 * ���ã���������Ľ������Դ������1��Դ������2����ָ��������
 *		  ִ�н׶ΰ���EX��EX/MEM����ģ��
 *        EXģ���ж�������߼���·
*/
`include "defines.v"
module ex(
	input wire rst,

	// ����׶��͵�ִ�н׶ε��ź�
	input wire[7:0] aluop_i,	// ����������
	input wire[2:0] alusel_i,	// ��������
	input wire[4:0] wd_i,		// EX��ִ�У���Ҫд���Ŀ�ļĴ�����ַ
	input wire wreg_i,			// �Ƿ���Ҫд���Ŀ�ļĴ���
	input wire[31:0] reg1_i,	// ���������Դ������1
	input wire[31:0] reg2_i,	// ���������Դ������2
	
	// ִ�н�������
	output reg[4:0] wd_o,		// Ҫд�ص�Ŀ�ļĴ�����ַ
	output reg wreg_o,			// �Ƿ�д��
	output reg[31:0] wdata_o	// ����ҪЭ��Ŀ�ļĴ�����ֵ
	
);

// �������ר�����������߼������������
reg[31:0] logicout;

/**********************************************************
************	����aluopָʾ�������ͽ�������	***************
***********************************************************/
always @ (*) begin
	if (rst == `RstEnable) begin
		logicout <= `ZeroWord;
	end else begin
		// ����������
		case (aluop_i)
			`EXE_OR_OP: begin
				logicout <= reg1_i | reg2_i;
			end
			default: begin
				logicout <= `ZeroWord;
			end
		endcase
	end
end 

/*************************************************************
**	�����������ͣ���ʵ���ǿ����費��Ҫ�����������أ���д�ؼĴ�����   **
**************************************************************/
always @ (*) begin
    //wreg_o,wd_o����������׶�,����Ҫ�ı�
	wd_o <= wd_i; //ֱ�Ӱ�ҪЭ��ļĴ�����ַ��󴫵�
	wreg_o <= wreg_i;
    //wdata_oҪ�����������ͽ���ѡ��,������߼�����,��logicout��ֵ����wdata_o.���Ժ�����������͵�ָ��ʱ,ֻ���޸������case
	// ��д����
	case (alusel_i)
		`EXE_RES_LOGIC: begin
			// ����д��ȥ
			wdata_o <= logicout;
		end
		default: begin
			wdata_o <= `ZeroWord;
		end
	endcase
	
end
endmodule
