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

    //第七章新增
    input  wire [5:0] stall,

    //对应译码阶段的信号
    output reg[`InstAddrBus] id_pc,
    output reg[`InstBus] id_inst
);
always @(posedge clk) begin
    //复位的时候,pc和指令都置零
    if(rst == `RstEnable) begin
      id_pc <= `ZeroWord;
      id_inst <= `ZeroWord;
    end else if(stall[1] == `Stop && stall[2] == `NoStop) begin //当stop[1]为Stop,stall[2]为NoStop时,表示取址阶段暂停,而译码阶段继续,所以使用空指令作为下一个周期进入译码阶段的指令
        id_pc <= `ZeroWord;
        id_inst <= `ZeroWord;        
    end else if(stall[1] == `NoStop) begin //当stall[1]为NoStop时,取址阶段继续,取得的指令进入译码阶段;其余情况下保持译码阶段的寄存器id_pc,id_inst不变
        id_pc <= if_pc;
        id_inst <= if_inst;
    end 
end

endmodule