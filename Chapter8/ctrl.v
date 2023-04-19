`include "defines.v"
//��ΪOpenMIPS��Ƴ��ۼ�,���ۼ�,����ָ������ˮ��ִ�н׶�ռ�ö��ʱ������,�����Ҫ��ͣ��ˮ��
//OpenMIPS���õ����˼·Ϊ:������Ҫ��ͣ�׶�֮ǰ�ļĴ�������,֮���ָ�����ִ��(������ô�,��д�׶ε�ָ�����ִ��)
module ctrl (
    input  wire rst,
    input  wire stallreq_from_id, //��������׶ε���ͣ����
    input  wire stallreg_from_ex, //����ִ�н׶ε���ͣ����
    output reg [5:0] stall //��ͣ��ˮ�ߵĿ����ź�
    //stall�ź���һ�����Ϊ6���ź�,�京������
    //stall[0]��ʾȡָ��ַPC�Ƿ񱣳ֲ���,Ϊ1��ʾ���ֲ���
    //stall[1]��ʾ��ˮ��ȡָ�׶��Ƿ���ͣ,Ϊ1��ʾ��ͣ
    //stall[2]��ʾ��ˮ������׶��Ƿ���ͣ,Ϊ1��ʾ��ͣ
    //stall[3]��ʾ��ˮ��ִ�н׶��Ƿ���ͣ,Ϊ1��ʾ��ͣ
    //stall[4]��ʾ��ˮ�߷ô�׶��Ƿ���ͣ,Ϊ1��ʾ��ͣ
    //stall[5]��ʾ��ˮ�߻�д�׶��Ƿ���ͣ,Ϊ1��ʾ��ͣ
);

always @(*) begin
    if(rst == `RstEnable) begin
        stall <= 6'b000000;
    end else if(stallreg_from_ex == `Stop) begin //��������ˮ��ִ�н׶ε�ָ��������ͣʱ
        //Ҫ��ȡָ,����,ִ�н׶���ͣ,���ô�,��д�׶μ���,��������stallΪ001111
        stall <= 6'b001111; 
    end else if(stallreq_from_id == `Stop) begin //��������ˮ������׶ε�ָ��������ͣʱ
        //Ҫ��ȡַ,����׶���ͣ,��ִ��,�ô�,��д�׶μ���,��������stallΪ000111
        stall <= 6'b000111;
    end else begin //���������,����stallΪ6'b000000��ʾ����ͣ��ˮ��
        stall <= 6'b000000;
    end
end

endmodule //ctrl