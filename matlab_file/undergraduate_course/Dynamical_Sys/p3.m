%Differential Equations and Dynamical Systems
%p3第三课
clear all, %clear all memories
close all, %close windows
clc %clc command window
A = [0.5 0.5 0.25;
    0.25 0.0 0.25;
    0.25 0.5 0.5];
xtoday = [1; 0; 0]; %if tomorrow is rainy state

for k=1:50
    k
    xtomorrow = A * xtoday
    xtoday = xtomorrow;
end
%收敛，与特征值和特征性向量有关
[T,D]=eig(A) %求A的特征向量T和特征值D
evec1 = T(:,1) %特征向量T的第一列
sum(evec1)
evec1 = evec1/sum(evec1) %归一化，使一列加起来为1

