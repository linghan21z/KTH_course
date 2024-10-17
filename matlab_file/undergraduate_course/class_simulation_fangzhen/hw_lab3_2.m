%hw_lab3_2
r=input('输入R=');
P=input('传递函数p=');
W = input('W=');
W0= input('W0=');
Wc= input('Wc=');
Tf=input('仿真时间Tf：');
h=input('计算步长h：');
A1=diag(P(:,1)); %把P的第一列作为A1的对角
B1=diag(P(:,2));
C1=diag(P(:,3));
D1=diag(P(:,4));
H=B1-D1*W;
Q=C1*W-A1;
A=inv(H)*Q; %inv是求矩阵逆
B=inv(H)*C1*W0;
x=[zeros(length(A),1)]; %x是A的长度的大小
y=[zeros(length(Wc(:,1)),1)]; %y是Wc的第一列的大小
t=0;
for i=1:Tf/h 
    k1=A*x+B*r;  %四阶龙格库塔
    k2=A*(x+h*k1/2)+B*r;
    k3=A*(x+h*k2/2)+B*r;
    k4=A*(x+h*k3)+B*r;
    x=x+h*(k1+2*k2+2*k3+k4)/6;
    y=[y,Wc*x]; %把Wc*x放进y
    t=[t,t(i)+h]; 
end
plot(t,y)
