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
`define EXE_RES_JUMP_BRANCH 3'b110
`define EXE_RES_NOP 3'b000
`define EXE_RES_ARITHMETIC  3'b100      // ��������ָ��
`define EXE_RES_MOVE	3'b011			// �ƶ�����ָ��
`define EXE_RES_MUL 3'b101
`define EXE_RES_SHIFT 	3'b010			// ��λ����

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
`define EXE_REGIMM_INST 6'b000001

// �ƶ�����ָ��
`define EXE_MOVN		6'b001011
`define EXE_MOVZ		6'b001010
`define EXE_MFHI		6'b010000
`define EXE_MFLO		6'b010010
`define EXE_MTHI		6'b010001
`define EXE_MTLO		6'b010011


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

//�ڰ���:��ָ֧��
`define EXE_J  6'b000010
`define EXE_JAL  6'b000011
`define EXE_JALR  6'b001001
`define EXE_JR  6'b001000
`define EXE_BEQ  6'b000100
`define EXE_BGEZ  5'b00001
`define EXE_BGEZAL  5'b10001
`define EXE_BGTZ  6'b000111
`define EXE_BLEZ  6'b000110
`define EXE_BLTZ  5'b00000
`define EXE_BLTZAL  5'b10000
`define EXE_BNE  6'b000101

`define EXE_AND_OP   	8'b00100100
`define EXE_OR_OP    	8'b00100101
`define EXE_XOR_OP  	8'b00100110
`define EXE_NOR_OP  	8'b00100111
`define EXE_LUI_OP  	8'b01011100 
`define EXE_SLL_OP  	8'b01111100 
`define EXE_SRL_OP  	8'b00000010
`define EXE_SRA_OP		8'b00000011

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

`define EXE_J_OP  8'b01001111
`define EXE_JAL_OP  8'b01010000
`define EXE_JALR_OP  8'b00001001
`define EXE_JR_OP  8'b00001000
`define EXE_BEQ_OP  8'b01010001
`define EXE_BGEZ_OP  8'b01000001
`define EXE_BGEZAL_OP  8'b01001011
`define EXE_BGTZ_OP  8'b01010100
`define EXE_BLEZ_OP  8'b01010011
`define EXE_BLTZ_OP  8'b01000000
`define EXE_BLTZAL_OP  8'b01001010
`define EXE_BNE_OP  8'b01010010

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

//�ڰ�������
`define Branch 1'b1
`define NotBranch 1'b0
`define InterruptAssert 1'b1
`define InterruptNotAssert 1'b0
`define TrapAssert 1'b1
`define TrapNotAssert 1'b0
`include "defines.v"
//IDģ��������Ƕ�ָ���������,�õ��������������,������,Դ������1,Դ������2,Ҫд���Ŀ�ļĴ�����ַ����Ϣ
//ID�еĵ�·��������߼���·,��Regfileģ���нӿ�����
/* ��������
 * ��������ָ���special���͵�
 * 1.������movn,movzָ��(���漰����Ĵ���HI,LO)
 * movnָ��(move Conditional on Not Zero)�÷�:movn rd, rs, rt
 * ָ������:if rt != 0, then rd<-rs  �жϵ�ַΪrt��ͨ�üĴ�����ֵ,�����Ϊ��,��ô����ַΪrs��ͨ�üĴ�����ֵ��ֵ����ַΪrd��ͨ�üĴ���
 * ��֮,���ֵ�ַΪrd��ͨ�üĴ�������.
 * movzָ��(move Conditional on Zero)�÷�:movz rd, rs, rt
 * ָ������:��movn�෴
 * 2.������mfhi,mflo,mthi,mtloָ��(�漰����Ĵ���HI,LO)
 * mfhi rd:������Ĵ���HI��ֵ��ֵ����ַΪrd��ͨ�üĴ���(move from)
 * mflo rd:������Ĵ���L0��ֵ��ֵ����ַΪrd��ͨ�üĴ���
 * mthi rs:����ַΪrs��ͨ�üĴ�����ֵ��ֵ������Ĵ���HI(move to)
 * mtlo rs:����ַΪrs��ͨ�üĴ�����ֵ��ֵ������Ĵ���lO(move to)
 */

 /* Chapter7��������
 * ʵ���˳��ۼ�,���ۼ���4��ָ��madd,maddu,msub,msubu,��4��ָ���ָ���붼��SPECIAL2,��6-15bit����0,�����ݵ�0~5bit�Ĺ�����ȷ������һ��ָ��
 * SPECIAL2 rs rt 0000 0000 MADD/MADDU/MSUB/MSUBU
 * madd(multiply add):�з��ų��ۼ����� madd rs, rt:{HI, LO} <- {HI, LO} + rs��rt,����ַΪrs��ͨ�üĴ�����ֵ���ַΪrt��ͨ�üĴ�����ֵ��Ϊ�з��������г˷�����
 * ��������{HI, LO}���,��ҵĽ�����浽{HI, LO}��.�˴�{HI, LO}��ʾHI,LO�Ĵ��������γɵ�64λ��
 * maddu(multiply-add unsigned):�޷��ó��ۼ�����,������Ϊ�޷��������г˷�����
 * msub rs, rt:{HI, LO} <- {HI, LO} - rs��rt
 * ʵ��˼·:����Ҫ����������Ϣ:
 * (1)��ǰ�ǵڼ���ʱ������
 * (2)�˷����
 * OpenMIPSͨ����EX/MEMģ������������Ĵ���cnt,hilo,�ֱ𱣴�������Ϣ
 * ִ�н׶�EXģ������hilo_temp_o�ǳ˷����,���ݵ�EX/MEMģ��,������һ��ʱ�������ͻ�EXģ��,����ڶ���ʱ�����ڵļӼ�������
 * ִ�н׶�EXģ������cnt_o��ʾ��ǰ�ǵڼ���ʱ������,���ݵ�EX/MEMģ��,������һ��ʱ�������ͻ�EXģ��,���߾ݴ��жϵ�ǰ���ڳ��ۼ�/���ۼ�ָ��ĵڼ���ִ������
 *
 * ��δʵ�ֳ���ָ��
 *
 * Chapter8��������:ת��ָ���ʵ��
 * jrָ��: SPECIAL rs 00000 00000 00000 JR(001000)
 * �÷�:jr rs ����:pc <- rs����ַΪrs��ͨ�üĴ�����ֵ��ֵ���Ĵ���PC��Ϊ�µ�ָ���ַ
 * jalrָ��: SPECIAL rs 00000 rd 00000 JALR(001001)
 * �÷�:jalr rs ����jalr rd, rs ����:rd <- return_address, pc <- rs����ַΪrs��ͨ�üĴ�����ֵ��ֵ���Ĵ���PC��Ϊ�µ�ָ���ַ,
 * ͬʱ����תָ�����ĵڶ���ָ��ĵ�ַ��Ϊ���ص�ַ���浽��ַΪrd��ͨ�üĴ���,���û����ָ��������rd,��ôĬ�Ͻ����ص�ַ���浽$31
 * jָ��:J(000010) instr_index
 * �÷�:j target ����:pc <- (pc+4)[31,28] || target || "00",ת�Ƶ��µ�ָ���ַ,������ָ���ַ�ĵ�28λ����תָ������ӳٲ�ָ��ĵ�ַ��4λ
 * JALָ��:JAL(000011) instr_index
 * �÷�:j target ����:pc <- (pc+4)[31,28] || target || "00",ת�Ƶ��µĵ�ַָ��,��ָ���ַ��ָ��j��ͬ.����,ָ��jal��Ҫ����תָ������2��ָ��ĵ�ַ��Ϊ���ص�ַ���浽�Ĵ���$31
 * j, jal, jr, jalrָ����ת��ǰ��Ҫ��ִ���ӳٲ�ָ��
 * bgtzָ��:
 * �÷�:bgtz rs, offset ����:if rs > 0 then branch,�����ַΪrs��ͨ�üĴ�����ֵ����0,��ô����ת��
 * blezָ��:
 * �÷�:blez rs, offset ����:if rs <= 0 then branck,�����ַΪrs��ͨ�üĴ�����ֵС�ڵ���0,��ô����ת��
 * bneָ��: bne rs, rt, offset
 * 
 * ������׶ζ���ת���ж�,��ʱPC��ȡַ��Ϊ�������
 * 1. PC=PC+4
 * 2. PC���ֲ���.����ˮ����ͣ��ʱ��ͻᷢ��
 * 3. PC����ת���жϵĽ��
 */
