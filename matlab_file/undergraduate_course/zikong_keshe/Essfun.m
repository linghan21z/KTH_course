%Essfun.m
function Ess = Essfun(numb,denb,R)
%G为闭环传函,R为输入信号
G=tf(numb,denb);
GG=tf(G.den{1}-G.num{1},G.den{1}); %1-fai(s)
nums=[1 0];dens=1;Gs=tf(nums,dens);
GGG=GG*Gs; %误差传函
Ess=dcgain(GGG*R)  %求稳态误差