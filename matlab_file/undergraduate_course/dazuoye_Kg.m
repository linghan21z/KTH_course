%G0
num0 = [10];
den0 = [conv([1 0],[1 1])];
[Gm,Pm,Wcg,Wcp] = margin(num0,den0)
% bode(num0,den0)  %校正前Bode图
% grid on
%%
%G=G0*Gc
num = [6 10];
den = [conv(conv([1 0],[1 1]),[0.0463 1])];
[Gm,Pm,Wcg,Wcp] = margin(num,den); %校正后的相角和幅值裕度
bode(num,den)  %校正后Bode图
grid on
% hold on 
% G = tf(num,den);
% G_c = feedback(G,1,-1);
% step(G_c)


%%
%双线性变换
TT = 0.05;
num=[0.6 1];
den=[0.0463 1];
Ds = tf(num,den);
% [n,d] = c2dm(num, den, 1, 'tustin')
Dz = c2d(Ds, TT, 'tustin')
% Z变换ZOH
num = [10];
den = [conv([1 0],[1 1])];
G0 = tf(num,den);
Gg = c2d(G0, TT, 'z')
%求闭环传函的根
G = Dz*Gg
H = feedback(G,1,-1) %闭环传函
roots(H.den{1}) %求根判稳定性
roots(G.den{1})
%构造误差传函
% He = tf(H.den{1}-H.num{1}, H.den{1})
He = H/G;
num3 = [1]; %单位速度输入1/s^2的Z变换R1
den3 = [1 0 0];
syms t n T %定义符号变量
r1 = t;
R1 = ztrans(subs(r1, {t}, {n*T}))
% y = He*R1 %误差传函
% limit(y,z,1)  %求稳态误差
