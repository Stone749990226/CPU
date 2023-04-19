`include "defines.v"
//IF-IDģ��,��������ʱ����ȡַ�׶�ȡ�õ�ָ��,�Լ���Ӧ��ָ���ַ,������һʱ�Ӵ��ݵ�����׶�
//IF:��ָ��洢����ȡ��ָ�ͬʱȷ����һ��ָ���ַ��ָ��ָ����һ��ָ�
//ID:����ָ��ü����֪������ָ����Ҫ��ʲô�ģ�ͬʱ�ü�����ó�Ҫʹ�õļĴ�����������������������չ���������ָ��ִ�У�������ߣ�ת��ָ��Ǹ���ת��Ŀ�ļĴ�����ת��������
module if_id(
    input wire clk,
    input wire rst,
    //����ȡַ�׶ε��ź�,���к궨���ʾָ�����32
    input wire[`InstAddrBus] if_pc,
    input wire[`InstBus] if_inst,

    //����������
    input  wire [5:0] stall,

    //��Ӧ����׶ε��ź�
    output reg[`InstAddrBus] id_pc,
    output reg[`InstBus] id_inst
);
always @(posedge clk) begin
    //��λ��ʱ��,pc��ָ�����
    if(rst == `RstEnable) begin
      id_pc <= `ZeroWord;
      id_inst <= `ZeroWord;
    end else if(stall[1] == `Stop && stall[2] == `NoStop) begin //��stop[1]ΪStop,stall[2]ΪNoStopʱ,��ʾȡַ�׶���ͣ,������׶μ���,����ʹ�ÿ�ָ����Ϊ��һ�����ڽ�������׶ε�ָ��
        id_pc <= `ZeroWord;
        id_inst <= `ZeroWord;        
    end else if(stall[1] == `NoStop) begin //��stall[1]ΪNoStopʱ,ȡַ�׶μ���,ȡ�õ�ָ���������׶�;��������±�������׶εļĴ���id_pc,id_inst����
        id_pc <= if_pc;
        id_inst <= if_inst;
    end 
end

endmodule