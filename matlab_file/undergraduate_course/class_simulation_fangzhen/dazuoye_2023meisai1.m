%先用'Import Data'将Excel中数据导入Workspace
%用APPS中的'Curve Fitting'进行拟合得到曲线大致形状
p=polyfit(x,y,8);
y1=polyval(p,x);
plot(x,y,'r',x,y1,'b') 
title('报告数量拟合曲线');
ylabel('报告数量/份');
xlabel('时间/天数');
legend('真实值','多项式拟合','Location','northeast')

%%
clc
%原始序列的ADF检验
[h,pValue,stat,cValue] = adftest(y)
%一阶差分序列的ADF检验,通过
dy1 = diff(y,1);
[h,pValue,stat,cValue] = adftest(dy1,'alpha',0.05)
% ACF和PACF法，确定阶数p=5,q=3
figure;
subplot(4,1,1);
plot(y,'LineWidth',1.5);
title('原序列时序图')
subplot(4,1,2);
plot(dy1);
title('一阶差分时序图')
subplot(4,1,3);
autocorr(dy1);
title('ACF自相关系数图');
subplot(4,1,4);
parcorr(dy1)
title('PACF偏自相关系数图');

%%
clc
r = y;
N = x;
model = arima('ARLags',5,'D',1,'MALags',3,'Variance',garch(1,1),...
              'Distribution','t');%Build ARIMA-GARCH
fit = estimate(model,r,'Variance0',{'Constant0',0.001});
[E0,V0] = infer(fit,r); %EO为残差
% Forecast returns and conditional variances.
[Y,YMSE,V] = forecast(fit,60,'Y0',r,'E0',E0,'V0',V0);%预测60个值
%95%的区间估计
upper = Y + 1.96*sqrt(YMSE);
lower = Y - 1.96*sqrt(YMSE);
 
figure
subplot(2,1,1)
plot(r,'Color',[.75,.75,.75])
hold on
plot(length(y):length(y)+60,Y,'r','LineWidth',2)
plot(length(y):N+60,[upper,lower],'k--','LineWidth',1.5)
title('Forecasted Returns')
hold off
subplot(2,1,2)
plot(V0,'Color',[.75,.75,.75])
hold on
plot(N:N+60,V,'r','LineWidth',2);
title('Forecasted Conditional Variances')
hold off



%%
%残差检验
clc
AR_Order=5;MA_Order=3;
Mdl = arima(AR_Order, 1, MA_Order);  %第二个变量值为1，即一阶差分
EstMdl = estimate(Mdl,y);
[res,~,logL] = infer(EstMdl,y);   %res即残差
[h,pVal]=archtest(res)
%pValue= 1.2178e-10, 这说明不存在ARCH效应。
stdr = res/sqrt(EstMdl.Variance);
figure('Name','残差检验')
subplot(1,2,1)
plot(stdr)
title('Standardized Residuals')
subplot(1,2,2)
histogram(stdr,10)
title('Standardized Residuals')
figure
subplot(1,2,1)
autocorr(stdr)
subplot(1,2,2)
parcorr(stdr)
figure
qqplot(stdr)

%%
%预测
step = 60; %预测步数为300,也就是3月1
data=y;
[forData,YMSE] = forecast(EstMdl,step,'Y0',data); 
% lower = forData - 1.96*sqrt(YMSE); %95置信区间下限
% upper = forData + 1.96*sqrt(YMSE); %95置信区间上限
lower = forData - 2.576*sqrt(YMSE); %99置信区间下限
upper = forData + 2.576*sqrt(YMSE); %99置信区间上限
figure()
plot(data,'Color',[.75,.75,.75]);
hold on
h1 = plot(length(data):length(data)+step,[data(end);lower],'r:','LineWidth',2);
plot(length(data):length(data)+step,[data(end);upper],'r:','LineWidth',2)
h2 = plot(length(data):length(data)+step,[data(end);forData],'k','LineWidth',2);
legend([h1 h2],'99% 置信区间','预测值',...
	     'Location','NorthWest')
title('Forecast')
hold off



%%
clc
%白噪声检验，继续使用前么的一阶差分之后的数据dy1
yanchi=[6,12,18];   %做6.12.18步延迟
[H,pValue,Qstat,CriticalValue]=lbqtest(dy1,'lags',yanchi);
%lb检验  'lags'按照步长  延迟 ，dy1改变就好了
%H,结果，p概率，Qlb的统计量,临界值
fprintf('%15s%15s%15s','延迟阶数','卡方统计量','p值');%把逗号后的字符串，15s的空格
fprintf('\n');
for i=1:length(yanchi)    %i=1,时候为6，i=2时候为12
    fprintf('%18f%19f%19f',yanchi(i),Qstat(i),pValue(i));
    fprintf('\n');
end
%p比0.05大接受原假设
%原假设：一阶差分后序列延迟1.6.12步相关系数=0

%%
%平均百分比误差MAPE
