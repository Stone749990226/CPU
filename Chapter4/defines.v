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

//ָ��ori��ָ����
`define EXE_ORI 6'b001101 
`define EXE_NOP 6'b000000 

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