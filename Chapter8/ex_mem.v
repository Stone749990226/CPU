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
// �ƶ�����ָ��
`define EXE_MOVN		6'b001011
`define EXE_MOVZ		6'b001010
`define EXE_MFHI		6'b010000
`define EXE_MFLO		6'b010010
`define EXE_MTHI		6'b010001
`define EXE_MTLO		6'b010011
`define EXE_RES_MOVE	3'b011			// �ƶ�����ָ��
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

	input wire[`RegBus] ex_hi,
	input wire[`RegBus] ex_lo,
	input wire ex_whilo,

	input  wire [5:0] stall,
	
	input wire[`DoubleRegBus]     hilo_i,	//����ĳ˷����
	input wire[1:0]               cnt_i,    //��һ��ʱ��������ִ�н׶εĵڼ���ʱ������

	// ת���źŵ�memģ��
	output reg[4:0] mem_wd,		//�ô�׶ε�ָ��Ҫд���Ŀ�ļĴ�����ַ
	output reg mem_wreg,	    //�ô�׶ε�ָ��Ҫ�Ƿ���Ҫд���Ŀ�ļĴ���
	output reg[31:0] mem_wdata,  //�ô�׶ε�ָ��Ҫд��Ŀ�ļĴ�����ֵ
	output reg[`RegBus] mem_hi,
	output reg[`RegBus] mem_lo,
	output reg mem_whilo,

	output reg[`DoubleRegBus]    hilo_o,  //����ĳ˷����
	output reg[1:0]              cnt_o	  //��ǰ����ִ�н׶εĵڼ���ʱ������
);

// ����������ʱ���źžͽ��ź�ת����memģ��
always @ (posedge clk) begin
	if (rst == `RstEnable) begin
		mem_wd <= `NOPRegAddr;
		mem_wreg <= `WriteDisable;
		mem_wdata <= `ZeroWord;
		mem_hi <= `ZeroWord;
		mem_lo <= `ZeroWord;
		mem_whilo <= `WriteDisable;
		hilo_o <= {`ZeroWord, `ZeroWord};
		cnt_o <= 2'b00;	
	end else if(stall[3] == `Stop && stall[4] == `NoStop) begin //��stall[3]ΪStop,stall[4]ΪNoStopʱ,��ʾִ�н׶���ͣ,���ô�׶μ���,����ʹ�ÿ�ָ����Ϊ��һ�����ڽ���ô�׶ε�ָ��
		mem_wd <= `NOPRegAddr;
		mem_wreg <= `WriteDisable;
		mem_wdata <= `ZeroWord;
		mem_hi <= `ZeroWord;
		mem_lo <= `ZeroWord;
		mem_whilo <= `WriteDisable;
		hilo_o <= hilo_i;
		cnt_o <= cnt_i;	
	end else if (stall[3] == `NoStop) begin
		mem_wd <= ex_wd;
		mem_wreg <= ex_wreg;
		mem_wdata <= ex_wdata;
		mem_hi <= ex_hi;
		mem_lo <= ex_lo;
		mem_whilo <= ex_whilo;
		hilo_o <= {`ZeroWord, `ZeroWord};
		cnt_o <= 2'b00;
	end else begin
	    hilo_o <= hilo_i;
		cnt_o <= cnt_i;											
	end 

end

endmodule