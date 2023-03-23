`include "defines.v"
//IDģ��������Ƕ�ָ���������,�õ��������������,������,Դ������1,Դ������2,Ҫд���Ŀ�ļĴ�����ַ����Ϣ
//ID�еĵ�·��������߼���·,��Regfileģ���нӿ�����
module id(
	//�����ź���_i��ʾinput,_o��ʾoutput
    input wire rst,
    input wire [`InstAddrBus] pc_i, //����׶ε�ָ���Ӧ�ĵ�ַ
    input wire [`InstBus] inst_i, //����׶ε�ָ��(instruction)
    //��ȡ��Regfile��ֵ
    input wire [`RegBus] reg1_data_i, //��Regfile����ĵ�һ�����Ĵ����˿ڵ�����
    input wire [`RegBus] reg2_data_i,
    //�����Regfile����Ϣ
    output reg reg1_read_o, //Regfileģ��ĵ�һ�����Ĵ����˿ڵ�ʹ���ź�
    output reg reg2_read_o,
    output reg [`RegAddrBus] reg1_addr_o, //Regfileģ��ĵ�һ�����Ĵ����˿ڵĶ���ַ�ź�
    output reg [`RegAddrBus] reg2_addr_o,
    //�͵�ִ�н׶ε���Ϣ
    output reg[`AluOpBus] aluop_o, //����׶ε�ָ��Ҫ���е������������
    //��������ָ�߼�����,��������,��λ����;������:�統�����������߼�����ʱ,���������Ϳ������߼�"��",�߼�"��"
    output reg[`AluSelBus] alusel_o, //����׶ε�ָ��Ҫ���е����������
    output reg [`RegBus] reg1_o, //����׶ε�ָ��Ҫ���е������Դ������1
    output reg [`RegBus] reg2_o,
    output reg [`RegAddrBus] wd_o, //����׶ε�ָ��Ҫд���Ŀ�ļĴ�����ַ
    output reg wreg_o //����׶ε�ָ���Ƿ���Ҫд���Ŀ�ļĴ���
);

//ȡ��ָ���ָ����,������
//����oriָ��ֻ��ͨ���жϵ�26-31bit��ֵ,�����ж��Ƿ���oriָ��
wire[5:0] op = inst_i[31:26];
wire[4:0] op2 = inst_i[10:6];
wire[5:0] op3 = inst_i[5:0];
wire[4:0] op4 = inst_i[20:16];

//����ָ��ִ����Ҫ��������
reg[`RegBus] imm;
//ָʾָ���Ƿ���Ч
reg instValid;

//*****��ָ���������*****
//����oriָ�����,ֻ��ʶ��26-32bit��ָ�����Ƿ�Ϊ6'b001101�����ж��Ƿ�Ϊoriָ��
always @(*) begin
    // ��λ��Ч
	if (rst == `RstEnable) begin
		aluop_o <= `EXE_NOP_OP;		// ���������ͣ�8'b00000000
		alusel_o <= `EXE_RES_NOP;	// �������ͣ�3'b000
		
		wd_o <= `NOPRegAddr;
		wreg_o <= `NOPRegAddr;
		imm <= 32'h0000_0000;
        reg1_addr_o <= `NOPRegAddr;
		reg1_read_o <= 1'b0;
		reg2_addr_o <= `NOPRegAddr;
		reg2_read_o <= 1'b0;
		
	// ��������£��������Ĭ������
	end else begin
		// ���������ͺͲ�������
		aluop_o <= `EXE_NOP_OP;
		alusel_o <= `EXE_RES_NOP;
		
		// Ҫд���Ŀ�ļĴ���
		wd_o <= inst_i[15:11];
		wreg_o <= `WriteDisable;
		
		// InstVaild = 1��ָ����Ч
		instValid <= `InstValid;
		
		// �費��Ҫȥ���Ĵ�����
		// ������Ȼ����Ҫ����Ϊoriָ���Ƕ�immediate������
		reg1_o <= 1'b0;
		reg2_o <= 1'b0;
		
		// Ҫͨ��ָ��ȥ�Ĵ���ȡֵ
		reg1_addr_o <= inst_i[25:21];//Ĭ��ͨ��Regfile���˿�1��ȡ�ļĴ�����ַ
		reg2_addr_o <= inst_i[20:16];//Ĭ��ͨ��Regfile���˿�2��ȡ�ļĴ�����ַ
		
		imm <= `ZeroWord;
		
		case (op) //����op��ֵ�ж��Ƿ���oriָ��
			`EXE_ORI: begin
				// ���ȿ϶���Ҫд�صģ��޸���ʹ��
				wreg_o <= `WriteEnable;
				// �������������߼�"��"����
				aluop_o <= `EXE_OR_OP;
				// �����������߼�����
				alusel_o <= `EXE_RES_LOGIC;
				// ��Ҫͨ����һ���Ĵ�������һ����imm������ʹ��
				// ����I��ָ��ֻ��Ҫһ���Ĵ�����һ��������,����reg2_read_o=0
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				// �����������޷�����չ
				imm <= {16'h0, inst_i[15:0]};
                //wd_oΪҪд���Ŀ�ļĴ����ĵ�ַ
				wd_o <= inst_i[20:16];
				// ��ָ����Ч
				instValid <= `InstValid;
			end
			default:begin
			end
		endcase
	end
end

/********************************************
*********	�ڶ��׶Σ�����Դ������1	*********
********************************************/
//���reg1_read_oΪ1,��ô�ͽ���Regfileģ����˿�1��ȡ�ļĴ�����ֵ��ΪԴ������1
//���reg1_read_oΪ0,��ô�ͽ���������ΪԴ������1
always @ (*) begin
	if (rst == `RstEnable) begin
		reg1_o <= `ZeroWord;
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
	end else if (reg2_read_o == 1'b1) begin
        //Regfile���˿�2�����ֵ
		reg2_o <= reg2_data_i;
	end else if (reg2_read_o == 1'b0) begin
		reg2_o <= imm;
	end else begin
		reg2_o <= `ZeroWord;
	end
end


endmodule