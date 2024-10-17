%sinx approximated by polynomial
%p6课
clear all, close all
x = -10:.01:10;
y = sin(x);  %sinx
plot(x,y,'k','LineWidth',2)
axis([-10 10 -10 10])
grid on, hold on  %hold on保持图形继续在原图上作图

%%First-order Taylor expansion
P = [1 0];
yT1 = polyval(P,x); %x+0
plot(x,yT1,'b--','LineWidth',1.2)
hold on

%%Third-order Taylor expansion
P = [-1/factorial(3) 0 1 0]; 
yT3 = polyval(P,x); %-(1/3!)x^3+x+0
plot(x,yT3,'r--','LineWidth',1.2)

%%Fifth-order Taylor expansion
P = [1/factorial(5) 0 -1/factorial(3) 0 1 0]; 
yT5 = polyval(P,x); %(1/5!)x^5-(1/3!)x^3+x+0
plot(x,yT5,'c--','LineWidth',1.2)

%%Seventh-order Taylor expansion
P = [-1/factorial(7) 0 1/factorial(5) 0 -1/factorial(3) 0 1 0]; 
yT7 = polyval(P,x); %
plot(x,yT7,'m--','LineWidth',1.2)

