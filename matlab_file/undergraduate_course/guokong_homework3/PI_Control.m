%采用PI控制，研究不同的积分速度Ki值的影响
G0=tf(1,[36 1]);
[np,dp]=pade(50,2);Gp=tf(np,dp);
G1=G0*Gp;
Kp=0.85;
Ki=[0.005,0.01,0.015,0.02,0.025];
hold on
for i=1:length(Ki)
    Gc=tf(Kp*[1,Ki(i)],[1,0]);
    G=feedback(Gc*G1,1);
    step(30*G);
end
gtext('Ki=0.005');gtext('Ki=0.01');gtext('Ki=0.015');
gtext('Ki=0.02');gtext('Ki=0.025');
