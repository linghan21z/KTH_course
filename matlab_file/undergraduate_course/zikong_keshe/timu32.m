%32题 三轴转台内环控制系统
clc
% num0=25; %最开始剪切频率 21.6367幅值裕量=22.977dB,相位裕量=56.2352度
num0=20000;  %修正K之后Wc=593.7126幅值裕量=-35.0848dB,相位裕量=-58.4549度
den0=conv([1,0],conv([0.0265,1],[0.00318,1]));


% figure
% bode(num0,den0) %绘制伯德图
% grid on
% [Gm0,Pm0,Wcg0,Wcp0]=margin(num0,den0)
% r0=Pm0; %未校正G0的相角裕度
% disp(['剪切频率Wc',Wcp0])
% disp(['未校正系统的幅值裕量=',num2str(20*log10(Gm0)),'dB,','相位裕量=',num2str(Pm0),'度']);


% 滞后校正
% numc1=conv([1/254.1],[1,9.6]);
% denc1=[1,0.0378];
numc1=[0.1042,1];
denc1=[26.455,1];
[numg1,deng1]=series(num0,den0,numc1,denc1);

% figure
% bode(numg1,deng1) %绘制伯德图
% grid on
% [Gm0,Pm0,Wcg0,Wcp0]=margin(numg1,deng1)
% r0=Pm0; %未校正G0的相角裕度
% disp(['剪切频率Wc',Wcp0])
% disp(['未校正系统的幅值裕量=',num2str(20*log10(Gm0)),'dB,','相位裕量=',num2str(Pm0),'度']);
% % 校正之后剪切频率Wc=48.616
% % 幅值裕量=10.1157dB,相位裕量=17.9047度


% 超前校正
numc2=[0.028447,1];
denc2=[0.006472,1];
[numg2,deng2]=series(numg1,deng1,numc2,denc2);
G12=tf(numg2,deng2) ;
% [z,p,k]=tf2zp(numg2,deng2) ;
%z零点，p极点，得到极点都是负的，可见系统稳定

figure
bode(numg2,deng2) %绘制伯德图
title('滞后超前校正后系统Bode图')
grid on
[Gm0,Pm0,Wcg0,Wcp0]=margin(numg2,deng2)
r0=Pm0; %未校正G0的相角裕度
disp(['剪切频率Wc',Wcp0])
disp(['校正系统的幅值裕量=',num2str(20*log10(Gm0)),'dB,','相位裕量=',num2str(Pm0),'度']);
% 校正之后剪切频率Wc= 73.8102
% 幅值裕量=14.2881dB,相位裕量=45.4878度


%准备闭环开始加输入信号
[numb,denb]=cloop(numg2,deng2); %校正后闭环传函
G2=tf(numb,denb) ;%校正后的闭环系统


% ------------
%单位阶跃输入
t=0:0.001:1; n=length(t)
G2=tf(numb,denb) ;%校正后的闭环系统
[y1]=step(numb,denb,t);%校正后单位阶跃响应

figure
y=step(numb,denb,t);%校正后单位阶跃响应
plot(t,y,t,1+0*t)
title('单位阶跃响应曲线')
yss=y(n) %设我们时间的最终值对应的就是稳态值
Mp=((max(y)-yss)/yss);
disp(['校正后最大超调量M1=',num2str(Mp)]); %最大超调量Mp

for i=n:-1:1%该层循环用于计算调整时间，我们是从最终时间（无穷远的时间）往前开始遍历查找，否则从前开始查找的话会出错
    if y(i)>=1.02*yss|y(i)<=0.98*yss %当得到的值与稳态值差的绝对值与稳态值之比为2%时说明到达了调整时间
        ts=t(i);%ts存储调整时间
        break
    end
end
disp('调整时间ts0:'),disp(ts)

%计算稳态误差
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
numr=1;denr=[1,0];R=tf(numr,denr); %单位阶跃
ess=dcgain(GGGG*R)  %求稳态误差
% --------------

%-------------
% 这一部分是单位斜坡信号输入
t=0:0.0001:10; n=length(t);
alpha = 1;
ramp = alpha*t;
[y2]=lsim(G2,ramp,t);%校正后单位斜坡响应
yr=1*t;
lsimplot(G2,ramp,t) %这一步可以画出速度信号和响应在同一张图
essmax=[];
for i = 1:2000
    essmax(i) =abs(yr(i)-y2(i));
end
[m,p]=max(essmax) %找到动态偏差最大大的地方是t=0.0238,essmax为0.0143

%计算稳态误差
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
numr=1;denr=[1,0,0];R=tf(numr,denr); %单位速度，稳态误差终值5.0026e-05
ess=dcgain(GGGG*R)  %求稳态误差


%-----------------单位加速度实验
t=0:0.0001:0.1; n=length(t);
aa=(t.*t)/2;
[ya]=lsim(G2,aa,t);%校正后单位加速度响应

figure
 plot(t,ya,'r',t,t.*t/2,'b')
title('（0，1）初始阶段')

essmax=[];
for i = 1:100
    essmax(i) =abs(aa(i)-ya(i));
end
[m,p]=max(essmax) %找到动态偏差最大大的地方

%计算稳态误差
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
numr=1;denr=[1,0,0,0];R=tf(numr,denr); %单位加速度
ess=dcgain(GGGG*R)  %求稳态误差
% --------------


% % ---------------正弦输入
w=0.628; usin=400*sin(w*t)/w; 
[y3]=lsim(G2,usin,t);%校正后正弦信号响应
yr=usin;
figure
subplot(1,2,1)
plot(t,y3,'r',t,yr,'b') %把正弦输入和响应画在一起
title('正弦信号作用下的响应曲线')
grid on

%把t时间变量换成m
m=0:0.0001:0.10; n=length(m);
w=0.628; usin=400*sin(w*m)/w; yr2=usin;
[y4]=lsim(G2,usin,m);
subplot(1,2,2)
plot(m,y4,'r',m,yr2,'b') %把正弦输入和响应画在一起
grid on
title('初始阶段（0，0.1）')

essmax=[];
for i = 1:1000
    essmax(i) =abs(yr(i)-y3(i));
end
[m,p]=max(essmax) %找到动态偏差最大大的地方

%---------------
%计算正弦输入稳态误差
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
numr=400;denr=[1,0,w^2];R=tf(numr,denr); %正弦输入ess=0
ess=dcgain(GGGG*R)  %求稳态误差

%%
%校正装置的BODE  图
numc1=[0.1042,1]; denc1=[26.455,1];  %9.6-up,0.0378-down
numc2=[0.028447,1]; denc2=[0.006472,1]; %35.15-up,154.52=down
[numc,denc]=series(numc1,denc1,numc2,denc2);
%符合滞后-超前校正网络的Bode 图
figure;
bode(numc,denc)
grid on
title('滞后-超前校正装置的Bode 图')
