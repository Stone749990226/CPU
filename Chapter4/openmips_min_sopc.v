/*
 * OpenMIPS��ָ��洢���ж�ȡָ��,ָ�����OpenMIPS��ʼִ��,��С��SOPC��OpenMIPS��ROM����
 */
  `include "defines.v"
 module openmips_min_sopc(
	input wire clk,
	input wire rst
 );
    // ����ָ��洢��
	/* openmips.v --> inst_rom.v */
	wire 					rom_ce;					// ָ��洢��ʹ��
	wire [`InstAddrBus]		inst_addr;				// �����ָ��洢���ĵ�ַ
	/* openmips.v <-- inst_rom.v */
	wire [`InstBus]		inst;						// ��ָ��洢����ȡ�õ�����
	
/***********************************************************************************/
	openmips openmips0(
		.clk(clk),
		.rst(rst),
		.rom_data_i(inst),				
		.rom_ce_o(rom_ce),				
		.rom_addr_o(inst_addr)
	);
	
/***********************************************************************************/
/***********************************************************************************/
	inst_rom inst_rom0(
		.ce(rom_ce),
		.addr(inst_addr),
		.inst(inst)
	);	

/***********************************************************************************/
 
 endmodule 