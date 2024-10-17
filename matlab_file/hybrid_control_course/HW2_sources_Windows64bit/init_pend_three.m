 function init_pend_three
 
global executionTime
executionTime = 0.006; %executiontime for the controller

schedulingPolicy = 'prioDM'; %the scheduling policy used in the simulation
%schedulingPolicy = 'prioEDF';
ttInitKernel(schedulingPolicy);

T = [0.02 0.029 0.035]; % Task periods
names= {'pid_task1', 'pid_task2', 'pid_task3'};

wVec = [9.9 7 5.7];
% Create three tasks
for i = 1:3
    w = wVec(i);
    % Design a LQG-controller
    sys = tf(w^2, [1 0 -(w^2)]);
    [cont,~,~,~,~,~] = lqgcalculation(sys, [1 0;0 0.002],0.1*eye(2),0.1,T(i),0);
    [A B C D] = ssdata(cont);
    
    data.A = A;
    data.B = B;
    data.C = C;
    data.D = D;
    data.state = [0; 0; 0];
    data.u = 0;
    data.theta_Chan = i;
    data.uChan = i;
    data.late=0;
    ttCreatePeriodicTask(names{i}, 0.0,T(i), 'pend_reg_three_code', data);
end


%%
y_values = Theta.signals.values;
plot(y_values) % 

%xlabel('t/ms'); % x_label
xlabel('t/10^4s'); % x_label
ylabel('Pendulum angles'); % y_label
title('Pendulum angles-time'); 

legend( 'Pendulum1','Pendulum2' ,'Pendulum3');

% %%
% %x = linspace(0, 0.1, 100);
% %x = linespace(0,0.1,100);
% y_values = Schedule.signals.values;
% %y_values = Theta.signals.values;
% plot(y_values) % 
% xlim([0, 1000]);
% x = 0:100:1000; 
% %x = linespace(0,10,100);
% new_xticks = [0, 100, 200, 300, 400,500,600,700,800,900,1000]; % 新的刻度位置
% new_xticklabels = {'0', '10', '20', '30', '40','50','60','70','80','90','100'}; % 新的刻度标签
% 
% %xticks([0,10,20]); % 设置刻度位置为空向量
% xticks(new_xticks);
% xticklabels(new_xticklabels);
% 
% xlabel('t/ms'); % x_label
% %xlabel('t/s'); % x_label
% %ylabel('Pendulum angles'); % y_label
% %title('Pendulum angles-time'); 
% title('Schedule plot'); 
% legend( 'Pendulum1','Pendulum2' ,'Pendulum3');
% 
% 
% %%
% %x = linspace(0, 0.1, 100);
% %x = linespace(0,0.1,100);
% %y_values = Schedule.signals.values;
% y_values = Theta.signals.values;
% plot(y_values) % 
% 
% %xlabel('t/ms'); % x_label
% xlabel('t/s'); % x_label
% ylabel('Pendulum angles'); % y_label
% title('Pendulum angles-time'); 
% 
% legend( 'Pendulum1','Pendulum2' ,'Pendulum3');
% 
% %%
% %task14,plot
% save task14_004 t004 y004
% %%
% load task14_00399.mat
% %%
% y_values1 = ry1.signals.values;
% %y_values = Theta.signals.values;
% plot(tout, y_values1) % 
% xlabel('t/ms'); % x_label
% ylabel('Pendulum angles'); % y_label
% %%
% plot(t001, y001, t003, y003, t399, y399, t004, y004) % 
% xlabel('t/s'); % x_label
% ylabel('Pendulum angles'); % y_label
% title('Pendulum angles-time'); 
% legend( '\tau = 0.01s','\tau = 0.03s' ,'\tau = 0.0399s','\tau = 0.04s');





