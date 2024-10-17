%timu39_2，把timu39的代码分步骤写开
%%
%开始校正，用过控的临界比例度法，
clc
num0=1;den0=conv([1,12],[1,2,4]); 
numc=343.9;denc=1; %临界比例度法得到等幅振荡时K=343.9
[numg,deng]=series(numc,denc,num0,den0);%系统校正后的开环传函
[num2,den2]=cloop(numg,deng); %校正后闭环传函
t=0:0.001:10; n=length(t)
[y,x,t]=step(num2,den2,t);%校正后单位阶跃响应
figure
plot(t,y);title('等幅振荡')

%%
%PI调节器
clc
num0=1;den0=conv([1,12],[1,2,4]); 
% numc=[157.86,156.3];denc=[1.01,0]; %PI超调太大了，且稳态误差不行 
Kp=156.3; Ti=1.01; Td=0; %用临界比例法查表计算出的PI参数
Gc=tf(Kp*[Ti*Td,Ti,1]/Ti,[1,0]); 
numc=Gc.num{1}; denc=Gc.den{1};
[numg,deng]=series(numc,denc,num0,den0);%系统校正后的开环传函
[num2,den2]=cloop(numg,deng); %校正后闭环传函
G2=tf(num2,den2) ;%校正后的闭环传函
t=0:0.001:50; n=length(t)
[y,x,t]=step(num2,den2,t);%校正后单位阶跃响应
figure
plot(t,y,t,0*t+1);title('PI调节后的单位阶跃响应')

yss=y(n) %设我们时间的最终值对应的就是稳态值
Mp=((max(y)-yss)/yss);
disp(['校正后最大超调量M1=',num2str(Mp)]); %最大超调量Mp

%计算稳态误差
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
numr=1;denr=[1,0];R=tf(numr,denr);
ess=dcgain(GGGG*R)  %求稳态误差


for i=n:-1:1%该层循环用于计算调整时间，我们是从最终时间（无穷远的时间）往前开始遍历查找，否则从前开始查找的话会出错
    if y(i)>=1.02*yss|y(i)<=0.98*yss%当得到的值与稳态值差的绝对值与稳态值之比为2%时说明到达了调整时间
        ts=t(i);%ts存储调整时间
        break
    end
end
disp('调整时间ts:'),disp(ts)


%%
%PID调节器
clc
num0=1;den0=conv([1,12],[1,2,4]); 
% Kp=205.928;Ti=0.595;Td=0.1488; %PID初始参数
Kp=55.928;Ti=0.9;Td=0.1488;  %满足要求的参数
Gc=tf(Kp*[Ti*Td,Ti,1]/Ti,[1,0]);  %PID调节器
numc=Gc.num{1}; denc=Gc.den{1};   
[numg,deng]=series(numc,denc,num0,den0);%系统校正后的开环传函
[num2,den2]=cloop(numg,deng); %校正后闭环传函
G2=tf(num2,den2) ;%校正后闭环传函
t=0:0.0001:14; n=length(t)
[y,x,t]=step(num2,den2,t);%校正后单位阶跃响应
% lsim(G2,1+0*t,t) %自动出图
figure
plot(t,y,t,1+0*t);title('PID参数整定后系统的单位阶跃响应')
yss=y(n) %设我们时间的最终值对应的就是稳态值

Mp=((max(y)-yss)/yss);
disp(['校正后最大超调量M1=',num2str(Mp)]); %最大超调量Mp

%计算稳态误差
G2=tf(num2,den2) ;%校正后的闭环传函
GG=G2;
GGG=tf(GG.den{1}-GG.num{1},GG.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGGG=GGG*Gs; %误差传函
numr=1;denr=[1,0];R=tf(numr,denr);
ess=dcgain(GGGG*R)  %求稳态误差


for i=n:-1:1%该层循环用于计算调整时间，我们是从最终时间（无穷远的时间）往前开始遍历查找，否则从前开始查找的话会出错
    if y(i)>=1.02*yss|y(i)<=0.98*yss%当得到的值与稳态值差的绝对值与稳态值之比为2%时说明到达了调整时间
        ts=t(i);%ts存储调整时间
        break
    end
end
disp('调整时间ts:'),disp(ts)


%校验频域性能指标，满足
figure
bode(numg,deng) %绘制伯德图;
grid on; title('校正后开环系统Bode图')
[Gm,Pm,Wcg,Wcp]=margin(numg,deng)
r=Pm; %相角裕度
disp(['剪切频率Wc',Wcp])
disp(['未校正系统的幅值裕量=',num2str(20*log10(Gm)),'dB,','相位裕量=',num2str(Pm),'度']);

