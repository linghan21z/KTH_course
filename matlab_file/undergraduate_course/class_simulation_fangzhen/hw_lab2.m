%hw_lab2_1，可参考课本例题2.8
num=[1 1 1];
den=[1 6 11 6];
printsys(num,den)
%能控标准型实现方法
[A,B,C,D]=tf2ss(num,den) %由传递函数形式转化为状态空间形式

%%
%hw_lab2_2，可参考课本例题2.6
A=[0 1;-2 -3];
B=[1 0;1 1];
C=[1 0;1 1];
D=zeros(2,2);
%状态空间->传递函数形式
[num1,den1]=ss2tf(A,B,C,D,1) %x1
[num2,den2]=ss2tf(A,B,C,D,2) %x2
printsys(num1,den1)
printsys(num2,den2)

%%
%hw_lab2_3，可参考课本例题2.13
clc
num=[5 50 155 150];
den=[1 11 41 61 30];
[Z,P,K]=tf2zp(num,den) %传函-零极点
%最小实现的传函
[NUMm,DENm]=minreal(num,den)
[Z,P,K]=tf2zp(NUMm,DENm)

%%
%hw_lab2_4，可参考课本例题2.17
%方框图中包含符号，要先编写feedbacksym函数
%function GB = feedbacksym(G,H,sign)
clc
syms c1 ka kr Ra T1 km c T2 kb c2 s
%r(t)单独作用时
Ga=feedbacksym(1/Ra/(T1*s+1)*km*1/c/(T2*s+1),kb);
G1=c1*feedbacksym(ka*kr*Ga/s,c2);
G1=collect(G1,s) %合并同类项并以s为变量输出
%nt单独作用
G2=-feedbacksym((1/c)/(T2*s+1)/s,km*(1/Ra)/(T1*s+1)*(-kb*s-kr*ka*c2),1);
G2=collect(G2,s)
