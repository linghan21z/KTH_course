%hw_lab1_1
A=[1 2;3 4]
A.^(0.5);
A^(0.5);
sqrt(A)
sqrtm(A)

%%
%hw_lab1_2_2
x1=-2;
x2=-3;
x3=4;
y1=3*x1^2+abs(x2)+sqrt(x3)
y2=3*x1^2-x2-x3

%%
%hw_lab1_3
[NUM,TXT,RAW]=xlsread('year_population.xlsx')
filename = 'year_population.xlsx';
A = readtable(filename);
x=A(1,2:11);
y=A(2,2:11);
clc
clear all
 x0=[1910 1920 1930 1940 1950 1960 1970 1980 1990 2000];
 y0=[75.995 91.972 105.71 123.2 131.67 150.7 179.32 203.21 226.5 249.63];
x1=1910:1.00:2000; %确定需要插值的点
y1=interp1(x0,y0,x1,'spline'); %三次样条插值
y2=interp1(x0,y0,x1,'cubic'); %三次多项式插值
plot(x1,y1,'ro',x1,y2,'b',x0,y0,'kd') %红色是三次样条插值，蓝色是三次多项式插值的，黑色菱形（x0,y0）为已知数据
for i=1:length(y0)
    gtext(num2str(y0(i)))  %标出已知数据的值，黑色菱形（x0,y0）
end
title('year-population')
ylabel('population')
xlabel('year')
legend('spline','cubic','已知数据','Location','southeast')

%%
%拟合上一题曲线
 x=[1910 1920 1930 1940 1950 1960 1970 1980 1990 2000];
 y=[75.995 91.972 105.71 123.2 131.67 150.7 179.32 203.21 226.5 249.63];
p=polyfit(x,y,4)
x1=1910:1.00:2000; %确定需要插值的点
y1=polyval(p,x1);
plot(x,y,'k--',x1,y1,'mo')  %黑色是xy,粉色是插值的

%%
hw_lab1_4
clc
syms t
t=1:0.00005:5;
y=exp(-1*t).*cos(10*t);
y1=0.05+0*t;
y2=-0.05+0*t;
plot(t,y,'b',t,y1,'k',t,y2,'r')  %先用作图法求交点
legend('y','y1=0.05','y2=-0.05','Location','southeast')
ts=fsolve('qiuts',[3,-0.5,-0.5])  %再用解方程的方法求接近3的解
