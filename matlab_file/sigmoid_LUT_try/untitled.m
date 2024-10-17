clear all
close all
% 定义 Sigmoid 函数
sigmoid = @(x) 1 ./ (1 + exp(-x));
% 定义定点数的位宽和小数位数
word_length = 8;   % 总位宽为 8
fraction_length = 5;  % 小数位宽为 4

% 生成查表的输入范围
% input_range = -10:0.5:10;  % 定义输入范围，例如 -10 到 10，间隔为 0.1
% 生成二进制输入范围
input_range = linspace(0, 1-2^(-5), 2^8); % 8 位二进制定点数（3 位整数部分，5 位小数部分）
input_fixed_point = fi(input_range, 0, word_length, fraction_length);
input_binary = bin(input_fixed_point);

% 计算 Sigmoid 函数的输出值
output_values = sigmoid(input_range);

% 绘制 Sigmoid 函数曲线
plot(input_range, output_values);
xlabel('Input');
ylabel('Sigmoid(Output)');
title('Sigmoid Function Lookup Table');


% 将生成的输出值转换为定点数对象
output_fixed_point = fi(output_values, 0, word_length, fraction_length);

% 显示定点数对象的值
% disp(output_fixed_point);
% 将定点数对象转换为二进制数
output_binary = bin(output_fixed_point);
%output_binary = dec2bin(output_fixed_point); 这个是十进制转换二进制

% 显示二进制数
%disp(output_binary);

%%
clc
clear all
% 定义 sigmoid 函数
sigmoid = @(x) 1 ./ (1 + exp(-x));

% 计算整数部分和小数部分的最大最小值
max_int_part = 2^(3-1) - 1; % 3 位整数部分的最大值
min_int_part = -2^(3-1);    % 3 位整数部分的最小值
max_frac_part = 1 - 2^(-5); % 5 位小数部分的最大值

% 生成输入范围
input_range = linspace(min_int_part + eps, max_int_part + max_frac_part, 2^8) % 8 位二进制有符号定点数

% 将有符号定点数转换为二进制字符串
% input_binary_str = dec2bin(input_range, 8); % 8 表示 3 位整数部分 + 1 位符号位 + 4 位小数部分
%%%%%%%%%%
word_length = 8;   % 总位宽为 8
fraction_length = 5;  % 小数位宽为 5
% 将生成的输出值转换为定点数对象
input_fixed_point = fi(input_range, 0, word_length, fraction_length);

% 显示定点数对象的值
% disp(output_fixed_point);
% 将定点数对象转换为二进制数
input_binary = bin(input_fixed_point)
disp(input_binary);
%%%%%%%%%%%

% 计算 sigmoid 函数的输出值
output_values = sigmoid(input_range);

figure
plot(input_range, output_values);
xlabel('Input');
ylabel('Sigmoid(Output)');
title('Sigmoid Function Lookup Table');

% % 定义定点数的位宽和小数位数
word_length = 8;   % 总位宽为 8
fraction_length = 5;  % 小数位宽为 5
% 将生成的输出值转换为定点数对象
output_fixed_point = fi(output_values, 0, word_length, fraction_length);

% 显示定点数对象的值
% disp(output_fixed_point);
% 将定点数对象转换为二进制数
binary = bin(output_fixed_point)

% 显示二进制数
%disp(output_binary);


