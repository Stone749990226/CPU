`include "defines.v"

//PC功能:给出取指令地址,同时每个时钟周期取指令地址递增
module pc_reg (
    input wire clk,
    input wire rst,

    //第七章新增:来自控制模块CTRL
    input  wire [5:0] stall,

    output reg[`InstAddrBus] pc, //InstAddrBus为ROM的地址总线宽度
    output reg ce //指令存储器使能信号
);

always @(posedge clk) begin
    //复位的时候指令存储器禁用
    if (rst == `RstEnable) begin
        ce <= `ChipDisable;
    end
    //复位结束后,指令存储器使能
    else begin
      ce <= `ChipEnable;
    end
end

always @(posedge clk) begin
    //指令存储器禁用的时候,PC=0
    if (ce == `ChipDisable) begin
        pc <= 32'h00000000;
    end else if(stall[0] == `NoStop) begin
        pc<= pc +4'h4;
    end
end

endmodule //pc_reg