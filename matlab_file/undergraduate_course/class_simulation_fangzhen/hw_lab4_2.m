%hw_lab4_2,课本例题7-16,7-23
num=1;den=conv([1,0],conv([1,1],[1,10]));
figure(1)
rlocus(num,den) %绘制根轨迹
% [k,poles]=rlocfind(num,den);%找点
figure(2)
bode(num,den) %绘制伯德图
numk=50;
[Gm,Pm,Wcg,Wcp]=margin(numk,den)
disp(['幅值裕量=',num2str(20*log10(Gm)),'dB,','相位裕量=',num2str(Pm),'度']);

%%
%hw_lab4_3
clc
%单位负反馈
num0=4; den0=conv([1,0],[1,0.5]); %未校正G0
[num1,den1]=cloop(num0,den0); %未校正的闭环传函
t=0:0.1:20;
[y,x,t]=step(num1,den1,t);%未校正的单位阶跃响应
figure(1);plot(t,y);title('未校正的单位阶跃响应')
M1=((max(y)-1)/1);
disp(['校正前最大超调量M1=',num2str(M1)]); %最大超调量M1

num0e=[1,0.5,0];den0e=[1,0.5,4]; %单位阶跃信号下的误差传函
ess0=dcgain(num0e,den0e)  %求稳态误差
[Gm0,Pm0,Wcg0,Wcp0]=margin(num0,den0);
r0=Pm0; %未校正G0的相角裕度
disp(['未校正系统的幅值裕量=',num2str(20*log10(Gm0)),'dB,','相位裕量=',num2str(Pm0),'度']);

%校正装置Gc
numc=6.25*conv([1,0.5],[1,0.1]);
denc=conv([1,5],[1,0.01]);
[numg,deng]=series(numc,denc,num0,den0);%系统校正后的开环传函
[num2,den2]=cloop(numg,deng); %校正后闭环传函
t=0:0.1:10;
[y,x,t]=step(num2,den2,t);%校正后单位阶跃响应
figure(2);plot(t,y);title('校正后的单位阶跃响应')
M2=((max(y)-1)/1);
disp(['校正后最大超调量M2=',num2str(M2)]) %校正后最大超调量M2
numge=[1,0.5,0];denge=[1,0.5,4]; %校正后单位阶跃信号下的误差传函
essg=dcgain(numge,denge) %校正后稳态误差
[Gmg,Pmg,Wcgg,Wcpg]=margin(numg,deng);
rg=Pmg; %校正后G0的相角裕度
disp(['校正后系统的幅值裕量=',num2str(20*log10(Gmg)),'dB,','相位裕量=',num2str(Pmg),'度']);
%校正前后Bode图对比
figure(3)
subplot(1,2,1)
bode(num0,den0);title('未校正系统');
subplot(1,2,2)
bode(numg,deng);title('已校正系统');

%%
%hw_lab4_4
%设计状态反馈，课本例题8-8,例题8-12原题
A=[0 1;20.6 0];b=[0;1]; %注意b是列向量
C=[1 0];
disp('能控性矩阵的秩');
rc=rank(ctrb(A,b)) %能控性矩阵的秩
P=[-1.8+1j*2.4;-1.8-1j*2.4];
K=acker(A,b,P)
%设计状态观测器，课本例题8-10
disp('能观性矩阵的秩');
ro=rank(obsv(A,C)) %能观测性矩阵的秩
A1=A';b1=C';C1=b';
P1=[-8 -8];
K1=acker(A1,b1,P1); 
L=K1'

