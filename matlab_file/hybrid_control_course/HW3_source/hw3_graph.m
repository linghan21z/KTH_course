% 创建新的图形窗口
figure;

% 定义左下角点坐标
x_start = -1.5;
y_start = -1.5;

% 定义方格大小
cell_width = 0.5;
cell_height = 0.5;

% 绘制方格图
for i = 0:5
    for j = 0:5
        % 计算方格的四个顶点坐标
        x = [x_start + j*cell_width x_start + (j+1)*cell_width x_start + (j+1)*cell_width x_start + j*cell_width x_start + j*cell_width];
        y = [y_start + i*cell_height y_start + i*cell_height y_start + (i+1)*cell_height y_start + (i+1)*cell_height y_start + i*cell_height];
        % 绘制方格
        plot(x, y, 'k');
        hold on;
    end
end

% 设置坐标轴范围
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);

% 设置坐标轴标签
xlabel('X');
ylabel('Y');

% 设置图形标题
title('6x6 方格图');

