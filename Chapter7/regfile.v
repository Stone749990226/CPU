`include "defines.v"
//指令进入译码阶段,将对取到的指令进行译码:给出要进行的运算类型,以及参与运算的操作数,译码阶段包括Regfile,ID和ID/EX三个模块
//Regfile实现了32个32位通用整数寄存器,可以同时进行两个寄存器的读操作和一个寄存器的写操作
//注意:读寄存器操作时组合逻辑电路,一旦输入的寄存器地址addr1或者addr2发生变化,那么会立即给出新地址对应的寄存器的值,这样可以保证在译码阶段取得要读取的寄存器的值
//而写寄存器操作是时序逻辑电路,写操作发生在时钟信号的上升沿
module regfile(
    input wire clk,
    input wire rst,
    //写端口
    input wire we,
    input wire [`RegAddrBus] waddr,
    input wire [`RegBus] wdata,
    //读端口1
    input wire re1, //读端口1的使能
    input wire [`RegAddrBus] raddr1,
    output reg[`RegBus] rdata1,
    //读端口2
    input wire re2, //读端口2的使能
    input wire [`RegAddrBus] raddr2,
    output reg [`RegBus] rdata2
);
//*****定义32个32位寄存器*****
//这是一个二维向量
reg [`RegBus] regs[0:`RegNum-1];

//*****写操作*****
//当复位信号无效,写使能信号we(WriteEnable)有效,且写操作目的寄存器不等于0的情况下,可以将写入数据保存到目的寄存器
//注意这里要判断目的寄存器不等于0,因为MIPS32规定x0的值只能为0
always @(posedge clk) begin
    if (rst == `RstDisable) begin
        if ((we == `WriteEnable) && (waddr != `RegNumLog2'h0)) begin
            regs[waddr] <= wdata;
        end
    end
end

//*****读端口1的读操作*****
always @(*) begin
    //当复位信号有效时,第一个读寄存器的端口输出始终为0
    if(rst == `RstEnable) begin
      rdata1 <= `ZeroWord;
    end
    //当复位信号无效时,如果读取的是$0,那么直接给出0
    else if(raddr1 == `RegNumLog2'h0) begin
        rdata1 <= `ZeroWord;
    end
    //如果第一个读寄存器的端口要读取的目标寄存器与要写入的目的寄存器是同一个寄存器,那么直接将要写入的值作为第一个读寄存器端口的输出
    else if((raddr1 == waddr) && (we == `WriteEnable) && (re1 == `ReadEnable)) begin
        regs[waddr] <= wdata;
    end
    //如果上述情况都不满足,那么给出第一个读寄存器端口要读取的目标寄存器对应寄存器的值
    else if(re1 == `ReadEnable) begin
        rdata1 <= regs[raddr1];
    end
    //第一个读寄存器端口不能使用时,直接输出0
    else begin
        rdata1 <= `ZeroWord;
    end
end

//*****读端口2的读操作*****
//与第一个读寄存器类似
always @(*) begin
    if(rst == `RstEnable) begin
      rdata2 <= `ZeroWord;
    end
    else if(raddr2 == `RegNumLog2'h0) begin
        rdata2 <= `ZeroWord;
    end
    else if((raddr2 == waddr) && (we == `WriteEnable) && (re2 == `ReadEnable)) begin
        regs[waddr] <= wdata;
    end
    else if(re2 == `ReadEnable) begin
        rdata2 <= regs[raddr2];
    end
    else begin
        rdata2 <= `ZeroWord;
    end
end
endmodule