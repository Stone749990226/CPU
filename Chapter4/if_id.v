`include "defines.v"
//IF-ID模块,作用是暂时保存取址阶段取得的指令,以及对应的指令地址,并在下一时钟传递到译码阶段
//IF:从指令存储器中取出指令，同时确定下一条指令地址（指针指向下一条指令）
//ID:翻译指令，让计算机知道这条指令是要干什么的，同时让计算机得出要使用的寄存器，或者让立即数进行拓展（方便后续指令执行），亦或者（转移指令）是给出转移目的寄存器与转移条件；
module if_id(
    input wire clk,
    input wire rst,
    //来自取址阶段的信号,其中宏定义表示指令宽度32
    input wire[`InstAddrBus] if_pc,
    input wire[`InstBus] if_inst,
    //对应译码阶段的信号
    output reg[`InstAddrBus] id_pc,
    output reg[`InstBus] id_inst
);
always @(posedge clk) begin
    //复位的时候,pc和指令都置零
    if(rst == `RstEnable) begin
      id_pc <= `ZeroWord;
      id_inst <= `ZeroWord;
    end
    //其余时刻向下传递取址阶段的值
    else begin
        id_pc <= if_pc;
        id_inst <= if_inst;
    end
end

endmodule