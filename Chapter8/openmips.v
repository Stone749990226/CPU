/*!
 * ��д�׶ε�ʵ��
 * ���ܣ���ǰ������׶ε�ģ��������Ӻ�����
 *		  ���ò�λ���ƣ�1)�����ļ��������ߺ�����
 *							 2)��Ƶģ�鸺�����ʱ���ź�
 *
 *					OpenMipsģ��ӿ�ͼ
 *			 __________________________
 *		  ����|rst			rom_ce_o   |����
 *		  ����|clk			rom_addr_o |����
 *		  ����|rom_data_i				   |
 *			|__________________________|
 *						openmips.v
 */
 `include "defines.v"
 
module openmips(
	input wire clk,
	input wire rst,
	
	input wire [`RegBus]		rom_data_i,				// ��ָ��洢����ȡ�õ�����
	output wire 				rom_ce_o,				// ָ��Ĵ���ʹ��
	output wire [`RegBus]		rom_addr_o				// �����ָ��洢���ĵ�ַ
);
	
	// IF/ID  -->  ID
	wire[31:0] pc;		        //ָ���ַ
	wire[31:0] id_pc_i;			//�ݴ棺��PC��ȡ��ָ��ĵ�ַ
	wire[31:0] id_inst_i;
	
	// ID  -->  ID/EX
	wire[7:0] id_aluop_o;	//����������
	wire[2:0] id_alusel_o;	//��������	
	wire[4:0] id_wd_o;		// EX��ִ�У���д���Ŀ�ļĴ�����ַ
	wire id_wreg_o;			//�Ƿ���Ҫд���Ŀ�ļĴ���	
	wire[31:0] id_reg1_o;	//��ԭ��������EX
	wire[31:0] id_reg2_o;
	
	// ID/EX --> EX
	wire[7:0] ex_aluop_i;	// ����������
	wire[2:0] ex_alusel_i;	// ��������
	wire[4:0] ex_wd_i;		// EX��ִ�У���Ҫд���Ŀ�ļĴ�����ַ
	wire ex_wreg_i;			// �Ƿ���Ҫд���Ŀ�ļĴ���
	wire[31:0] ex_reg1_i;	// ��ԭ������1��EX
	wire[31:0] ex_reg2_i;	// ��ԭ������2��EX
	
	// EX  -->  EX/MEM
	wire[4:0] ex_wd_o;		// Ҫд�ص�Ŀ�ļĴ�����ַ
	wire ex_wreg_o;			// �Ƿ�д��
	wire[31:0] ex_wdata_o;	// ��ʲô����д��
	
	// EX/MEM  -->  MEM
	wire[4:0] mem_wd_i;		
	wire mem_wreg_i;		
	wire[31:0] mem_wdata_i;

	// MEM  -->  MEM/WB
	wire[4:0] mem_wd_o;			
	wire mem_wreg_o;		
	wire[31:0] mem_wdata_o;
	
	// MEM/WB  -->  regfile
	wire[4:0] wb_wd_i;			
	wire wb_wreg_i;			
	wire[31:0] wb_wdata_i;

	// ID --> regfile
	wire[4:0]	reg2_addr;
	wire		reg2_read;
	wire[4:0]	reg1_addr;
	wire		reg1_read;
	// regfile --> ID
	wire[31:0]	reg1_data;
	wire[31:0]	reg2_data;
	
	//����������
	// EX --> EX/MEM
	wire ex_whilo_ex_mem;
	wire [31:0] ex_hi_ex_mem;
	wire [31:0] ex_lo_ex_mem;
	// EX_MEM --> MEM
	wire ex_mem_whilo_mem;
	wire [31:0] ex_mem_hi_mem;
	wire [31:0] ex_mem_lo_mem;
	// MEM --> MEM_WB
	wire mem_whilo_mem_wb;
	wire [31:0] mem_hi_mem_wb;
	wire [31:0] mem_lo_mem_wb;
	// MEM/WB --> HILO
	wire mem_wb_whilo_hilo;
	wire [31:0] mem_wb_hi_hilo;
	wire [31:0] mem_wb_lo_hilo;
	// hi lo --> ex
	wire[31:0] hilo_hi_ex;
	wire[31:0] hilo_lo_ex;

	wire[5:0] stall;
	wire stallreq_from_id;	
	wire stallreq_from_ex;


/***********************************************************************************************/

	pc_reg pc_reg0(
		.clk(clk),		
        .rst(rst),		
        .pc(pc),		
        .ce(rom_ce_o)			
	);
	
/***********************************************************************************************/

	assign rom_addr_o = pc;//ָ��洢���������ַ����pc��ֵ

/***********************************************************************************************/

	// if_id0��ģ��������
	if_id if_id0(
		.clk(clk),		 			 
        .rst(rst),		 		
        .if_pc(pc),
		.stall(stall),
		.if_inst(rom_data_i),		 
        .id_pc(id_pc_i),	 	
        .id_inst(id_inst_i)
	);
/***********************************************************************************************/
/***********************************************************************************************/
	
	regfile regfile0(
		.rst(rst),			
        .clk(clk),				
        .we(wb_wreg_i),					
        .waddr(wb_wd_i),
		.wdata(wb_wdata_i),		
        .re1(reg1_read),				
        .raddr1(reg1_addr),		
        .rdata1(reg1_data),
		.re2(reg2_addr),			
        .raddr2(reg2_addr),		
        .rdata2(reg2_data)
    );
/***********************************************************************************************/
/***********************************************************************************************/
	
	id id0(
		.rst(rst),							
        .pc_i(id_pc_i),					
        .inst_i(id_inst_i),		
        //����Regfile������		
        .reg1_data_i(reg1_data),
		.reg2_data_i(reg2_data),	
		//����ִ�н׶ε�ָ��Ҫд���Ŀ�ļĴ�����Ϣ
		.ex_wreg_i(ex_wreg_o),
		.ex_wdata_i(ex_wdata_o),
		.ex_wd_i(ex_wd_o),
		//���ڷô�׶ε�ָ��Ҫд���Ŀ�ļĴ�����Ϣ
		.mem_wreg_i(mem_wreg_o),
		.mem_wdata_i(mem_wdata_o),
		.mem_wd_i(mem_wd_o),
        //�͵�Regfileģ�����Ϣ	
        .reg1_addr_o(reg1_addr),
        .reg1_read_o(reg1_read),
        .reg2_addr_o(reg2_addr),
		.reg2_read_o(reg2_read),	
        //�͵�ID/EXģ�����Ϣ
        .aluop_o(id_aluop_o),			
        .alusel_o(id_alusel_o),			
        .wd_o(id_wd_o),		
		.wreg_o(id_wreg_o),					
        .reg1_o(id_reg1_o),				
        .reg2_o(id_reg2_o),

		.stallreq(stallreq_from_id)	
	);


/***********************************************************************************************/
/***********************************************************************************************/
	
	id_ex id_ex0(
		.rst(rst),				
		.clk(clk),		

		.stall(stall),

		//������׶�IDģ�鴫�ݵ���Ϣ
		.id_aluop(id_aluop_o),		
		.id_alusel(id_alusel_o),		
		.id_wd(id_wd_o),			
		.id_wreg(id_wreg_o),		
		.id_reg1(id_reg1_o),		
		.id_reg2(id_reg2_o),	
		//���ݵ�ִ�н׶�EXģ�����Ϣ	
		.ex_aluop(ex_aluop_i),	
		.ex_alusel(ex_alusel_i),	
		.ex_wd(ex_wd_i),				
		.ex_wreg(ex_wreg_i),			
		.ex_reg1(ex_reg1_i),	
		.ex_reg2(ex_reg2_i)	
);


/***********************************************************************************************/
/***********************************************************************************************/

	ex ex0(
		.rst(rst),	

		//�͵�ִ�н׶�EXģ�����Ϣ
		.aluop_i(ex_aluop_i),		
		.alusel_i(ex_alusel_i),		
		.wd_i(ex_wd_i),		
		.wreg_i(ex_wreg_i),		
		.reg1_i(ex_reg1_i),			
		.reg2_i(ex_reg2_i),			
		.wd_o(ex_wd_o),		
		.wreg_o(ex_wreg_o),		
		.wdata_o(ex_wdata_o),
		// �����ǵ�����EXģ�������Ľӿ�
		.hi_i(hilo_hi_ex),				
		.lo_i(hilo_lo_ex),				
		.mem_whilo_i(mem_whilo_mem_wb),			
		.mem_hi_i(mem_hi_mem_wb),			
		.mem_lo_i(mem_lo_mem_wb),			
		.wb_whilo_i(mem_wb_whilo_hilo),			
		.wb_hi_i(mem_wb_hi_hilo),				
		.wb_lo_i(mem_wb_lo_hilo),			
		.whilo_o(ex_whilo_ex_mem),				
		.hi_o(ex_hi_ex_mem),				
		.lo_o(ex_lo_ex_mem),

		.hilo_temp_i(hilo_temp_i),
	  	.cnt_i(cnt_i),

		.hilo_temp_o(hilo_temp_o),
		.cnt_o(cnt_o),
		
		.stallreq(stallreq_from_ex) 
	);

/***********************************************************************************************/
/***********************************************************************************************/

	ex_mem ex_mem0(
		.rst(rst),				
		.clk(clk),				
		.ex_wd(ex_wd_o),					
		.ex_wreg(ex_wreg_o),
		.ex_wdata(ex_wdata_o),	
		.mem_wd(mem_wd_i),		
		.mem_wreg(mem_wreg_i),			
		.mem_wdata(mem_wdata_i),
		// �����ǵ����������Ľӿ�
		.ex_whilo(ex_whilo_ex_mem),		
		.ex_hi(ex_hi_ex_mem),			
		.ex_lo(ex_lo_ex_mem),			
		.mem_whilo(ex_mem_whilo_mem),		
		.mem_hi(ex_mem_hi_mem),			
		.mem_lo(ex_mem_lo_mem),
		.hilo_i(hilo_temp_o),
		.cnt_i(cnt_o),	
		.hilo_o(hilo_temp_i),
		.cnt_o(cnt_i)
	);

/***********************************************************************************************/
/***********************************************************************************************/

	mem mem0(
		.rst(rst),			
		.wd_i(mem_wd_i),				
		.wreg_i(mem_wreg_i),			
		.wdata_i(mem_wdata_i),	
		.wd_o(mem_wd_o),		
		.wreg_o(mem_wreg_o),			
		.wdata_o(mem_wdata_o),
		// �����ǵ����������Ľӿ�
		.whilo_i(ex_mem_whilo_mem),		
		.hi_i(ex_mem_hi_mem),			
		.lo_i(ex_mem_lo_mem),				
		.whilo_o(mem_whilo_mem_wb),		
		.hi_o(mem_hi_mem_wb),			
		.lo_o(mem_lo_mem_wb)
	);

/***********************************************************************************************/
/***********************************************************************************************/
	

	mem_wb mem_wb0(
		.rst(rst),					
		.clk(clk),				
		.mem_wd(mem_wd_o),			
		.mem_wreg(mem_wreg_o),				
		.mem_wdata(mem_wdata_o),	
		.wb_wd(wb_wd_i),			
		.wb_wreg(wb_wreg_i),		
		.wb_wdata(wb_wdata_i),
		// �����ǵ����������Ľӿ�
		.mem_whilo(mem_whilo_mem_wb),	
		.mem_hi(mem_hi_mem_wb),		
		.mem_lo(mem_lo_mem_wb),		
		.wb_whilo(mem_wb_whilo_hilo),	
		.wb_hi(mem_wb_hi_hilo),		
		.wb_lo(mem_wb_lo_hilo)
	);


	// �����ǵ����������ģ�����Ĵ���HI��LO�Ľӿ�
	hilo_reg hilo_reg0(
		.rst(rst),		
		.clk(clk),
		.we(mem_wb_whilo_hilo),		
		.hi_i(mem_wb_hi_hilo),	
		.lo_i(mem_wb_lo_hilo),	
		.hi_o(hilo_hi_ex),	
		.lo_o(hilo_lo_ex)
	);
/***********************************************************************************************/

endmodule
