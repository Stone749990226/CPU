//��λ�ź�
`define RstEnable 1'b1 
`define RstDisable 1'b0

//32λ����ֵ0
`define ZeroWord 32'h00000000 

//дʹ��
`define WriteEnable 1'b1 
`define WriteDisable 1'b0

//��ʹ��
`define ReadEnable 1'b1 
`define ReadDisable 1'b0

//����׶ε����aluop_o�Ŀ��
`define AluOpBus 7:0 
//����׶ε����alusel_o�Ŀ��
`define AluSelBus 2:0 

//ָ����Ч�ź�
`define InstValid 1'b0 
`define InstInvalid 1'b1 

//�߼����
`define True_v 1'b1 
`define False_v 1'b0

//оƬʹ��
`define ChipEnable 1'b1 
`define ChipDisable 1'b0 

//AluOp
`define EXE_OR_OP 8'b00100101
`define EXE_NOP_OP 8'b00000000

//AluSel
`define EXE_RES_LOGIC 3'b001

`define EXE_RES_NOP 3'b000

//**********��ָ��洢��ROM�йصĺ궨��**********
//ROM�ĵ�ַ���߿��
`define InstAddrBus 31:0
//ROM���������߿��
`define InstBus 31:0
//ROM��ʵ�ʴ�СΪ128kb
`define InstMemNum 131071
//ROMʵ��ʹ�õĵ�ַ��
`define InstMemNumLog2 17

//**********��ͨ�üĴ���Regfile�йصĺ궨��**********
//Regfile�ĵ�ַ�߿��
`define RegAddrBus 4:0
//Regfileģ��������߿��
`define RegBus 31:0
//ͨ�üĴ����Ŀ��
`define RegWidth 32
//������ͨ�üĴ����Ŀ��
`define DoubleRegWidth 64
//������ͨ�üĴ��������ߵĿ��
`define DoubleRegBus 63:0
//ͨ�üĴ�������
`define RegNum 32
//Ѱַͨ�üĴ���ʹ�õĵ�ַλ��
`define RegNumLog2 5
`define NOPRegAddr 5'b00000

// ָ���루op��
`define EXE_NOP			6'b000000		// �ղ���
`define EXE_ORI			6'b001101		// oriָ����
`define EXE_ANDI		6'b001100		// andi
`define EXE_XORI		6'b001110		// xori
`define EXE_LUI			6'b001111		// lui

// �����루op3��
`define EXE_AND			6'b100100		// andָ��
`define EXE_OR			6'b100101		// orָ��
`define EXE_XOR			6'b100110		// xorָ��
`define EXE_NOR			6'b100111		// norָ��

// �߼�ָ�� �߼����ơ��߼����ơ��������ƣ��ƶ�λ����ָ���ģ�Ϊ6~10λ��
`define EXE_SLL			6'b000000		// sllָ��
`define EXE_SRL  		6'b000010
`define EXE_SRA			6'b000011

// ��λָ���ָ���ƶ�λ������rt�Ĵ����е�ֵ�ƶ�rsλ���ŵ�rd�С�
`define EXE_SLLV		6'b000100
`define EXE_SRLV		6'b000110
`define EXE_SRAV		6'b000111


`define EXE_SYNC		6'b001111//syncָ��Ĺ�����
`define EXE_PREF        6'b110011//prefָ���ָ����

`define EXE_SPECIAL_INST 6'b000000//SPECIAL����ָ���ָ����
`define EXE_SPECIAL2_INST 6'b011100
`define EXE_RES_ARITHMETIC  3'b100      // ��������ָ��
`define EXE_REGIMM_INST 6'b000001

// �ƶ�����ָ��
`define EXE_MOVN		6'b001011
`define EXE_MOVZ		6'b001010
`define EXE_MFHI		6'b010000
`define EXE_MFLO		6'b010010
`define EXE_MTHI		6'b010001
`define EXE_MTLO		6'b010011
`define EXE_RES_MOVE	3'b011			// �ƶ�����ָ��
`define EXE_RES_MUL 3'b101

