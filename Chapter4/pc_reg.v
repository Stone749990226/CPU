//PC����:����ȡָ���ַ,ͬʱÿ��ʱ������ȡָ���ַ����
module pc_reg (
    input wire clk,
    input wire rst,
    output reg[`InstAddrBus] pc, //InstAddrBusΪROM�ĵ�ַ���߿��
    output reg ce //ָ��洢��ʹ���ź�
);

always @(posedge clk) begin
    if (rst == `RstEnable) begin
        ce <= 1'b0;
    end
    else begin
      ce <= 1'b1;
    end
end

endmodule //pc_reg