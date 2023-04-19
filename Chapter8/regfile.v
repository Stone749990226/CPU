`include "defines.v"
//ָ���������׶�,����ȡ����ָ���������:����Ҫ���е���������,�Լ���������Ĳ�����,����׶ΰ���Regfile,ID��ID/EX����ģ��
//Regfileʵ����32��32λͨ�������Ĵ���,����ͬʱ���������Ĵ����Ķ�������һ���Ĵ�����д����
//ע��:���Ĵ�������ʱ����߼���·,һ������ļĴ�����ַaddr1����addr2�����仯,��ô�����������µ�ַ��Ӧ�ļĴ�����ֵ,�������Ա�֤������׶�ȡ��Ҫ��ȡ�ļĴ�����ֵ
//��д�Ĵ���������ʱ���߼���·,д����������ʱ���źŵ�������
module regfile(
    input wire clk,
    input wire rst,
    //д�˿�
    input wire we,
    input wire [`RegAddrBus] waddr,
    input wire [`RegBus] wdata,
    //���˿�1
    input wire re1, //���˿�1��ʹ��
    input wire [`RegAddrBus] raddr1,
    output reg[`RegBus] rdata1,
    //���˿�2
    input wire re2, //���˿�2��ʹ��
    input wire [`RegAddrBus] raddr2,
    output reg [`RegBus] rdata2
);
//*****����32��32λ�Ĵ���*****
//����һ����ά����
reg [`RegBus] regs[0:`RegNum-1];

//*****д����*****
//����λ�ź���Ч,дʹ���ź�we(WriteEnable)��Ч,��д����Ŀ�ļĴ���������0�������,���Խ�д�����ݱ��浽Ŀ�ļĴ���
//ע������Ҫ�ж�Ŀ�ļĴ���������0,��ΪMIPS32�涨x0��ֵֻ��Ϊ0
always @(posedge clk) begin
    if (rst == `RstDisable) begin
        if ((we == `WriteEnable) && (waddr != `RegNumLog2'h0)) begin
            regs[waddr] <= wdata;
        end
    end
end

//*****���˿�1�Ķ�����*****
always @(*) begin
    //����λ�ź���Чʱ,��һ�����Ĵ����Ķ˿����ʼ��Ϊ0
    if(rst == `RstEnable) begin
      rdata1 <= `ZeroWord;
    end
    //����λ�ź���Чʱ,�����ȡ����$0,��ôֱ�Ӹ���0
    else if(raddr1 == `RegNumLog2'h0) begin
        rdata1 <= `ZeroWord;
    end
    //�����һ�����Ĵ����Ķ˿�Ҫ��ȡ��Ŀ��Ĵ�����Ҫд���Ŀ�ļĴ�����ͬһ���Ĵ���,��ôֱ�ӽ�Ҫд���ֵ��Ϊ��һ�����Ĵ����˿ڵ����
    else if((raddr1 == waddr) && (we == `WriteEnable) && (re1 == `ReadEnable)) begin
        regs[waddr] <= wdata;
    end
    //������������������,��ô������һ�����Ĵ����˿�Ҫ��ȡ��Ŀ��Ĵ�����Ӧ�Ĵ�����ֵ
    else if(re1 == `ReadEnable) begin
        rdata1 <= regs[raddr1];
    end
    //��һ�����Ĵ����˿ڲ���ʹ��ʱ,ֱ�����0
    else begin
        rdata1 <= `ZeroWord;
    end
end

//*****���˿�2�Ķ�����*****
//���һ�����Ĵ�������
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