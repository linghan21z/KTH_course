%hw_lab3_1
%欧拉法
clc
h=0.075;
t=0;yt=1/3; %初态
tk=[];y=[];
tk(1)=t;y(1)=yt;
for i=1:1.5/h  %迭代次数
%     t=i*h;
    dydt=-30*yt;
    yt=yt+dydt*h;
    y(i+1)=yt;
    tk(i+1)=i*h; %t
%     y=[y;yt]; %将新矩阵yt添加到结果矩阵y中
%     tk=[tk;t];    
end
plot(tk,y) %作图

%%
%试把上述欧拉法写一个循环，做成子图，已成功运行！
clc
hh=[0.05,0.075,0.1];%尝试运行的步长
j=1;
for h=hh[j]
    t=0;yt=1/3; %初态
    tk=[];y=[]; %建数组
    tk(1)=t;y(1)=yt; %数组第一个元素给
    for i=1:1.5/h  %迭代次数
        dydt=-30*yt;
        yt=yt+dydt*h;
        y(i+1)=yt;
        tk(i+1)=i*h; %t 
    end
    subplot(3,1,j)  %3行1列的子图
    plot(tk,y) %作图
    title(sprintf('h=%f',hh(j)))
    j=j+1; %下一个步长
end

%%
%龙格库塔写一个循环，做成子图
hh=[0.05,0.075,0.1] %尝试运行的步长
j=1;
for h=hh[j]
    t=0;yt=1/3; %初态
    tk=[];y=[]; %建数组
    tk(1)=t;y(1)=yt; %数组第一个元素给
    for i=1:1.5/h  %迭代次数
        k1=-30*yt; %dydt
        k2=-30*(yt+k1*h/2);  %课本公式3-12
        k3=-30*(yt+k2*h/2);
        k4=-30*(yt+k3*h);
        yt=yt+(k1+2*k2+2*k3+k4)*h/6;
        %存入向量中
        tk(i+1)=i*h; %t
        y(i+1)=yt;
    end
    subplot(1,3,j)  %13子图
    plot(tk,y) %作图
    title(sprintf('h=%f',hh(j)))
    j=j+1; %下一个步长
end
%%
%龙格库塔把0.05和0.075两个收敛的步长放一个图里
%  便于对比
clc
hh=[0.05,0.075] %尝试运行的步长
j=1;
for h=hh[j]
    t=0;yt=1/3; %初态
    tk=[];y=[]; %建数组
    tk(1)=t;y(1)=yt; %数组第一个元素给
    for i=1:1.5/h  %迭代次数
        k1=-30*yt; %dydt
        k2=-30*(yt+k1*h/2);  %课本公式3-12
        k3=-30*(yt+k2*h/2);
        k4=-30*(yt+k3*h);
        yt=yt+(k1+2*k2+2*k3+k4)*h/6;
        %存入向量中
        tk(i+1)=i*h; %t
        y(i+1)=yt;
    end
    % subplot(1,3,j)  %13子图
    plot(tk,y) %作图
    % title(sprintf('h=%f',hh(j)))
    hold on %把0.05和0.075两个收敛的步长放一个图里
    j=j+1; %下一个步长
end
legend('h=0.05','h=0.075','Location','southeast')

%%
%作出解析解
t=0:0.001:1.5;
y=(1/3)*exp(-30*t);
plot(t,y)

%%
sn = @(n) exp(-30*n)*1/3;
%使用匿名函数,
%匿名函数的作用主要是实现自己定义matlab中的函数
%优越性在于可以直接使用workspace中的变量，不必申明，非常适合嵌入到M文件
    fplot(sn,[0,1.5])