// ��������ָ��
`define EXE_ADD         6'b100000
`define EXE_ADDU        6'b100001
`define EXE_SUB         6'b100010
`define EXE_SUBU        6'b100011
`define EXE_SLT         6'b101010
`define EXE_SLTU        6'b101011
`define EXE_CLZ         6'b100000
`define EXE_CLO         6'b100001
`define EXE_MUL         6'b000010
`define EXE_MULT        6'b011000
`define EXE_MULTU       6'b011001
`define EXE_MADD  6'b000000
`define EXE_MADDU  6'b000001
`define EXE_MSUB  6'b000100
`define EXE_MSUBU  6'b000101


`define EXE_AND_OP   	8'b00100100
`define EXE_OR_OP    	8'b00100101
`define EXE_XOR_OP  	8'b00100110
`define EXE_NOR_OP  	8'b00100111
`define EXE_LUI_OP  	8'b01011100 
`define EXE_SLL_OP  	8'b01111100 
`define EXE_SRL_OP  	8'b00000010
`define EXE_SRA_OP		8'b00000011
`define EXE_RES_SHIFT 	3'b010			// ��λ����
// �ƶ�����ָ��
`define EXE_MOVN_OP		8'b00001011
`define EXE_MOVZ_OP		8'b00001010
`define EXE_MFHI_OP		8'b00010000
`define EXE_MFLO_OP		8'b00010010
`define EXE_MTHI_OP		8'b00010001
`define EXE_MTLO_OP		8'b00010011

`define EXE_ADD_OP      8'b10000000
`define EXE_ADDI_OP     8'b10000001
`define EXE_ADDU_OP     8'b10000010
`define EXE_SUB_OP      8'b10000011
`define EXE_SUBU_OP     8'b10000100
`define EXE_ADDIU_OP    8'b10000101
`define EXE_SLT_OP      8'b10000110
`define EXE_SLTU_OP     8'b10000111
`define EXE_SLTI_OP     8'b10001000  
`define EXE_SLTIU_OP    8'b10001001
`define EXE_CLZ_OP      8'b10001010
`define EXE_CLO_OP      8'b10001011
`define EXE_MUL_OP      8'b10001100
`define EXE_MULT_OP     8'b10001101
`define EXE_MULTU_OP    8'b10001110
`define EXE_MADD_OP     8'b10100110
`define EXE_MADDU_OP    8'b10101000
`define EXE_MSUB_OP     8'b10101010
`define EXE_MSUBU_OP    8'b10101011

`define EXE_MADD_OP  8'b10100110
`define EXE_MADDU_OP  8'b10101000
`define EXE_MSUB_OP  8'b10101010
`define EXE_MSUBU_OP  8'b10101011

// ������Iָ�����������ָ��Ĳ�����
`define EXE_ADDI        6'b001000
`define EXE_ADDIU       6'b001001
`define EXE_SLTI        6'b001010
`define EXE_SLTIU       6'b001011

//��ˮ����ͣ
`define Stop 1'b1   
//��ˮ�߼���         
`define NoStop 1'b0
`define InDelaySlot 1'b1
`define NotInDelaySlot 1'b0
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

	//��7.8.2������
	input wire[`DoubleRegBus] hilo_temp_i, //��һ��ִ�����ڵõ��ĳ˷����
	input wire[1:0]               cnt_i,   //��ǰ����ִ�н׶εĵڼ���ʱ������


	// ִ�н�������
	output reg[4:0] wd_o,		// Ҫд�ص�Ŀ�ļĴ�����ַ
	output reg wreg_o,			// �Ƿ�д��
	output reg[31:0] wdata_o,	// ����ҪЭ��Ŀ�ļĴ�����ֵ
	//ִ�н׶�ΪHI,LO�Ĵ�����д����
	output reg[`RegBus] hi_o,
	output reg[`RegBus] lo_o,
	output reg whilo_o,

	//��7.8.2������
	output reg[`DoubleRegBus]     hilo_temp_o, //��һ��ִ�����ڵõ��ĳ˷����
	output reg[1:0]               cnt_o,	   //��һ��ʱ�����ڴ���ִ�н׶εĵڼ���ʱ������
	output reg					  stallreq  
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

//��7���¶���ı���
wire ov_sum; //ָʾ�Ӽ���������
wire reg1_eq_reg2; //��һ���������Ƿ���ڵڶ���������
wire reg1_lt_reg2; //��һ���������Ƿ�С�ڵڶ���������
reg[`RegBus] arithmeticres; //������������Ľ��,resΪresult
wire[`RegBus] reg2_i_mux; //��������ĵڶ���������reg2_i�Ĳ���
wire[`RegBus] reg1_i_not; //��������ĵ�һ��������reg1_i��λȡ�����ֵ
wire[`RegBus] result_sum; //����Ӽ������
wire[`RegBus] opdata1_mult; //�˷������еı�����
wire[`RegBus] opdata2_mult; //�˷������еı�����
wire[`DoubleRegBus] hilo_temp; //��ʱ����˷����,���Ϊ64λ
reg[`DoubleRegBus] mulres; //����˷����,���Ϊ64λ

reg[`DoubleRegBus] hilo_temp1;
reg stallreq_for_madd_msub;	

