`include "defines.v"
//因为OpenMIPS设计乘累加,乘累减,除法指令在流水线执行阶段占用多个时钟周期,因此需要暂停流水线
//OpenMIPS采用的设计思路为:保持需要暂停阶段之前的寄存器不变,之后的指令继续执行(如允许访存,回写阶段的指令继续执行)
module ctrl (
    input  wire rst,
    input  wire stallreq_from_id, //来自译码阶段的暂停请求
    input  wire stallreg_from_ex, //来自执行阶段的暂停请求
    output reg [5:0] stall //暂停流水线的控制信号
    //stall信号是一个宽度为6的信号,其含义如下
    //stall[0]表示取指地址PC是否保持不变,为1表示保持不变
    //stall[1]表示流水线取指阶段是否暂停,为1表示暂停
    //stall[2]表示流水线译码阶段是否暂停,为1表示暂停
    //stall[3]表示流水线执行阶段是否暂停,为1表示暂停
    //stall[4]表示流水线访存阶段是否暂停,为1表示暂停
    //stall[5]表示流水线回写阶段是否暂停,为1表示暂停
);

always @(*) begin
    if(rst == `RstEnable) begin
        stall <= 6'b000000;
    end else if(stallreg_from_ex == `Stop) begin //当处于流水线执行阶段的指令请求暂停时
        //要求取指,译码,执行阶段暂停,而访存,回写阶段继续,所以设置stall为001111
        stall <= 6'b001111; 
    end else if(stallreq_from_id == `Stop) begin //当处于流水线译码阶段的指令请求暂停时
        //要求取址,译码阶段暂停,而执行,访存,回写阶段继续,所以设置stall为000111
        stall <= 6'b000111;
    end else begin //其余情况下,设置stall为6'b000000表示不暂停流水线
        stall <= 6'b000000;
    end
end

endmodule //ctrl