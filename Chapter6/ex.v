
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
	//HILOģ�������HI,LO�Ĵ���
	input wire[`RegBus] hi_i,
	input wire[`RegBus] lo_i,
	input wire[`RegBus] wb_hi_i,
	input wire[`RegBus] wb_lo_i,
	input wire wb_whilo_i,
	input wire[`RegBus] mem_hi_i,
	input wire[`RegBus] mem_lo_i,
	input wire mem_whilo_i,
	
	// ִ�н�������
	output reg[4:0] wd_o,		// Ҫд�ص�Ŀ�ļĴ�����ַ
	output reg wreg_o,			// �Ƿ�д��
	output reg[31:0] wdata_o,	// ����ҪЭ��Ŀ�ļĴ�����ֵ
	//ִ�н׶�ΪHI,LO�Ĵ�����д����
	output reg[`RegBus] hi_o,
	output reg[`RegBus] lo_o,
	output reg whilo_o
);

// �������ר�����������߼������������
reg[31:0] logicout;
// �������ר������������λ�����������
reg[31:0] shiftres;
// �ƶ������Ľ��
reg[`RegBus] moveres;
// ����HI�Ĵ���������ֵ
reg[`RegBus] HI;
// ����LO�Ĵ���������ֵ
reg[`RegBus] LO;

/***************************************************************************
************	�õ����µ�HI,LO�Ĵ�����ֵ,�˴�Ҫ��������������	***************
****************************************************************************/
//�����жϵ�ǰ���ڷô�׶ε�ָ���Ƿ�ҪдHI,LO�Ĵ���,��mem_whilo_o�Ƿ�ΪWriteEnable,�����,��ô�ô�׶ε�ָ��Ҫд���ֵ����HI,LO�Ĵ���������ֵ
//�������,��ô��д�׶ε�ָ��Ҫд���ֵ����HI,LOָ�������ֵ,�������,��ô��HILOģ�������ֵhi_i,lo_i����HI,LO�Ĵ���������ֵ
always @(*) begin
	if(rst == `RstEnable) begin
		{HI, LO} <= {`ZeroWord, `ZeroWord};
	end else if(mem_whilo_i == `WriteEnable) begin
		{HI, LO} <= {mem_hi_i, mem_lo_i}; //�ô�׶ε�ָ��ҪдHI,LO�Ĵ���
	end else if(wb_whilo_i == `WriteEnable) begin
		{HI, LO} <= {wb_hi_i, wb_lo_i}; //��д�׶ε�ָ��ҪдHI,LO�Ĵ���
	end else begin
		{HI, LO} <= {hi_i, lo_i};
	end
end
/*****************************************************
************	MFHI,MFLO,MOBN,MOVZָ��	***************
******************************************************/
//��Բ�ͬ���ƶ�����ָ��,ȷ��moveres��ֵ
always @(*) begin
	if(rst == `RstEnable) begin
		moveres <= `ZeroWord;
	end else begin
		moveres <= `ZeroWord;
		case (aluop_i)
			`EXE_MFHI_OP: begin //�����mfhiָ��,��ô��HI��ֵ��Ϊ�ƶ������Ľ��
				moveres <= HI;
			end
			`EXE_MFLO_OP: begin //�����mfloָ��,��ô��LO��ֵ��Ϊ�ƶ������Ľ��
				moveres <= LO;
			end
			`EXE_MOVZ_OP: begin
				moveres <= reg1_i; //�����movnָ��,��ô��reg1_i��ֵ��Ϊ�ƶ������Ľ��
			end
			default : begin
				
			end
		endcase
	end
end

/**********************************************************
************	����aluopָʾ�������ͽ�������	***************
***********************************************************/

//�����߼�����
always @ (*) begin
	if (rst == `RstEnable) begin
		logicout <= `ZeroWord;
	end else begin
		// ����������
		case (aluop_i)
			`EXE_OR_OP: begin
				logicout <= reg1_i | reg2_i;
			end
			`EXE_AND_OP: begin
				logicout <= reg1_i & reg2_i;
			end
			`EXE_NOR_OP: begin
				logicout <= reg1_i ^ reg2_i;
			end
			default: begin
				logicout <= `ZeroWord;
			end
		endcase
	end
end 

//������λ����
always @(*) begin
	if(rst == `RstEnable) begin
		shiftres <= `ZeroWord;
	end else begin
		case (aluop_i)
			`EXE_SLL_OP: begin
				shiftres <= reg2_i << reg1_i[4:0];
			end
			`EXE_SRL_OP: begin
				shiftres <= reg2_i >> reg1_i[4:0];
			end
			`EXE_SRA_OP: begin
				shiftres <= ({32{reg2_i[31]}}<<(6'd32-{1'b0,reg1_i[4:0]})) | reg2_i >> reg1_i[4:0];
			end
			default :begin
				shiftres <= `ZeroWord;
			end	
		endcase
	end
end

/*************************************************************
**	������������alusel_i��ֵȷ��wdata_o��ֵ   **
**************************************************************/
always @ (*) begin
    //wreg_o,wd_o����������׶�,����Ҫ�ı�
	wd_o <= wd_i; //ֱ�Ӱ�Ҫд�صļĴ�����ַ��󴫵�
	wreg_o <= wreg_i;
    //wdata_oҪ�����������ͽ���ѡ��,������߼�����,��logicout��ֵ����wdata_o.���Ժ�����������͵�ָ��ʱ,ֻ���޸������case
	// ��д����
	case (alusel_i)
		`EXE_RES_LOGIC: begin
			// ���߼�������Ϊ���ս��
			wdata_o <= logicout;
		end
		`EXE_RES_SHIFT: begin
			wdata_o <= shiftres;
		end
		`EXE_RES_MOVE: begin
			wdata_o <= moveres;
		end
		default: begin
			wdata_o <= `ZeroWord;
		end
	endcase
end


/*************************************************************
**	�����MTHI,MTLOָ��,��ô��Ҫ����whilo_o,hi_o,lo_i��ֵ   **
**************************************************************/
always @(*) begin
	if(rst == `ReadEnable) begin
		whilo_o <= `WriteDisable;
		hi_o <= `ZeroWord;
		lo_o <= `ZeroWord;
	end else if(aluop_i == `EXE_MTHI_OP) begin
		whilo_o <= `WriteEnable;
		hi_o <= reg1_i;
		lo_o <= LO; //дHI�Ĵ���,LO���ֲ���
	end else if(aluop_i == `EXE_MTLO_OP) begin
		whilo_o <= `WriteDisable;
		hi_o <= `ZeroWord;
		lo_o <= `ZeroWord;
	end
end

endmodule


