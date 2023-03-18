`include "defines.v"

//PC����:����ȡָ���ַ,ͬʱÿ��ʱ������ȡָ���ַ����
module pc_reg (
    input wire clk,
    input wire rst,
    output reg[`InstAddrBus] pc, //InstAddrBusΪROM�ĵ�ַ���߿��
    output reg ce //ָ��洢��ʹ���ź�
);

always @(posedge clk) begin
    if (rst == `RstEnable) begin
        ce <= `ChipDisable;
    end
    else begin
      ce <= `ChipDisable;
    end
end

always @(posedge clk) begin
    if (ce == `ChipDisable) begin
        pc <= 32'h00000000;
    end
end

endmodule //pc_reg