module id(
	//�����ź���_i��ʾinput,_o��ʾoutput
    input wire rst,
    input wire [`InstAddrBus] pc_i, //����׶ε�ָ���Ӧ�ĵ�ַ
    input wire [`InstBus] inst_i, //����׶ε�ָ��(instruction)
    //��ȡ��Regfile��ֵ
    input wire [`RegBus] reg1_data_i, //��Regfile����ĵ�һ�����Ĵ����˿ڵ�����
    input wire [`RegBus] reg2_data_i,

	input wire[4:0]		ex_wd_i,		// Ҫд�ص�Ŀ�ļĴ�����ַ
	input wire			ex_wreg_i,		// //����ִ�н׶ε�ָ���Ƿ�Ҫд��Ŀ�ļĴ���
	input wire[31:0] 	ex_wdata_i,		// ��ʲô����д��
	// �ô�ģ��������������ӵ�����ģ��
	input wire[4:0]		mem_wd_i,		
	input wire 			mem_wreg_i,			
	input wire[31:0] 	mem_wdata_i,

    //�����Regfile����Ϣ
    output reg reg1_read_o, //Regfileģ��ĵ�һ�����Ĵ����˿ڵ�ʹ���ź�
    output reg reg2_read_o,
    output reg [`RegAddrBus] reg1_addr_o, //Regfileģ��ĵ�һ�����Ĵ����˿ڵĶ���ַ�ź�
    output reg [`RegAddrBus] reg2_addr_o,
    //�͵�ִ�н׶ε���Ϣ
    output reg[`AluOpBus] aluop_o, //����׶ε�ָ��Ҫ���е������������
    //��������ָ�߼�����,��������,��λ����;������:�統�����������߼�����ʱ,���������Ϳ������߼�"��",�߼�"��"
    output reg[`AluSelBus] alusel_o, //����׶ε�ָ��Ҫ���е����������
	//�͵�ִ�н׶ε�Դ������1,Դ������2
    output reg [`RegBus] reg1_o, 
    output reg [`RegBus] reg2_o,
    output reg [`RegAddrBus] wd_o, //����׶ε�ָ��Ҫд���Ŀ�ļĴ�����ַ
    output reg   wreg_o, //����׶ε�ָ���Ƿ���Ҫд���Ŀ�ļĴ���
	output wire  stallreq,

	//�ڰ�����������
	//�����������׶ε�ָ����ת��ָ�����ת������,���ñ�־λΪBranch,ͬʱͨ��branch_target_address_o�ӿڸ���ת��Ŀ�ĵ�ַ,�͵�PCģ��,���߾ݴ��޸�ȡָ��ַ
	output reg                    branch_flag_o,
	output reg[`RegBus]           branch_target_address_o,
	//�����������׶ε�ʧ����ת��ָ�����ת������,��ôIDģ�黹������next_inst_in_delayslot_oΪInDelaySlot,��ʾ��һ��ָ�����ӳٲ�ָ��,����InDelaySlot��һ���궨��
	//next_inst_in_delayslot_o�źŻ�����ID/EXģ��,������һ��ʱ������ͨ��ID/EXģ���is_in_delayslot_o�ӿ��ͻص�IDģ��,IDģ��ݴ��жϵ�ǰ��������׶ε�ָ���Ƿ����ӳٲ�ָ��   
	output reg                    is_in_delayslot_o,
	output reg                    next_inst_in_delayslot_o,//��һ����������׶ε�ָ���Ƿ�λ���ӳٲ�
	//���ת��ָ����Ҫ���淵�ص�ַ,��ôIDģ�黹Ҫ���㷵�ص�ַ,��ͨ��link_addr_o�ӿ����,��ֵ���ջᴫ�ݵ�EXģ��,��ΪҪд��Ŀ�ļĴ�����ֵ
	output reg[`RegBus]           link_addr_o,
	//��ǰ��������׶ε�ָ���Ƿ�λ���ӳٲ�
	input  wire is_in_delayslot_i 
);

//ȡ��ָ���ָ����,������
wire[5:0] op = inst_i[31:26]; //ָ���� 
wire[4:0] op2 = inst_i[10:6];
wire[5:0] op3 = inst_i[5:0]; //������
wire[4:0] op4 = inst_i[20:16];

//����ָ��ִ����Ҫ��������
reg[`RegBus] imm;
//ָʾָ���Ƿ���Ч
reg instValid;

assign stallreq = `NoStop;

//�ڰ�������
wire[`RegBus] pc_plus_8;
wire[`RegBus] pc_plus_4;

assign pc_plus_8 = pc_i+8; //���浱ǰ����׶�ָ������2��ָ��ĵ�ַ
assign pc_plus_4 = pc_i+4; //���浱ǰ����׶�ָ���������ŵ�ָ��ĵ�ַ

wire[`RegBus] imm_sll2_signedext;
assign imm_sll2_signedext = {{14{inst_i[15]}}, inst_i[15:0], 2'b00};


//*****��ָ���������*****
//����oriָ�����,ֻ��ʶ��26-32bit��ָ�����Ƿ�Ϊ6'b001101�����ж��Ƿ�Ϊoriָ��
always @(*) begin
    // ��λ��Ч
	if (rst == `RstEnable) begin
		aluop_o <= `EXE_NOP_OP;		// ���������ͣ�8'b00000000
		alusel_o <= `EXE_RES_NOP;	// �������ͣ�3'b000
		wd_o <= `NOPRegAddr;
		wreg_o <= `NOPRegAddr;
		instValid <= `InstValid;
		imm <= 32'h0;
        reg1_addr_o <= `NOPRegAddr;
		reg1_read_o <= 1'b0;
		reg2_addr_o <= `NOPRegAddr;
		reg2_read_o <= 1'b0;
		link_addr_o <= `ZeroWord;
		branch_target_address_o <= `ZeroWord;
		branch_flag_o <= `NotBranch;	
		next_inst_in_delayslot_o <= `NotInDelaySlot; 
	// ��������£��������Ĭ������
	end else begin
		// ���������ͺͲ�������
		aluop_o <= `EXE_NOP_OP;
		alusel_o <= `EXE_RES_NOP;
		
		// Ҫд���Ŀ�ļĴ���
		wd_o <= inst_i[15:11]; //Ĭ��Ŀ�ļĴ�����ַwd_o
		wreg_o <= `WriteDisable;
		
		// InstValid = 1��ָ����Ч
		instValid <= `InstValid;
		
		// �費��Ҫȥ���Ĵ�����
		reg1_read_o <= 1'b0;
		reg2_read_o <= 1'b0;
		
		// Ҫͨ��ָ��ȥ�Ĵ���ȡֵ
		reg1_addr_o <= inst_i[25:21];//Ĭ��ͨ��Regfile���˿�1��ȡ�ļĴ�����ַ
		reg2_addr_o <= inst_i[20:16];//Ĭ��ͨ��Regfile���˿�2��ȡ�ļĴ�����ַ
		
		imm <= `ZeroWord;

		link_addr_o <= `ZeroWord;
		branch_target_address_o <= `ZeroWord;
		branch_flag_o <= `NotBranch;	
		next_inst_in_delayslot_o <= `NotInDelaySlot; 
		/*���ȸ���ָ����op�����ж�,�����SPECIAL��ָ��,���ж�ָ��ĵ�6-10bit��op2�Ƿ�Ϊ0,���Ϊ0,�����ݹ�����op3��ֵ���������ж�
		 *���ָ����op��ΪSEPECIAL,��ô��ֱ������ָ����op��ֵ�����ж�
		**/
		case (op) 
			`EXE_SPECIAL_INST: begin //ָ������SPECIAL
				case (op2)
					5'b00000: begin
						case (op3) //���ݹ������ж�������ָ��
							// R��ָ��
							`EXE_AND: begin						// andָ��
								// �ʣ������������������ģ�
								// �𣺿�ex������˿ڣ�exҪʲô�����Ǿ����ʲô������
								aluop_o <= `EXE_AND_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= `WriteEnable;					//�Ƿ���Ҫд���Ŀ�ļĴ���
								//andָ��Ҫ��ȡrs,rt�Ĵ�����ֵ,��������reg1_read_o,reg2_read_oΪ1
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							`EXE_OR: begin						// orָ��
								aluop_o <= `EXE_OR_OP;			// ����������
								alusel_o <= `EXE_RES_LOGIC;		// ��������	
								// R��ָ����Ҫ�������Ĵ���data��������ִ��ģ��
								// ������Ҫ�ȴ�regfile�л�ȡdata
								wreg_o <= `WriteEnable;			// ��Ҫ�����д���Ŀ�ļĴ���
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;		
							end
							`EXE_XOR: begin
								aluop_o <= `EXE_XOR_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= `WriteEnable;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;			// InstValid = 1'b1
							end
							`EXE_NOR: begin
								aluop_o <= `EXE_NOR_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= 1'b1;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							// ��λָ���ָ���ƶ�λ������rt�Ĵ����е�ֵ�ƶ�rsλ���ŵ�rd�С�
							`EXE_SLLV: begin
								alusel_o <=	`EXE_RES_SHIFT;		// ��������
								aluop_o <= `EXE_SLL_OP;			// ����������
								wreg_o <= 1'b1;					// �Ƿ����Ҫд��Ŀ�ļĴ���		
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;	
							end
							`EXE_SRLV: begin
								alusel_o <=	`EXE_RES_SHIFT;		
								aluop_o <= `EXE_SRL_OP;			
								wreg_o <= 1'b1;						
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;	
							end
							`EXE_SRAV: begin
								alusel_o <=	`EXE_RES_SHIFT;		
								aluop_o <= `EXE_SRA_OP;			
								wreg_o <= 1'b1;						
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							// ��ָ�� sync����һ��R��ָ��
							`EXE_SYNC: begin
								alusel_o <= `EXE_RES_NOP;
								aluop_o <= `EXE_NOP_OP;
								wreg_o <= 1'b0;
								// �����������Ƚ������
								// �˿�1�������˿�2������ִ������� reg1_o <= imm;��Ҳ���������� 32'h0000_0000 �͵�reg1_o���Ӷ�����ִ�н׶ε� reg1_i��Դ������1����
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b1;
								// ����ִ�н׶Σ�����Ϊ���÷��أ�����ִ�н׶�Ҳû��Ҫ����
								instValid <= `InstValid;
							end
							`EXE_MFHI: begin
								wreg_o <= `WriteEnable;
								aluop_o <= `EXE_MFHI_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MFLO:begin
								wreg_o <= `WriteEnable;
								aluop_o <= `EXE_MFLO_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MTHI:begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MTHI_OP;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MTLO:begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MTLO_OP;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								instValid <= `InstValid;
							end
							`EXE_MOVN:begin
								aluop_o <= `EXE_MOVN_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
								if (reg2_o != `ZeroWord) begin //��ȡ��ַΪrt��ͨ�üĴ�����ֵ�Ƿ�Ϊ0,�ж��Ƿ�Ҫд��Ŀ�ļĴ���
									wreg_o <= `WriteEnable;
								end else begin
									wreg_o <= `WriteDisable;
								end
							end
							`EXE_MOVZ:begin
								aluop_o <= `EXE_MOVZ_OP;
								alusel_o <= `EXE_RES_MOVE;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
								if (reg2_o == `ZeroWord) begin
									wreg_o <= `WriteEnable;
								end else begin
									wreg_o <= `WriteDisable;
								end
							end
							//add,addu,sub,subu,slt,sltu������ָ���R��ָ��,��ָ���붼��6'b000000
							//��Ҫ����ָ���е�0-5bit�������ֵ��һ���ж�����һ��ָ��
							//SPECIAL rs rt rd 00000 ADD/ADDU/SUB/SUBU/SLT/SLTU
							`EXE_ADD: begin // add rd, rs, rt����:rd <- rs + rt,����ӷ��������,��ô���������쳣,ͬʱ��������
                                aluop_o <= `EXE_ADD_OP;
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                wreg_o <= `WriteEnable;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_ADDU: begin //addu rd, rs, rt����:rd <- rs + rt,��addָ��Ĳ�֮ͬ������adduָ�����������,���ǽ�������浽Ŀ�ļĴ���
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_ADDU_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_SUB: begin //sub rd, rs, rt����:rd <- rs - rt,��������������,��ô��������쳣,ͬʱ��������
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SUB_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_SUBU: begin //subu rd, rs, rt����:rd <- rs - rt,������������,���ǽ�������浽Ŀ�ļĴ���
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SUBU_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							`EXE_SLT: begin //(Set on Less Than)slt rd, rs, rt����:rd <- (rs<rt),����ַΪrs��ͨ�üĴ�����ֵ���ַΪrt��ͨ�üĴ�����ֵ�����з��������бȽ�
							// ���ǰ��С�ں���,��ô��1���浽��ַΪrd��ͨ�üĴ�����,��֮,��0���浽ͨ�üĴ�����
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SLT_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							`EXE_SLTU: begin //(Set on Less Than Unsigned)sltu rd, rs, rt����:rd <- (rs<rt),����ַΪrs��ͨ�üĴ�����ֵ���ַΪrt��ͨ�üĴ�����ֵ�����޷��������бȽ�
							// ���ǰ��С�ں���,��ô��1���浽��ַΪrd��ͨ�üĴ�����,��֮,��0���浽ͨ�üĴ�����
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_SLTU_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							//mult,multu��ָ������SPECIAL,��mulָ���ָ������SPECIAL2
							`EXE_MULT:begin //mult rs, rt����:{hi, lo} <- rs �� rt
							//����ַΪrs��ͨ�üĴ�����ֵ���ַΪrt��ͨ�üĴ�����ֵ��Ϊ�з��������,�˷�����ĵ�32bit���浽LO�Ĵ�����,��32bit���浽HI�Ĵ�����
                                // alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_MULT_OP;
                                wreg_o <= `WriteDisable; //��Ϊ���ս����д��ͨ�üĴ���,����HI,LO�Ĵ���
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
                            `EXE_MULTU: begin //multu rs, rt����:{hi, lo} <- rs �� rt,��mult������������������Ϊ�޷��������
                                // alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_MULTU_OP;
                                wreg_o <= `WriteDisable;             // ��д�뵽ͨ�üĴ���������ʹ������Ϊ0����Ҫ���浽����Ĵ��� hi lo �С�
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							`EXE_JR: begin
								//jrָ���Ҫ���淵�ص�ַ
								wreg_o <= `WriteDisable;
								//���÷��ص�ַΪ0
								link_addr_o <= `ZeroWord;
								//����:��������д����EXE_NOP_OP��EXE_RES_NOP?		
								aluop_o <= `EXE_JR_OP;
		  						alusel_o <= `EXE_RES_JUMP_BRANCH;   
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
			            		branch_target_address_o <= reg1_o;
								//jrָ���Ǿ���ת��,��������branch_flag_oΪBranch
			            		branch_flag_o <= `Branch;
								//��һ��ָ�����ӳٲ�ָ��
			            		next_inst_in_delayslot_o <= `InDelaySlot;
			            		instValid <= `InstValid;	
							end
							`EXE_JALR: begin
								//jalrָ����Ҫ���淵�ص�ַ
								wreg_o <= `WriteEnable;	
								//���÷��ص�ַlink_addr_oΪ��ǰת��ָ�����ڶ���ָ��ĵ�ַ,��pc_plus_8
								link_addr_o <= pc_plus_8;	
								aluop_o <= `EXE_JALR_OP;
		  						alusel_o <= `EXE_RES_JUMP_BRANCH;  
								//jalrָ��Ҫת�Ƶ���Ŀ���ַ��ͨ�üĴ���rs��ֵ,������Ҫ����reg1_read_oΪ1,��ȡ�ļĴ�����ַ����ָ���е�rs 
								reg1_read_o <= 1'b1;	
								reg2_read_o <= 1'b0;
								//����Ҫд��Ŀ�ļĴ�����ַwd_oΪrd,��ָ��ĵ�11~15bit
		  						wd_o <= inst_i[15:11];
								//jalrָ���Ǿ���ת��,��������branch_flag_oΪBranch
			            		branch_flag_o <= `Branch;
								//����ת��Ŀ�ĵ�ַbranch_target_address_oΪreg1_o,Ҳ����������ͨ�üĴ���rs��ֵ
								branch_target_address_o <= reg1_o;
								//��һ��ָ�����ӳٲ�ָ��
			            		next_inst_in_delayslot_o <= `InDelaySlot;
			            		instValid <= `InstValid;	
							end
							default: begin
							end
						endcase
					end
					default: begin
					end
				endcase
			end
			// ��������ָ�clo clzָ��
            `EXE_SPECIAL2_INST: begin
                case (op2)
                    5'b00000: begin
                        case (op3)
							//clo,clzָ���R��ָ��,ָ���붼��6'b011100,��MIPS32ָ��ܹ��б�ʾSPECIAL2��
							//����,��6-10bit��Ϊ0,��Ҫ����ָ���е�0-5bit�������ֵ��һ���ж�����һ��ָ��
                            `EXE_CLZ: begin //clzָ��(Count Leading Zeroes):clz rd, rs����:rd <- count_leading_zeros rs
							//�Ե�ַΪrs��ͨ�üĴ�����ֵ,�������λ��ʼ�����λ������,ֱ������ֵΪ"1"��λ,����λ֮ǰ"0"�ĸ������浽��ַΪrd��ͨ�üĴ�����
							//�����ַΪrs��ͨ�üĴ���������λ��Ϊ0(��0x00000000),��ô��32���浽��ַΪrd��ͨ�üĴ�����
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_CLZ_OP;
                                wreg_o <= `WriteEnable;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b0;
                                instValid <= `InstValid;
                            end
                            `EXE_CLO: begin //cloָ��(Count Leading Ones)
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_CLO_OP;
                                wreg_o <= `WriteEnable;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b0;
                                instValid <= `InstValid;
                            end
                            `EXE_MUL: begin //mul rd, rs, rt����:rd <- rs �� rt
							//����ַΪrs��ͨ�üĴ�����ֵ���ַΪrt��ͨ�üĴ�����ֵ��Ϊ�з������,�˷�����ĵ�32bit���浽��ַΪrd��ͨ�üĴ�����
                                alusel_o <= `EXE_RES_ARITHMETIC;
                                aluop_o <= `EXE_MUL_OP;
                                wreg_o <= 1'b1;
                                reg1_read_o <= 1'b1;
                                reg2_read_o <= 1'b1;
                                instValid <= `InstValid;
                            end
							//��������ָ��,��Ϊ���ս������д��HI,LO�Ĵ���,������ͨ�üĴ���,��������wrge_oΪWriteDisable
							//��ΪҪ��ȡ�����Ĵ�����ֵ,��������reg1_read_o,reg2_read_oΪ1'b1
							`EXE_MADD: begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MADD_OP;
								alusel_o <= `EXE_RES_MUL;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							`EXE_MADDU: begin
								wreg_o <= `WriteDisable;
								aluop_o <= `EXE_MADDU_OP;
								alusel_o <= `EXE_RES_MUL;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;
							end
							`EXE_MSUB:	begin
								wreg_o <= `WriteDisable;		
								aluop_o <= `EXE_MSUB_OP;
		  						alusel_o <= `EXE_RES_MUL; 
								reg1_read_o <= 1'b1;	
								reg2_read_o <= 1'b1;	  			
		  						instValid <= `InstValid;	
							end
							`EXE_MSUBU:	begin
								wreg_o <= `WriteDisable;		
								aluop_o <= `EXE_MSUBU_OP;
		  						alusel_o <= `EXE_RES_MUL; 
								reg1_read_o <= 1'b1;	
								reg2_read_o <= 1'b1;	  			
		  						instValid <= `InstValid;	
							end						
                        endcase
                    end
                endcase
            end 
			// I��ָ��
			`EXE_ORI: begin							// oriָ��				
				wreg_o <= 1'b1;						// ���ȿ϶���Ҫд�صģ��޸���ʹ��				
				aluop_o <= `EXE_OR_OP;				// ����������				
				alusel_o <= `EXE_RES_LOGIC;			// ��������
				// ��Ҫͨ����һ���Ĵ�������һ����imm������ʹ��
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				instValid <= `InstValid;			// ���ȿ϶���Ҫд�صģ��޸���ʹ��
				
				// ��Ϊoriָ����Ҫ�õ������������Բ���Ҫ���������
				imm <= {16'h0, inst_i[15:0]};		// �����������޷�����չ
				wd_o <= inst_i[20:16];					
			end
			
			`EXE_ANDI: begin 
				alusel_o <= `EXE_RES_LOGIC;
				aluop_o <= `EXE_AND_OP;		
				wreg_o <= 1'b1;
				//andiָ��ֻ��Ҫ��ȡrs�Ĵ�����ֵ,��������reg1_read_o��ֵΪ1,reg2_read_o��ֵΪ0,����ʹ����������Ϊ����Ĳ�����
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				instValid <= `InstValid;
			end
			`EXE_XORI: begin
				alusel_o <= `EXE_RES_LOGIC;
				aluop_o <= `EXE_XOR_OP;		
				wreg_o <= 1'b1;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				instValid <= `InstValid;
			end
			`EXE_LUI: begin
				alusel_o <= `EXE_RES_LOGIC;
				aluop_o <= `EXE_OR_OP;				// ����Ƚ����⣬������luiָ�����߼���ķ�ʽ����	
				wreg_o <= 1'b1;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {inst_i[15:0], 16'h0};
				wd_o <= inst_i[20:16];
				instValid <= `InstValid;
			end
			//addi,addiu,slti,sltiu������ָ���I��ָ��,�ܹ�����ָ���еĵ�26~31bitָ�����ֵ�ж�����һ��ָ��
			//ADDI/ADDIU/SLTI/SLTIU rs rt immediate
			`EXE_ADDI: begin//addi rt, rs, immediate����:rt <- rs + (sign_extended)immediate
			//��ָ���е�16λ���������з�����չ,���ַΪrs��ͨ�üĴ�����ֵ���мӷ�����,������浽��ַΪrt��ͨ�üĴ�����.
			//����ӷ��������,��ô��������쳣,��������
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_ADDI_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};    // �з�����չ
				wd_o <= inst_i[20:16];
                instValid <= `InstValid;
            end
            `EXE_ADDIU: begin//addiu rt, rs, immediate����:rt <- rs + (sign_extended)immediate
			//��ָ���е�16λ���������з�����չ,���ַΪrs��ͨ�üĴ�����ֵ���мӷ�����,������浽��ַΪrt��ͨ�üĴ�����.
			//��addiָ�����������,�䲻����������,���ǽ�������浽Ŀ�ļĴ���
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_ADDIU_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                wd_o <= inst_i[20:16];
                instValid <= `InstValid;
            end
			`EXE_J:	begin
				//��jr����,ֻ��ת��Ŀ���ַ������ͨ�üĴ�����ֵ,���Բ���Ҫ��ȡͨ�üĴ���,����reg1_read_oΪ0
		  		wreg_o <= `WriteDisable;		
				aluop_o <= `EXE_J_OP;
		  		alusel_o <= `EXE_RES_JUMP_BRANCH; 
				reg1_read_o <= 1'b0;	
				reg2_read_o <= 1'b0;
		  		link_addr_o <= `ZeroWord;
				//ת��Ŀ���ַ����
			    branch_target_address_o <= {pc_plus_4[31:28], inst_i[25:0], 2'b00};
			    branch_flag_o <= `Branch;
			    next_inst_in_delayslot_o <= `InDelaySlot;		  	
			    instValid <= `InstValid;	
				end
			`EXE_JAL: begin
				//��jalr����,ֻ��jalָ����ص�ַд���Ĵ���$31��,����wd_oֱ������Ϊ5'b11111,����,ת��Ŀ���ַ������ͨ�üĴ�����ֵ,���Բ���Ҫ��ȡͨ�üĴ���,����reg1_read_oΪ0
				wreg_o <= `WriteEnable;		
				aluop_o <= `EXE_JAL_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH; 
				reg1_read_o <= 1'b0;	
				reg2_read_o <= 1'b0;
				wd_o <= 5'b11111;	
				link_addr_o <= pc_plus_8 ;
				branch_target_address_o <= {pc_plus_4[31:28], inst_i[25:0], 2'b00};
				branch_flag_o <= `Branch;
				next_inst_in_delayslot_o <= `InDelaySlot;		  	
				instValid <= `InstValid;	
			end
			`EXE_BEQ: begin
				//beqָ���Ҫ���淵�ص�ַ,��������wreg_oΪWriteDisable
				wreg_o <= `WriteDisable;		
				aluop_o <= `EXE_BEQ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				//beqת�Ƶ�����������ͨ�üĴ�����ֵ���,������Ҫ��ȡ����ͨ�üĴ��� ,��������׶ε����reg1_o���ǵ�ַΪrs�ļĴ�����ֵ,reg2_o���ǵ�ַΪrt�ļĴ�����ֵ
				reg1_read_o <= 1'b1;	
				reg2_read_o <= 1'b1;
				instValid <= `InstValid;	
				//�����ȡ������ͨ�üĴ�����ֵ���,��ôת�Ʒ���,����branch_flag_oΪBranch,ͬʱ����ת��Ŀ�ĵ�ַbranch_target_address_oΪpc_plus_4 + imm_sll2_signedext
				if(reg1_o == reg2_o) begin
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					branch_flag_o <= `Branch;
					//��һ��ָ�����ӳٲ�ָ��
					next_inst_in_delayslot_o <= `InDelaySlot;		  	
				end
			end
			`EXE_BNE: begin
				//��beq����,ֻ��ת������������ͨ�üĴ�����ֵ�����
				wreg_o <= `WriteDisable;		
				aluop_o <= `EXE_BLEZ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				reg1_read_o <= 1'b1;	
				reg2_read_o <= 1'b1;
				instValid <= `InstValid;	
				if(reg1_o != reg2_o) begin
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					branch_flag_o <= `Branch;
					next_inst_in_delayslot_o <= `InDelaySlot;		  	
				end
			end
			`EXE_BGTZ: begin
				//����Ҫ���淵�ص�ַ
				wreg_o <= `WriteDisable;		
				aluop_o <= `EXE_BGTZ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH;
				instValid <= `InstValid;	
				//ת�Ƶ������ǵ�ַΪrs��ͨ�üĴ�����ֵ����0,������Ҫ����reg1_read_oΪ1
				reg1_read_o <= 1'b1;	
				reg2_read_o <= 1'b0;
				if((reg1_o[31] == 1'b0) && (reg1_o != `ZeroWord)) begin
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					branch_flag_o <= `Branch;
					next_inst_in_delayslot_o <= `InDelaySlot;		  	
				end
			end
			`EXE_BLEZ: begin
				wreg_o <= `WriteDisable;		
				aluop_o <= `EXE_BLEZ_OP;
				alusel_o <= `EXE_RES_JUMP_BRANCH; 
				reg1_read_o <= 1'b1;	
				reg2_read_o <= 1'b0;
				instValid <= `InstValid;	
				if((reg1_o[31] == 1'b1) || (reg1_o == `ZeroWord)) begin
					branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
					branch_flag_o <= `Branch;
					next_inst_in_delayslot_o <= `InDelaySlot;		  	
				end
			end
			`EXE_REGIMM_INST: begin
				case (op4)
					`EXE_BGEZ: begin
						wreg_o <= `WriteDisable;		
						aluop_o <= `EXE_BGEZ_OP;
		  				alusel_o <= `EXE_RES_JUMP_BRANCH; 
						reg1_read_o <= 1'b1;	
						reg2_read_o <= 1'b0;
		  				instValid <= `InstValid;	
		  				if(reg1_o[31] == 1'b0) begin
			    			branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
			    			branch_flag_o <= `Branch;
			    			next_inst_in_delayslot_o <= `InDelaySlot;		  	
			   			end
					end
					`EXE_BLTZ: begin
						wreg_o <= `WriteDisable;		
						aluop_o <= `EXE_BGEZAL_OP;
		  				alusel_o <= `EXE_RES_JUMP_BRANCH; 
						reg1_read_o <= 1'b1;	
						reg2_read_o <= 1'b0;
		  				instValid <= `InstValid;	
		  				if(reg1_o[31] == 1'b1) begin
			    			branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
			    			branch_flag_o <= `Branch;
			    			next_inst_in_delayslot_o <= `InDelaySlot;		  	
			   			end
					end
				endcase
			end
			`EXE_SLTI: begin //slti rt, rs, immediate����:rt <- (rs<(sign_extended)immediate)
			//��ָ���е�16Ϊ���������з�����չ,���ַΪrs��ͨ�üĴ�����ֵ�����з��������бȽ�
			//���ǰ�ߴ��ں���,��ô��1���浽��ַΪrt��ͨ�üĴ�����;��֮��0���浽��ַΪrt��ͨ�üĴ�����
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_SLTI_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                wd_o <= inst_i[20:16];
                instValid <= `InstValid;
            end
            `EXE_SLTIU: begin //sltiu rt, rs, immediate����:rt <- (rs<(sign_extended)immediate)
			//��ָ���е�16Ϊ���������з�����չ,���ַΪrs��ͨ�üĴ�����ֵ�����޷��������бȽ�
			//���ǰ�ߴ��ں���,��ô��1���浽��ַΪrt��ͨ�üĴ�����;��֮��0���浽��ַΪrt��ͨ�üĴ�����
                alusel_o <= `EXE_RES_ARITHMETIC;
                aluop_o <= `EXE_SLTIU_OP;
                wreg_o <= 1'b1;
                reg1_read_o <= 1'b1;
                reg2_read_o <= 1'b0;
                imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                wd_o <= inst_i[20:16];
                instValid <= `InstValid;
            end
		endcase
		// �߼�ָ�� �߼����ơ��߼����ơ��������ƣ��ƶ�λ����ָ���ģ�Ϊ6~10λ��
		if (inst_i[31:21] == 11'b00000000000) begin
			case (op3)
				`EXE_SLL: begin
					alusel_o <=	`EXE_RES_SHIFT;		// ��������
					aluop_o <=	`EXE_SLL_OP;		// ����������
					wreg_o <= 1'b1;					// ��Ҫд�ؼĴ���
					reg1_read_o <= 1'b0;			// �˿�1��shamt�������ƶ���λ��������Ҫ�ӼĴ����ж�
					reg2_read_o <= 1'b1;			// Դ������rt����Ҫ�Ӷ˿�2���ӼĴ������ж�ȡ
					imm[4:0] <= inst_i[10:6];		// �ƶ���λ�������5λ�������ƶ�0-5λ����ע������ƶ���λ���ɲ��ǴӼĴ�������ȡ�õģ����Ǵ�ָ��ĵ�6-10λȡ���ġ�
					wd_o <=	inst_i[15:11];			// ��Ҫд�صļĴ������
					instValid <= `InstValid;
				end
				`EXE_SRL: begin
					alusel_o <=	`EXE_RES_SHIFT;		
					aluop_o <=	`EXE_SRL_OP;		
					wreg_o <= 1'b1;					
					reg1_read_o <= 1'b0;			
					reg2_read_o <= 1'b1;			
					imm[4:0] <= inst_i[10:6];		
					wd_o <=	inst_i[15:11];			
				end
				`EXE_SRA: begin
					alusel_o <=	`EXE_RES_SHIFT;		
					aluop_o <=	`EXE_SRA_OP;		
					wreg_o <= 1'b1;					
					reg1_read_o <= 1'b0;			
					reg2_read_o <= 1'b1;			
					imm[4:0] <= inst_i[10:6];		
					wd_o <=	inst_i[15:11];
				end
			endcase
		end
	end
end

/********************************************
*********	�ڶ��׶Σ�����Դ������1	*********
********************************************/
//���reg1_read_oΪ1,��ô�ͽ���Regfileģ����˿�1��ȡ�ļĴ�����ֵ��ΪԴ������1
//���reg1_read_oΪ0,��ô�ͽ���������ΪԴ������1
/*�������������
 *1.���Regfileģ����˿�1Ҫ��ȡ�ļĴ�������ִ�н׶�Ҫд��Ŀ�ļĴ���,��ôֱ�Ӱ�ִ�н׶εĽ��ex_wdata_i��Ϊreg1_o��ֵ
 *2.���Regfileģ����˿�1Ҫ��ȡ�ļĴ������Ƿô�׶�Ҫд��Ŀ�ļĴ���,��ôֱ�Ӱѷô�׶εĽ��mem_wdaya_i��Ϊreg1_o��ֵ
 */
always @ (*) begin
	if (rst == `RstEnable) begin
		reg1_o <= `ZeroWord;
	end else if ((reg1_read_o == 1'b1) && (ex_wreg_i == 1'b1) && (ex_wd_i == reg1_addr_o)) begin
		reg1_o <= ex_wdata_i;
	end else if ((reg1_read_o == 1'b1) && (mem_wreg_i == 1'b1) && (mem_wd_i == reg1_addr_o)) begin
		reg1_o <= mem_wdata_i;
	end else if (reg1_read_o == 1'b1) begin
		//Regfile���˿�1�����ֵ
		reg1_o <= reg1_data_i;
	end else if (reg1_read_o == 1'b0) begin
		reg1_o <= imm;
	end else begin
		reg1_o <= `ZeroWord;
	end
