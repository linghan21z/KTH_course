%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hybrid and Embedded control systems
% Homework 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
init_tanks;
g = 9.82;
Tau = 1/alpha1*sqrt(2*tank_h10/g);
k_tank = 60*beta*Tau;
gamma_tank = alpha1^2/alpha2^2;
uss = alpha2/beta*sqrt(2*g*tank_init_h2)*100/15; % steady state input
yss = 40; % steady state output

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Continuous Control design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numup = k_tank; % Numerator 
denup = [Tau, 1]; % Denominator
uppertank = tf(numup, denup); % Transfer function for upper tank
numlow = gamma_tank; 
denlow = [gamma_tank * Tau, 1];
lowertank = tf(numlow, denlow); % Transfer function for upper tank
G = uppertank*lowertank; % Transfer function from input to lower tank level


% Calculate PID parameters
chi = 0.5;
zeta = 0.8;
omega0 = 0.2;
[K, Ti, Td, N] = polePlacePID(chi, omega0, zeta,Tau,gamma_tank,k_tank);
num = [K*Ti*(1+Td*N), K*(Ti*N+1), K*N];
den = [Ti, Ti*N, 0];
F = tf(num, den);


bode(G*F);
[Gm,Pm,Wcg,Wcp]=margin(G*F);
% disp(['cross over frequency Wcp  ',num2str(Wcp)]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Digital Control design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ts = 4; % Sampling time

% Discretize the continous controller, save it in state space form
% [A_discretized,B_discretized,C_discretized,D_discretized] =
discretized = c2d(F, Ts, 'ZOH');
ssd = ss(discretized);
A_discretized = ssd.A;
B_discretized = ssd.B;
C_discretized = ssd.C;
D_discretized = ssd.D;

% %%
% 
% save task10_1.mat tout yout
% %%
% %%
%load
% xlabel('t'); % x_label
% ylabel('h2(t)'); % y_label
% title('h2 - sampling time = 4'); 
% legend('discretize into state space'); 
%  %%
% 
% % plot(tout, yout) % 
% figure(1)
% plot(t78, y78, tout, yout) % 
% xlabel('t'); % x_label
% ylabel('h2(t)'); % y_label
% title('h2 - sampling time = 8'); 
% legend('continuous-time+ZOH','discretize into state space'); 
% %%
% figure(1)
% plot(t01, y01, t1, y1, t2, y2, t4, y4) % 
% xlabel('t'); % x_label
% ylabel('h2(t)'); % y_label
% title('h2 - different sampling time'); 
% legend('Tsample=0.1', 'Tsample=1','Tsample=2','Tsample=4'); 
% 
% figure(2)
% plot(t8,y8) % 
% xlabel('t'); % x_label
% ylabel('h2(t)'); % y_label
% title('h2 - sampling time = 8'); 
% legend('Tsample=8'); 
% 
% figure(3)
% plot(t9,y9) % 
% xlabel('t'); % x_label
% ylabel('h2(t)'); % y_label
% title('h2 - sampling time = 9'); 
% legend('Tsample=9'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discrete Control design
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Discretize the continous state space system, save it in state space form
A = [-1/Tau, 0; 1/Tau, -1/(gamma_tank*Tau)];
B = [k_tank/Tau; 0];
C = [0 , 1];
D = [0];
sys_d = c2d(ss(A, B, C, D), Ts, 'ZOH');
Phi = sys_d.A;
Gamma = sys_d.B ; %question 12


% Observability and reachability
Wc = [Gamma, Phi*Gamma]
Wo = [C; C*Phi] %Q 13



% Define the desired closed-loop poles
num1 = [1, 2*chi+2*zeta*omega0, omega0^2 + chi^2 + 4*chi*zeta*omega0, 2*chi*omega0*(omega0+zeta*chi), chi^2 * omega0^2] ; 
den1= [1];
tfdesires = tf(den1, num1);
poles_desired_s = pole(tfdesires) ; %this calculate [s] poles
%
sys_z = c2d(tfdesires, Ts, 'ZOH');
poles_desired_z = pole(minreal(sys_z))  ; %calculate [z] poles

poles_desiredL = poles_desired_z(1:2);
poles_desiredK = poles_desired_z(3:4);


% Use the acker function to compute the gain matrix for the state feedback controller
L = acker(Phi, Gamma, poles_desiredL);
% observer gain
K = acker(transpose(Phi), transpose(C), poles_desiredK).';

% reference gain
I = eye(2);
lr = 1 / (C * inv(I - Phi + Gamma * L) * Gamma);


% augmented system matrices
Aa = [Phi, -1*Gamma*L; K*C, Phi-K*C-Gamma*L];
Ba = [Gamma*lr; Gamma*lr];
poles_Aa = eig(Aa)



%%
save task10_1.mat tout yout
%%
load task10_1.mat
%%
% plot for Q21, try n-bit for quantizer
plot(t04,y04,t05,y05, tout,yout) % 

xlabel('t'); % x_label
ylabel('h2(t)'); % y_label
title('h2 - with different sampling time'); 
legend( 'T\_s = 0.4','T\_s = 0.5' ,'T\_s = 1');
% legend( 'quantization level - 6.25','quantization level - 3.125','quantization level - 1.5625','quantization level - 0.78125','quantization level - 0.3906','quantization level - 0.0977'); 
% % grid on; 


