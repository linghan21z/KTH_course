clc;clear
num0 = 3;den0 = [1, 0, -29.4];
G0 = tf(num0, den0)
%%���켣����
rlocus(G0);
num1 = 400*[1, 5.42];
den1 = [1, 40];
G1 = tf(num1, den1);
G10 = G0*G1;
rlocus(G10);

%%PID���� 
kd = 10.5;kp = 200;ki = 1090;
numc = kd * [1, kp/kd, ki/kd];
denc = [1, 0];
Gc = tf(numc, denc);
G2 = Gc*G0;
rlocus(G2);
den2 = [1, 0, -29.4, 0];
roots(den2)
G = feedback(G2, 1);
%%
%%״̬�ռ䷨
A = [0 1 0 0;0 0 0 0;0 0 0 1;0 0 29.4 0];
B = [0; 1; 0; 3];
C = [1 0 0 0;0 0 1 0];
D = [0;0];
motor_ss = ss(A,B,C,D)
sys_order = order(motor_ss) 
mo = ctrb(A,B);     
sys_rank=rank(mo)

%��Kc
P=[-3; -4; -4+3*j; -4-3*j];
Kc = place(A,B,P)
motor_ss_new=ss(A-B*Kc,B,C,D)

t=0:0.01:5;
u = 0.2*ones(size(t)); % �����ź�Ϊ0.2
[y,t] = lsim(motor_ss_new, u, t);
plot(y);
title('״̬�������������Ӧ')





