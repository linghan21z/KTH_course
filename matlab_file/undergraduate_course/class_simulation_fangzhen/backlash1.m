%hw_lab3_2 滞环非线性函数
%backlash1.m
function [x,u1]= backlash1(u1,u,x1,s)
%u1,u 为k-1和k时刻的输入量
%x1,x 为k-1和k时刻的输出量
if (u>u1)  %输入为增
    if ((u-s)>=x1) 
        x=u-s; %在该线性上
    else x=x1; %在平行x线上
    end
else if (u<u1)
        if ((u+s)<=u1)
            x=u+s;
        else x=x1;
        end
else x=x1;
end
end
u1=u;
          