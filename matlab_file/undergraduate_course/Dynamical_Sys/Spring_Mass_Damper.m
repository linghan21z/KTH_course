%p9_Example Spring-Mass-Damper
clear all; close all
%play with different 'd' and 'dt' to see various behavior

w = 2*pi; %natural frequency
d = 0.25; %damping ratio %2.5时不振荡直接衰减, 0.025时ode45收敛 euler发散
%spring -mass-damper system
A = [0 1; -w^2 -2*d*w]; %\dot{x} =Ax

dt = 0.01; %time step, %0.001更准确，0.1发散
T = 10; %amout of time to integrate
x0 = [2; 0]; %initial condition (x=2, v=0)

%itrate forward Euler
xF(:,1) = x0;  %第一列
tF(1) = 0;  %初始时间0
for k=1:T/dt
    tF(k+1) = k*dt; %离散时间公式-欧拉 tF(k+1) = tF(k)+dt,matlab是从0开始的
    xF(:,k+1) = (eye(2) + dt*A)*xF(:,k);
end

plot(tF,xF(1,:),'k')  %k是黑色

[t,xGood] = ode45( @(t,x) A*x, 0:dt:T, x0); %用四阶龙格库塔
hold on
plot(t,xGood(:,1),'r')
xlabel('Time [s]'); ylabel('position [m]');
legend('Forward Euler','ODE45(RK4)')

figure  %绘制相平面
plot(xF(1,:), xF(2,:),'k');  %因为x=[x; v]
hold on
plot(xGood(:,1), xGood(:,2) ,'r');
%set(gca,'Fontsize',24) %设置图坐标轴字体大小的

%%
%p10 Example  of 2nd Order Differential Equation
clear all, close all, clc
A = [0 1; -2 -3];

t = 0:0.1:10;
y0 = [2; -3]; %initial condition

x = exp(-t)+exp(-2*t);
plot(t,x,'k','LineWidth',2)  %解析解
hold on
set(gca,'Fontsize',12)
xlabel('Time'); ylabel('Solution x')

[t,y] = ode45(@(t,y)A*y,t,y0);  %四阶龙格库塔近似解
plot(t,y(:,1),'r--','LineWidth',2)
legend('Analytic','ODE45')