//(1)����Ǽ��������з��űȽ�����,��ôreg2_i_mux���ڵڶ���������reg2_i�Ĳ���,����reg2_i_mux�͵��ڵڶ���������reg2_i
assign reg2_i_mux = ((aluop_i==`EXE_SUB_OP)||(aluop_i==`EXE_SUBU_OP)||(aluop_i==`EXE_SLT_OP)) ? (~reg2_i)+1 : reg2_i;
//(2)���������:
//a.����Ǽӷ�����,��ʱreg2_i_mux���ǵڶ���������reg2_i,����result_sum���Ǽӷ�����Ľ��
//b.����Ǽ�������,��ʱreg2_i_mux�ǵڶ���������reg2_i�Ĳ���,����result_sum���Ǽ�������Ľ��
//c.������з��űȽ�����,��ʱreg_2_i_muxҲ�ǵڶ���������reg2_i�Ĳ���,����result_sumҲ�Ǽ�������Ľ��,����ͨ���жϼ����Ľ���Ƿ�С��0�Ӷ��жϵ�һ��������reg1_i�Ƿ�С�ڵڶ���������reg2_i
assign result_sum = reg1_i + reg2_i_mux;
//(3)�����Ƿ����,�ӷ�ָ��(add��addi),����ָ��(sub)ִ�е�ʱ����Ҫ�ж��Ƿ����,���������������֮һʱ�����
//a.reg1_iΪ����,reg2_i_muxΪ����,��������֮��Ϊ����
//b.reg1_iΪ����,reg2_i_muxΪ����,��������֮��Ϊ����
assign ov_sum = ((!reg1_i[31] && !reg2_i_mux[31]) && result_sum[31]) || ((reg1_i[31] && reg2_i_mux[31]) && (!result_sum[31]));
//(4)���������1�Ƿ�С�ڲ�����2,���������
//a.aluop_iΪEXE_SLT_OP��ʾ�з��űȽ�����,��ʱ�ַ�Ϊ3�����
//	a1.reg1_iΪ����,reg2_iΪ����,��Ȼreg1_iС��reg2_i
//	a2.reg1_iΪ����,reg2_iΪ����,����reg1_i��ȥreg2_i��ֵС��0(��result_sumΪ��),��ʱҲ��reg1_iС��reg2_i
//  a3.reg1_iΪ����,reg2_iΪ����,����reg1_i��ȥreg2_i��ֵС��0(��result_sumΪ��),��ʱҲ��reg1_iС��reg2_i
//b.�޷������ıȽϵ�ʱ��,ֱ��ʹ�ñȽ�������Ƚ�reg1_i��rge2_i
assign reg1_lt_reg2 = ((aluop_i == `EXE_SLT_OP)) ? ((reg1_i[31] && !reg2_i[31]) || (!reg1_i[31] && !reg2_i[31] && result_sum[31]) || (reg1_i[31] && reg2_i[31] && result_sum[31])) : (reg1_i<reg2_i);
//(5)�Բ�����1��λȡ��,����reg1_i_not
assign reg1_i_not = ~reg1_i;


