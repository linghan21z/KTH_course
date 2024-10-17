%hw_lab4_1,参考课本例题1-21原题，例题6-9也能参考
function dx = hw_lab4_1(t,x)
dx=[x(2);(1-x(1)^2)*x(2)-x(1)];
end

%{
用M文件
[t,x]=ode45('hw_lab4_1',[0,30],[1;0]);%t取[0，30]，初值分别为[1,0]
subplot(1,2,1)
plot(t,x(:,1),t,x(:,2));title('解曲线');xlabel('t');ylabel('x(t)') %解曲线
subplot(1,2,2)
plot(x(:,1),x(:,2));title('相平面曲线');xlabel('x1');ylabel('x2');%相平面曲线
%}

%用simulink在命令行窗口输入
%{
 [t,x,y]=sim('hw_lab4_1sim') ;
x(0)=[1;0];
subplot(1,2,1)
plot(t,x);xlabel('t');ylabel('x(t)'); 
subplot(1,2,2)
plot(x(:,1),x(:,2));xlabel('x1');ylabel('x2');
%}