/*
 *	ģ�飺ָ��洢��ROMģ��
 *	���ܣ�����ָ���ַ ��� ָ��
 *
 *			ָ��洢��ROMģ��ӿ�ͼ
 *			 _________________
 *		  ����|ce			inst  |����
 *		  ����|addr			  |
 *			|_________________|
 *				  inst_rom.v
 */
 `include "defines.v"
 module inst_rom(
		input wire 				ce,  //ʹ���ź�
		input wire [`RegBus]	addr,//Ҫ��ȡ�ĵ�ֵַ
		output reg [`RegBus]	inst //������ָ��
 );
	
	// ����һ�����ΪInstBus��32λ������СΪInstMemNum��238KB��������
	reg [`InstBus] inst_mem[0:`InstMemNum-1];
	// ���ļ� д��inst_mem������
    // ints_rom.data��һ���ı��ļ�,����洢����ָ��,ÿ�д洢һ��32λ��ȵ�ָ��(ʹ��16���Ʊ�ʾ)
    // ϵͳ����$readmemh�Ὣinst.data�е���������д��inst_mem������
    // ע��,initial����������,���Ҫ�����ۺ�������Ҫ�޸�
	initial $readmemh("inst_rom.data", inst_mem);
	
    // OpenMIPS�ǰ����ֽ�Ѱַ��,���˴������ָ��洢����ÿ����ַ��һ��32bit����,����Ҫ��OpenMIPS������ָ���ַ����4��ʹ��
    // ��0x8��Ӧinst_mem[2]
	always @ (*) begin
		//���ָ��洢���ǽ��õģ�������ǿյ�����
		if (ce == `ChipDisable) begin
			inst <= `ZeroWord;
		end else begin
			inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
		end
	end
	
	
 endmodule 