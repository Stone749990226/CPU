`include "defines.v"

//PC����:����ȡָ���ַ,ͬʱÿ��ʱ������ȡָ���ַ����
module pc_reg (
    input wire clk,
    input wire rst,

    //����������:���Կ���ģ��CTRL
    input  wire [5:0] stall,

    output reg[`InstAddrBus] pc, //InstAddrBusΪROM�ĵ�ַ���߿��
    output reg ce //ָ��洢��ʹ���ź�
);

always @(posedge clk) begin
    //��λ��ʱ��ָ��洢������
    if (rst == `RstEnable) begin
        ce <= `ChipDisable;
    end
    //��λ������,ָ��洢��ʹ��
    else begin
      ce <= `ChipEnable;
    end
end

always @(posedge clk) begin
    //ָ��洢�����õ�ʱ��,PC=0
    if (ce == `ChipDisable) begin
        pc <= 32'h00000000;
    end else if(stall[0] == `NoStop) begin
        pc<= pc +4'h4;
    end
end

endmodule //pc_reg