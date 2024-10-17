%研究采用不同的PID参数的系统响应曲线
G0=zpk([],[-1;-2;-3;-4],10);
Kp=6;
Ti=2;
Td=1;
hold on
for i=1:5
    Gc=tf(Kp(i)*[Ti(i)*Td(i),Ti(i),1]/Ti(i),[1,0]);
    G=feedback(Gc*G0,1);
    step(G);
end
gtext('kp=8.5,Ti=1.6,Td=0.4');
gtext('kp=4.2,Ti=2.3,Td=0.4');
gtext('kp=6.7,Ti=3.2,Td=0.37');
gtext('kp=6.7,Ti=1.9,Td=0.3');
gtext('kp=8.5,Ti=1.6,Td=0.3');