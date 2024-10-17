%研究积分速度对系统调节过程的影响
G0=tf(1,[36 1]);
[np,dp]=pade(50,2);Gp=tf(np,dp);
G1=G0*Gp;
S0=[0.005,0.01,0.015,0.02];
hold on
for i=1:length(S0)
    Gc=tf(S0(i),[1,0]);
    G=feedback(Gc*G1,1);
    step(G);
end
gtext('S0=0.005');
gtext('S0=0.01');
gtext('S0=0.015');
gtext('S0=0.02');
