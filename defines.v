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