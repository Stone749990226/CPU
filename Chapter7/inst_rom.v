/*
 *	模块：指令存储器ROM模块
 *	功能：输入指令地址 获得 指令
 *
 *			指令存储器ROM模块接口图
 *			 _________________
 *		  ——|ce			inst  |——
 *		  ——|addr			  |
 *			|_________________|
 *				  inst_rom.v
 */
 `include "defines.v"
 module inst_rom(
		input wire 				ce,  //使能信号
		input wire [`RegBus]	addr,//要读取的地址值
		output reg [`RegBus]	inst //读出的指令
 );
	
	// 定义一个宽度为InstBus（32位），大小为InstMemNum（238KB）的数组
	reg [`InstBus] inst_mem[0:`InstMemNum-1];
	// 读文件 写到inst_mem数组中
    // ints_rom.data是一个文本文件,里面存储的是指令,每行存储一条32位宽度的指令(使用16进制表示)
    // 系统函数$readmemh会将inst.data中的数据依次写到inst_mem数组中
    // 注意,initial语句面向仿真,如果要进行综合这里需要修改
	initial $readmemh("inst_rom.data", inst_mem);
	
    // OpenMIPS是按照字节寻址的,而此处定义的指令存储器的每个地址是一个32bit的字,所以要将OpenMIPS给出的指令地址除以4再使用
    // 如0x8对应inst_mem[2]
	always @ (*) begin
		//如果指令存储器是禁用的，则输出是空的数据
		if (ce == `ChipDisable) begin
			inst <= `ZeroWord;
		end else begin
			inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
		end
	end
	
	
 endmodule 