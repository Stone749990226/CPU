
/*!
 * EX模块 执行指令
 * 作用：根据译码的结果，对源操作数1、源操作数2进行指定的运算
 *		  执行阶段包括EX和EX/MEM两个模块
 *        EX模块中都是组合逻辑电路
*/
`include "defines.v"
module ex(
	input wire rst,

	// 译码阶段送到执行阶段的信号
	input wire[7:0] aluop_i,	// 运算子类型
	input wire[2:0] alusel_i,	// 运算类型
	input wire[4:0] wd_i,		// EX（执行）后要写入的目的寄存器地址
	input wire wreg_i,			// 是否有要写入的目的寄存器
	input wire[31:0] reg1_i,	// 参与运算的源操作数1
	input wire[31:0] reg2_i,	// 参与运算的源操作数2
	//HILO模块给出的HI,LO寄存器
	input wire[`RegBus] hi_i,
	input wire[`RegBus] lo_i,
	input wire[`RegBus] wb_hi_i,
	input wire[`RegBus] wb_lo_i,
	input wire wb_whilo_i,
	input wire[`RegBus] mem_hi_i,
	input wire[`RegBus] mem_lo_i,
	input wire mem_whilo_i,
	
	// 执行结果的输出
	output reg[4:0] wd_o,		// 要写回的目的寄存器地址
	output reg wreg_o,			// 是否写回
	output reg[31:0] wdata_o,	// 最终要协会目的寄存器的值
	//执行阶段为HI,LO寄存器的写请求
	output reg[`RegBus] hi_o,
	output reg[`RegBus] lo_o,
	output reg whilo_o
);

// 这个变量专门用来保存逻辑运算的运算结果
reg[31:0] logicout;
// 这个变量专门用来保存移位运算的运算结果
reg[31:0] shiftres;
// 移动操作的结果
reg[`RegBus] moveres;
// 保存HI寄存器的最新值
reg[`RegBus] HI;
// 保存LO寄存器的最新值
reg[`RegBus] LO;

/***************************************************************************
************	得到最新的HI,LO寄存器的值,此处要解决数据相关问题	***************
****************************************************************************/
//首先判断当前处于访存阶段的指令是否要写HI,LO寄存器,即mem_whilo_o是否为WriteEnable,如果是,那么访存阶段的指令要写入的值就是HI,LO寄存器的最新值
//如果不是,那么回写阶段的指令要写入的值就是HI,LO指令的最新值,如果不是,那么从HILO模块输入的值hi_i,lo_i就是HI,LO寄存器的最新值
always @(*) begin
	if(rst == `RstEnable) begin
		{HI, LO} <= {`ZeroWord, `ZeroWord};
	end else if(mem_whilo_i == `WriteEnable) begin
		{HI, LO} <= {mem_hi_i, mem_lo_i}; //访存阶段的指令要写HI,LO寄存器
	end else if(wb_whilo_i == `WriteEnable) begin
		{HI, LO} <= {wb_hi_i, wb_lo_i}; //回写阶段的指令要写HI,LO寄存器
	end else begin
		{HI, LO} <= {hi_i, lo_i};
	end
end
/*****************************************************
************	MFHI,MFLO,MOBN,MOVZ指令	***************
******************************************************/
//针对不同的移动操作指令,确定moveres的值
always @(*) begin
	if(rst == `RstEnable) begin
		moveres <= `ZeroWord;
	end else begin
		moveres <= `ZeroWord;
		case (aluop_i)
			`EXE_MFHI_OP: begin //如果是mfhi指令,那么将HI的值作为移动操作的结果
				moveres <= HI;
			end
			`EXE_MFLO_OP: begin //如果是mflo指令,那么将LO的值作为移动操作的结果
				moveres <= LO;
			end
			`EXE_MOVZ_OP: begin
				moveres <= reg1_i; //如果是movn指令,那么将reg1_i的值作为移动操作的结果
			end
			default : begin
				
			end
		endcase
	end
end

/**********************************************************
************	根据aluop指示的子类型进行运算	***************
***********************************************************/

//进行逻辑运算
always @ (*) begin
	if (rst == `RstEnable) begin
		logicout <= `ZeroWord;
	end else begin
		// 子类型运算
		case (aluop_i)
			`EXE_OR_OP: begin
				logicout <= reg1_i | reg2_i;
			end
			`EXE_AND_OP: begin
				logicout <= reg1_i & reg2_i;
			end
			`EXE_NOR_OP: begin
				logicout <= reg1_i ^ reg2_i;
			end
			default: begin
				logicout <= `ZeroWord;
			end
		endcase
	end
end 

//进行移位运算
always @(*) begin
	if(rst == `RstEnable) begin
		shiftres <= `ZeroWord;
	end else begin
		case (aluop_i)
			`EXE_SLL_OP: begin
				shiftres <= reg2_i << reg1_i[4:0];
			end
			`EXE_SRL_OP: begin
				shiftres <= reg2_i >> reg1_i[4:0];
			end
			`EXE_SRA_OP: begin
				shiftres <= ({32{reg2_i[31]}}<<(6'd32-{1'b0,reg1_i[4:0]})) | reg2_i >> reg1_i[4:0];
			end
			default :begin
				shiftres <= `ZeroWord;
			end	
		endcase
	end
end

/*************************************************************
**	根据运算类型alusel_i的值确定wdata_o的值   **
**************************************************************/
always @ (*) begin
    //wreg_o,wd_o均来自译码阶段,不需要改变
	wd_o <= wd_i; //直接把要写回的寄存器地址向后传递
	wreg_o <= wreg_i;
    //wdata_o要依据运算类型进行选择,如果是逻辑运算,将logicout的值付给wdata_o.当以后添加其他类型的指令时,只需修改这里的case
	// 回写数据
	case (alusel_i)
		`EXE_RES_LOGIC: begin
			// 将逻辑运算作为最终结果
			wdata_o <= logicout;
		end
		`EXE_RES_SHIFT: begin
			wdata_o <= shiftres;
		end
		`EXE_RES_MOVE: begin
			wdata_o <= moveres;
		end
		default: begin
			wdata_o <= `ZeroWord;
		end
	endcase
end


/*************************************************************
**	如果是MTHI,MTLO指令,那么需要给出whilo_o,hi_o,lo_i的值   **
**************************************************************/
always @(*) begin
	if(rst == `ReadEnable) begin
		whilo_o <= `WriteDisable;
		hi_o <= `ZeroWord;
		lo_o <= `ZeroWord;
	end else if(aluop_i == `EXE_MTHI_OP) begin
		whilo_o <= `WriteEnable;
		hi_o <= reg1_i;
		lo_o <= LO; //写HI寄存器,LO保持不变
	end else if(aluop_i == `EXE_MTLO_OP) begin
		whilo_o <= `WriteDisable;
		hi_o <= `ZeroWord;
		lo_o <= `ZeroWord;
	end
end

endmodule


