%研究比例对系统调节过程的影响
G0=tf(1,[36 1]);
%[np,dp]=pade(50,2);Gp=tf(np,dp);
[np,dp]=pade(36,2);Gp=tf(np,dp);
G1=G0*Gp;
P=[0.5,0.7,0.9,1,1.5];
hold on
for i=1:length(P)
    Gc=feedback(P(i)*G1,1);
    step(Gc);
end
gtext('kp=0.5');gtext('Kp=0.7');gtext('kp=0.9');
gtext('kp=1');gtext('Kp=1.5');