/***************************************************************************
************	���ݲ�ͬ��������������,��arithmeticres������ֵ	***************
****************************************************************************/
always @(*) begin
	if(rst == `RstEnable) begin
		arithmeticres <= `ZeroWord;
	end else begin
		case (aluop_i)
			`EXE_SLT_OP, `EXE_SLTU_OP: begin
				arithmeticres <= reg1_lt_reg2; // �Ƚ�����
			end 
			`EXE_ADD_OP, `EXE_ADDU_OP, `EXE_ADDI_OP, `EXE_ADDIU_OP: begin
				arithmeticres <= result_sum; //�ӷ�����
			end
			`EXE_SUB_OP, `EXE_SUBU_OP: begin
				arithmeticres <= result_sum;//��������
			end
			`EXE_CLZ_OP: begin
				arithmeticres <= reg1_i[31] ? 0 : 
								 reg1_i[30] ? 1 : 
								 reg1_i[29] ? 2 : 
								 reg1_i[28] ? 3 : 
								 reg1_i[27] ? 4 : 
								 reg1_i[26] ? 5 : 
								 reg1_i[25] ? 6 : 
								 reg1_i[24] ? 7 : 
								 reg1_i[23] ? 8 : 
								 reg1_i[22] ? 9 : 
								 reg1_i[21] ? 10 : 
								 reg1_i[20] ? 11 : 
								 reg1_i[19] ? 12 : 
								 reg1_i[18] ? 13 : 
								 reg1_i[17] ? 14 : 
								 reg1_i[16] ? 15 : 
								 reg1_i[15] ? 16 : 
								 reg1_i[14] ? 17 : 
								 reg1_i[13] ? 18 : 
								 reg1_i[12] ? 19 : 
								 reg1_i[11] ? 20 : 
								 reg1_i[10] ? 21 : 
								 reg1_i[9] ? 22 : 
								 reg1_i[8] ? 23 : 
								 reg1_i[7] ? 24 : 
								 reg1_i[6] ? 25 : 
								 reg1_i[5] ? 26 : 
								 reg1_i[4] ? 27 : 
								 reg1_i[3] ? 28 : 
								 reg1_i[2] ? 29 : 
								 reg1_i[1] ? 30 : 
								 reg1_i[0] ? 31 : 32;
			end
			`EXE_CLO_OP: begin
				arithmeticres <= reg1_i_not[31] ? 0 :
								 reg1_i_not[30] ? 1 :
								 reg1_i_not[29] ? 2 :
								 reg1_i_not[28] ? 3 :
								 reg1_i_not[27] ? 4 :
								 reg1_i_not[26] ? 5 :
								 reg1_i_not[25] ? 6 :
								 reg1_i_not[24] ? 7 :
								 reg1_i_not[23] ? 8 :
								 reg1_i_not[22] ? 9 :
								 reg1_i_not[21] ? 10 :
								 reg1_i_not[20] ? 11 :
								 reg1_i_not[19] ? 12 :
								 reg1_i_not[18] ? 13 :
								 reg1_i_not[17] ? 14 :
								 reg1_i_not[16] ? 15 :
								 reg1_i_not[15] ? 16 :
								 reg1_i_not[14] ? 17 :
								 reg1_i_not[13] ? 18 :
								 reg1_i_not[12] ? 19 :
								 reg1_i_not[11] ? 20 :
								 reg1_i_not[10] ? 21 :
								 reg1_i_not[9] ? 22 :
								 reg1_i_not[8] ? 23 :
								 reg1_i_not[7] ? 24 :
								 reg1_i_not[6] ? 25 :
								 reg1_i_not[5] ? 26 :
								 reg1_i_not[4] ? 27 :
								 reg1_i_not[3] ? 28 :
								 reg1_i_not[2] ? 29 :
								 reg1_i_not[1] ? 30 :
								 reg1_i_not[0] ? 31 : 32;
			end
			default: begin
				arithmeticres <= `ZeroWord;
			end
		endcase
	end
end

/********************************************
************	���г˷�����	***************
*********************************************/
//(1)ȡ�ó˷�����ı�����,������з��ų˷����ұ������Ǹ���,��ôȡ����
assign opdata1_mult = (((aluop_i==`EXE_MUL_OP) || (aluop_i==`EXE_MULT_OP) || (aluop_i==`EXE_MADD_OP) || (aluop_i==`EXE_MSUB_OP)) && (reg1_i[31]==1'b1)) ? (~reg1_i+1) : reg1_i;
//(2)ȡ�ó˷�����ĳ���,������з��ų˷��ҳ����Ǹ���,��ôȡ����
assign opdata2_mult = (((aluop_i==`EXE_MUL_OP) || (aluop_i==`EXE_MULT_OP) || (aluop_i==`EXE_MADD_OP) || (aluop_i==`EXE_MSUB_OP)) && (reg2_i[31]==1'b1)) ? (~reg2_i+1) : reg2_i;
//(3)�õ���ʱ�˷����,�����ڱ���hilo_temp��
assign hilo_temp = opdata1_mult * opdata2_mult;
//(4)����ʱ�˷������������,���յĳ˷���������ڱ���mulres��,��Ҫ������
//a.������з��ų˷�ָ��mult,mul,��ô��Ҫ������ʱ�˷����,����:
//	a1.������������������һ��һ��,��ô��Ҫ����ʱ�˷����hilo_temp����,��Ϊ���յĳ˷�������,��ֵ������multes
//	a2.��������������ͬ��,��ôhilo_temp��ֵ����Ϊ���յĳ˷����,��������mulres
//b.������޷��ų˷�����maddu,msubu,��ôhilo_temp��ֵ��Ϊ���յĳ˷����,��ֵ������mulres
always @(*) begin
	if(rst == `RstEnable) begin
		mulres <= {`ZeroWord, `ZeroWord};
	end else if((aluop_i == `EXE_MULT_OP) || (aluop_i == `EXE_MUL_OP) || (aluop_i==`EXE_MADD_OP) || (aluop_i==`EXE_MSUB_OP)) begin
		if(reg1_i[31] ^ reg2_i[31] == 1'b1) begin //������������������һ��һ��
			mulres <= ~hilo_temp + 1;
		end else begin //��������������ͬ��
			mulres <= hilo_temp; 
		end
	end
end

/********************************************
************	���ۼ�,���ۼ�	***************
*********************************************/
//MADD,MADDU,MSUB,MSUBUָ��
always @(*) begin
	if(rst == `RstEnable) begin
		hilo_temp_o <= {`ZeroWord, `ZeroWord};
		cnt_o <= 2'b00;
		stallreq_for_madd_msub <= `NoStop;
	end else begin
		case (aluop_i)
			`EXE_MADD_OP, `EXE_MADDU_OP: begin
				if (cnt_i==2'b00) begin //ִ�н׶ε�һ��ʱ������
				//��ʱ���˷����mulresͨ���ӿ�hilo_temp_o�����EX/MEMģ��,�Ա�����һ��ʱ������ʹ��
				//ͬʱ,���ñ���stallreq_for_madd_msubΪStop,��ʾ���ۼ�ָ��������ˮ����ͣ
					hilo_temp_o <= mulres;
					cnt_o <= 2'b01;
					hilo_temp1 <= {`ZeroWord, `ZeroWord};
					stallreq_for_madd_msub <= `Stop;
				end else if(cnt_i==2'b01) begin //ִ�н׶εڶ���ʱ������
				//��ʱEXģ�������hilo_temp_i������һ��ʱ�����ڵõ��ĳ˷����,���⽫hilo_temp_i��HI,LO�Ĵ�����ֵ���,�õ����յ����������浽����hilo_temp1��
				//ͬʱ,���ñ���stallreq_for_madd_msubΪNoStop,��ʾ���ۼ�ָ��ִ�н���,����������ˮ����ͣ
				//���,����cnt_oΪ2'b10,������ֱ������Ϊ2'b00,Ŀ��:�����Ϊ����ԭ������ˮ�߱�����ͣ,��ô����cnt_oΪ2'b10,����EX�׶β��ټ���,�Ӷ���ֹ���ۼ�ָ���ظ�ִ��
					hilo_temp_o <= {`ZeroWord, `ZeroWord};
					cnt_o <= 2'b10;
					hilo_temp1 <= hilo_temp_i + {HI,LO};
					stallreq_for_madd_msub <= `NoStop;
				end
			end
			`EXE_MSUB_OP, `EXE_MSUBU_OP: begin
				if (cnt_i == 2'b00) begin //ִ�н׶ε�һ��ʱ������
					hilo_temp_o <=  ~mulres + 1 ;
					cnt_o <= 2'b01;
					stallreq_for_madd_msub <= `Stop;
				end else if(cnt_i == 2'b01)begin //ִ�н׶εڶ���ʱ������
					hilo_temp_o <= {`ZeroWord,`ZeroWord};						
					cnt_o <= 2'b10;
					hilo_temp1 <= hilo_temp_i + {HI,LO};
					stallreq_for_madd_msub <= `NoStop;
				end				
			end
			default:	begin
				hilo_temp_o <= {`ZeroWord,`ZeroWord};
				cnt_o <= 2'b00;
				stallreq_for_madd_msub <= `NoStop;				
			end
		endcase
	end
end

/*****************************************
************	��ͣ��ˮ��	***************
******************************************/
//��ֹ7.8��,ֻ�г��ۼ�,���ۼ�ָ��ᵼ����ˮ����ͣ,����stallreq��ֱ�ӵ���stallreq_for_madd_msub��ֵ
always @ (*) begin
    stallreq = stallreq_for_madd_msub;
end

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
**	������������alusel_i��ֵȷ��wdata_o��ֵ,��Ҫд�ؼĴ���������   **
**************************************************************/
always @ (*) begin
    //wreg_o,wd_o����������׶�,����Ҫ�ı�
	wd_o <= wd_i; //ֱ�Ӱ�Ҫд�صļĴ�����ַ��󴫵�
	//�����add,addi,sub,subiָ���ҷ������,��ô����wreg_oΪWriteDisable,��ʾ��д��Ŀ�ļĴ���
	if(((aluop_i==`EXE_ADD_OP) || (aluop_i==`EXE_ADDI_OP) || (aluop_i==`EXE_SUB_OP)) && (ov_sum==1'b1)) begin
		wreg_o <= `WriteDisable;
	end else begin
		wreg_o <= wreg_i;
	end
	
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
		`EXE_RES_ARITHMETIC: begin
			wdata_o <= arithmeticres;
		end
		`EXE_RES_MUL: begin
			wdata_o <= mulres[31:0];
		end
		default: begin
			wdata_o <= `ZeroWord;
		end
	endcase
end


/*************************************************************
**	ȷ����HI,LO�Ĵ����Ĳ�����Ϣ   **
**************************************************************/
always @(*) begin
	if(rst == `ReadEnable) begin
		whilo_o <= `WriteDisable;
		hi_o <= `ZeroWord;
		lo_o <= `ZeroWord;
	end else if((aluop_i == `EXE_MULT_OP) || (aluop_i == `EXE_MULTU_OP)) begin
		whilo_o <= `WriteEnable;
		hi_o <= mulres[63:32];
		lo_o <= mulres[31:0];
	end else if((aluop_i == `EXE_MADD_OP) || (aluop_i == `EXE_MADDU_OP)) begin
		whilo_o <= `WriteEnable;
		hi_o <= hilo_temp1[63:32];
		lo_o <= hilo_temp1[31:0];
	end else if((aluop_i == `EXE_MSUB_OP) || (aluop_i == `EXE_MSUBU_OP)) begin
		whilo_o <= `WriteEnable;
		hi_o <= hilo_temp1[63:32];
		lo_o <= hilo_temp1[31:0];
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


