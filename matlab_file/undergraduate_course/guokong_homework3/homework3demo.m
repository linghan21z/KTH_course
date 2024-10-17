%作业3demo
num=[625000];
den=[1 87.5 12500 0]
G0=tf(num,den);
H=[1];
%R=tf(30,[1 0]);
%G2=G0*R;
% G=feedback(G0,H);
% step(30*G);
% hold on

%
Kp=0.8;
Ki=0;
Kd=0.04;
Gc=pid(Kp,Ki,Kd)
Gg=feedback(G0*Gc,H);
step(30*Gg);
hold on
grid on
% gtext('kp=0.8,Ki=0');
% gtext('kp=0.8,Ki=0.05');
% gtext('kp=0.8,Ki=0.1');
% gtext('kp=0.8,Ki=0.8');
% gtext('kp=0.8,Ki=1');
% gtext('kp=0.8,Ki=2');
% gtext('kp=0.8,Ki=3');

% gtext('kp=0.8');  
% gtext('kp=0.9');  
% gtext('kp=1.0');  
% gtext('kp=1.1');  
% gtext('kp=1.2');  
% gtext('kp=8.5,Ti=1.6,Td=0.4');
% gtext('kp=4.2,Ti=2.3,Td=0.4');
%gtext('kp=6.7,Ti=3.2,Td=0.37');
%gtext('kp=6.7,Ti=1.9,Td=0.3');
%gtext('kp=8.5,Ti=1.6,Td=0.3');