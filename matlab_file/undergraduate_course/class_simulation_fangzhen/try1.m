%%
a = [1 2 3;4 5 6; 7 8 9]
c=[a;[10,11,12]]
d=c(1:3,1:2);
f= d'; %转置
g= d.'; %共轭转置
a = [1 2;3 4]+i*[5 6;7 8];

%%
A=[1 2 3;4 5 6; 7 8 9]; 
p=poly(A) %特征多项式、特征方程
r=roots(p)'

%%
a=[0 -1 2];
b=[-3 1 2];
a<b; %关系运算
~a

%%
%单矢量绘图
y=[0 0.48 0.84 1 0.91 0.6 0.14];
% hist(y)
% stem(y)
% stairs(y)
% bar(y)
% barh(y) %三维
% bar3h(y) %横向三维
% plot(y)
%双矢量绘图
% x=0:0.1:2*pi;
% y=sin(x);
% subplot(1,2,1) %排成两行一列的子图
% plot(x,y)
% subplot(1,2,2)
% semilogx(y)
x=0:pi/50:2*pi;
y1=sin(x);
y2=0.6*sin(x);
y3=0.3*sin(x);
% plot(x,y1,x,y2,x,y3) %多组变量绘图
% plotyy(x,y1,x,y2) %共用一个x轴
% 绘三维图
% 曲线图
% t=0:pi/50:10*pi;
% plot3(sin(t),cos(t),t)
%生成网格矩阵数据x和y meshgrid
% [x,y]=meshgrid(-3:0.1:3,-2:0.1:2); 
% z=(x.^2-2*x).*exp(-x.^2-y.^2-x.*y);
% mesh(x,y,z); %网格图
% surf(x,y,z); %着色图

%%
%用varargin实现任意多个多项式的积
% function a=convs(varargin)
% a=1;
% for i=1:length(varargin)
%     a=conv(a,varargin{i});
% end
% 
% P=[1 1 1];Q=[1 2];F=[1 2 3]
% D=convs(P,Q,F)


%%
%PPT最后的作业
% x=-5:0.1:5; %要执行按元素相乘，用 '.*'
% y=0.5*x.*x;
% plot(x,y,'-r')

%%
x=linspace(0,2*pi,80);
y=sin(x);
p=polyfit(x,y,6) %拟合
y1=polyval(p,x); %多项式求值函数
plot(x,y,'ro',x,y1,'b')
