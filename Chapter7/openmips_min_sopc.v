/*
 * OpenMIPS从指令存储器中读取指令,指令进入OpenMIPS开始执行,最小的SOPC由OpenMIPS和ROM构成
 */
  `include "defines.v"
 module openmips_min_sopc(
	input wire clk,
	input wire rst
 );
    // 连接指令存储器
	/* openmips.v --> inst_rom.v */
	wire 					rom_ce;					// 指令存储器使能
	wire [`InstAddrBus]		inst_addr;				// 输出到指令存储器的地址
	/* openmips.v <-- inst_rom.v */
	wire [`InstBus]		inst;						// 从指令存储器中取得的数据
	
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