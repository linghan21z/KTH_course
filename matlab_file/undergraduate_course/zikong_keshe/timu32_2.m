%32题 近似二阶系统
clc
num0=20000;  %修正K之后Wc=593.7126幅值裕量=-35.0848dB,相位裕量=-58.4549度
den0=conv([0.0265,1],[1,0]);
% 
% figure
% bode(num0,den0) %绘制伯德图
% grid on
% [Gm0,Pm0,Wcg0,Wcp0]=margin(num0,den0)
% r0=Pm0; %未校正G0的相角裕度
% disp(['剪切频率Wc',Wcp0])
% disp(['未校正系统的幅值裕量=',num2str(20*log10(Gm0)),'dB,','相位裕量=',num2str(Pm0),'度']);

% 超前校正
numc1=[0.028447,1];
denc1=[0.006472,1];
[numg1,deng1]=series(num0,den0,numc1,denc1);

figure
bode(numg1,deng1) %绘制伯德图
grid on
[Gm0,Pm0,Wcg0,Wcp0]=margin(numg1,deng1)
r0=Pm0; %未校正G0的相角裕度
disp(['剪切频率Wc',Wcp0])
disp(['未校正系统的幅值裕量=',num2str(20*log10(Gm0)),'dB,','相位裕量=',num2str(Pm0),'度']);



%验算动态跟踪误差
[numb,denb]=cloop(numg1,deng1); %校正后闭环传函
t=0:0.0001:10; n=length(t);
alpha = 1;
ramp = alpha*t;
G2=tf(numb,denb) ;%校正后的闭环系统

% [y2]=lsim(G2,ramp,t);%校正后单位斜坡响应

%---------------正弦输入
w=0.628; usin=400*sin(w*t)/w; 
[y3]=lsim(G2,usin,t);%校正后正弦信号响应
yr=usin;
figure
plot(t,y3,'g',t,yr,'y') %把正弦输入和响应画在一起
grid on
essmax=[];
for i = 1:1000
    essmax(i) =abs(yr(i)-y3(i));
end
[m,p]=max(essmax) %找到动态偏差最大大的地方

%---------------
%计算正弦输入稳态误差
% G2=tf(numb,denb) ;%校正后的闭环传函
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
% numr=1;denr=[1,0];R=tf(numr,denr); %单位阶跃
% numr=1;denr=[1,0,0];R=tf(numr,denr); %单位速度，稳态误差终值5.0026e-05
numr=400;denr=[1,0,w^2];R=tf(numr,denr); %正弦输入ess=0
ess=dcgain(GGGG*R)  %求稳态误差

%-------------

% yr=1*t;
% figure
% plot(t,y2,'g',t,yr,'y') %把速度输入和响应画在一起
% grid on
% essmax=[];
% for i = 1:3000
%     essmax(i) =abs(yr(i)-y2(i));
% end
% [m,p]=max(essmax) %找到动态偏差最大大的地方是t=


%%
%计算稳态误差
% G2=tf(numb,denb) ;%校正后的闭环传函
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
numr=1;denr=[1,0,0];R=tf(numr,denr); %单位速度
ess=dcgain(GGGG*R)  %求稳态误差
