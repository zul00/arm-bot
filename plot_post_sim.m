close all
clear all

%% Load data
load('setpoint.mat');
load('model.mat');
load('robot.mat');

%% Calculate error
err_Xm = log_Xsp - log_Xm;
err_Ym = log_Ysp - log_Ym;
err_Zm = log_Zsp - log_Zm;

err_Xr = log_Xsp - log_Xr;
err_Yr = log_Ysp - log_Yr;
err_Zr = log_Zsp - log_Zr;

err_Tm = (err_Xm.^2 + err_Ym.^2 + err_Zm.^2).^0.5;
err_Tr = (err_Xr.^2 + err_Yr.^2 + err_Zr.^2).^0.5;

%% Plot log
figure(1)
subplot(2,1,1)
    title('X Position');
    hold on
    plot(log_t, log_Xsp, 'Linewidth', 1.5)
    plot(log_t, log_Xm, 'Linewidth', 1.5)
    plot(log_t, log_Xr, 'Linewidth', 1.5)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('set point', 'model', 'robot')
subplot(2,1,2)
    title('X Error');
    hold on
    plot(log_t, err_Xm, 'Linewidth', 1.5)
    plot(log_t, err_Xr, 'Linewidth', 1.5)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('model error', 'robot error')

figure(2)
subplot(2,1,1)
    title('Y Position');
    hold on
    plot(log_t, log_Ysp, 'Linewidth', 1.5)
    plot(log_t, log_Ym, 'Linewidth', 1.5)
    plot(log_t, log_Yr, 'Linewidth', 1.5)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('set point', 'model', 'robot')
subplot(2,1,2)
    title('Y Error');
    hold on
    plot(log_t, err_Ym, 'Linewidth', 1.5)
    plot(log_t, err_Yr, 'Linewidth', 1.5)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('model error', 'robot error')

figure(3)
subplot(2,1,1)
    title('Z Position');
    hold on
    plot(log_t, log_Zsp, 'Linewidth', 1.5)
    plot(log_t, log_Zm, 'Linewidth', 1.5)
    plot(log_t, log_Zr, 'Linewidth', 1.5)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('set point', 'model', 'robot')
subplot(2,1,2)
    title('Z Error');
    hold on
    plot(log_t, err_Zm, 'Linewidth', 1.5)
    plot(log_t, err_Zr, 'Linewidth', 1.5)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('model error', 'robot error')
    
figure(4)
subplot(2,1,1)
    title('Model');
    hold on
    plot(log_t, log_Xsp, 'Linewidth', 1.5)
    plot(log_t, log_Ysp, 'Linewidth', 1.5)
    plot(log_t, log_Zsp, 'Linewidth', 1.5)
    plot(log_t, err_Tm, 'Linewidth', 2.0)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('Xsp', 'Ysp', 'Zsp', 'Error')
 subplot(2,1,2)
    title('Robot');
    hold on
    plot(log_t, log_Xsp, 'Linewidth', 1.5)
    plot(log_t, log_Ysp, 'Linewidth', 1.5)
    plot(log_t, log_Zsp, 'Linewidth', 1.5)
    plot(log_t, err_Tr, 'Linewidth', 2.0)
    hold off
    xlabel('t');
    ylabel('cm');
    legend('Xsp', 'Ysp', 'Zsp', 'Error')
