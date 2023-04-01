`include "defines.v"
//IDģ��������Ƕ�ָ���������,�õ��������������,������,Դ������1,Դ������2,Ҫд���Ŀ�ļĴ�����ַ����Ϣ
//ID�еĵ�·��������߼���·,��Regfileģ���нӿ�����
/* ��������
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
    output reg wreg_o //����׶ε�ָ���Ƿ���Ҫд���Ŀ�ļĴ���
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
		
		// InstValid = 1��ָ����Ч
		instValid <= `InstValid;
		
		// �費��Ҫȥ���Ĵ�����
		// ������Ȼ����Ҫ����Ϊoriָ���Ƕ�immediate������
		reg1_o <= 1'b0;
		reg2_o <= 1'b0;
		
		// Ҫͨ��ָ��ȥ�Ĵ���ȡֵ
		reg1_addr_o <= inst_i[25:21];//Ĭ��ͨ��Regfile���˿�1��ȡ�ļĴ�����ַ
		reg2_addr_o <= inst_i[20:16];//Ĭ��ͨ��Regfile���˿�2��ȡ�ļĴ�����ַ
		
		imm <= `ZeroWord;
		/*���ȸ���ָ����op�����ж�,�����SPECIAL��ָ��,���ж�ָ��ĵ�6-10bit��op2�Ƿ�Ϊ0,���Ϊ0,�����ݹ�����op3��ֵ���������ж�
		 *���ָ����op��ΪSEPECIAL,��ô��ֱ������ָ����op��ֵ�����ж�
		**/
		case (op) 
			`EXE_SPECIAL_INST: begin //ָ������SPECIAL
				case (op2)
					5'b0000: begin
						case (op3) //���ݹ������ж�������ָ��
							// R��ָ��
							`EXE_AND: begin						// andָ��
								// �ʣ������������������ģ�
								// �𣺿�ex������˿ڣ�exҪʲô�����Ǿ����ʲô������
								aluop_o <= `EXE_AND_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= 1'b1;					//�Ƿ���Ҫд���Ŀ�ļĴ���
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
								wreg_o <= 1'b1;					// ��Ҫ�����д���Ŀ�ļĴ���
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								instValid <= `InstValid;		
							end
							`EXE_XOR: begin
								aluop_o <= `EXE_XOR_OP;
								alusel_o <= `EXE_RES_LOGIC;
								wreg_o <= 1'b1;
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


endmodule