end

/********************************************
*********	�����׶Σ�����Դ������2	*********
********************************************/
// �������һ����1�ĳ�2
always @ (*) begin
	if (rst == `RstEnable) begin
		reg2_o <= 1'b0;
	end else if ((reg2_read_o == 1'b1) && (ex_wreg_i == 1'b1) && (ex_wd_i == reg2_addr_o)) begin
		reg2_o <= ex_wdata_i;
	end else if ((reg2_read_o == 1'b1) && (mem_wreg_i == 1'b1) && (mem_wd_i == reg2_addr_o)) begin
		reg2_o <= mem_wdata_i;
	end else if (reg2_read_o == 1'b1) begin
        //Regfile���˿�2�����ֵ
		reg2_o <= reg2_data_i;
	end else if (reg2_read_o == 1'b0) begin
		reg2_o <= imm;
	end else begin
		reg2_o <= `ZeroWord;
	end
end

/***********************************************************************************
*********	�ڰ�������:�������is_in_delayslot��ʾ��ǰ����׶�ָ���Ƿ����ӳٲ�ָ��	*********
************************************************************************************/

always @(*) begin
	if(rst==`RstEnable) begin
		is_in_delayslot_o <= `NotInDelaySlot;
	end else begin
		//ֱ�ӵ���is_in_delayslot_i
		is_in_delayslot_o <= is_in_delayslot_i;
	end
end

endmodule