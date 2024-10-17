num=[50];
den=[1 15 50 0]
G0=tf(num,den);
H=[1];
G=feedback(G0,H);
step(G);
hold on
%%
Kp=6.773;
Ki=8.883;
Kd=0;
Gc=pid(Kp,Ki,Kd)
Gg=feedback(G0*Gc,H);
step(Gg);
hold on