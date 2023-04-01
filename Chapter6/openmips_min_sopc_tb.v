`include "defines.v"
`timescale 1ns/1ps

module openmips_min_sopc_tb();
	reg clk_50hz;
	reg rst;
	
	
	initial begin
		// ÿ��10ns��clk�źŷ�תһ�Σ������һ��������20ns����50Hz
		clk_50hz = 1'b0;
		forever #10 clk_50hz = ~clk_50hz;
	end
	
	initial begin
		// �տ�ʼ ��λ�ź���Ч ģ���޷�ִ��
		rst = `RstEnable;
		// 195ns�� ��λ�ź���Ч ��ʼ����ģ��
		#195 rst = `RstDisable;
		// 1000ns�� ֹͣ����
		#1000 $stop;
	end
	
	openmips_min_sopc openmips_min_sopc0(
		.clk(clk_50hz),
		.rst(rst)
	);
	
endmodule 