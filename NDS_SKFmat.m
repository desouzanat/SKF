%% Nathalia De Souza -- Standard Kalman Filter

clear 
close all
clc

%% Initial Conditions

wn = 2;             % natural frequency [rad/s]
DCR = 0.7;          % damping ratio [unitless]
x0 = 0.5;           % initial displacement [m]
xdot0 = -0.01;      % initial velocity [m/s]
Q = 0.1;            % covariance of process noise
R = 0.1;            % covariance of measurement noise
sigma = 0.1;        % process and measurement standard deviation
deltat = 0.1;       % time-step [s]
time = 10;          % simulation time [s]


% state and measurement equation coefficients
A = [(-2 * DCR * wn) -(wn^2); 1 0];
B = [wn^2; 0];
C = [0 1];
D = 0;

%% State-Space Model

sys_c = ss(A, B, C, D);     % continuous-time state-space model

sys_d = c2d(sys_c, deltat); % conversion from continuous-time dynamic system to discrete time

%% Assumptions:

F_k1 = sys_d.A; % state transition matrix; applied to a priori
G_k1 = sys_d.B; % control input matrix
H_k1 = sys_d.C; % observation matrix
L_k1 = G_k1;
M_k1 = 1;

xhat0 = [0; 0];            % inital starting state of the system
Pk0 = eye(size(xhat0, 1)); % initial a posteriori covariance; dimensions based off the dimensions of xhat


%% Plots

out = sim('NDS_SKF.slx');

figure(1)

sgtitle('Standard Kalman Filter', 'interpreter', 'latex')
subplot(2,2,1)
plot(out.cont_noise{1}.Values, 'LineWidth', 1.25)
grid on

% subplot 1
title('System Comparison', 'interpreter', 'latex')
ylabel('Positon, $y_{x}$ [m]', 'interpreter', 'latex')
xlabel('Time [s]', 'interpreter', 'latex')
hold on
plot(out.cont_nonoise{1}.Values, 'LineWidth', 1.25)
hold on
plot(out.cont_noise_KF{1}.Values, 'LineWidth', 1.25)
legend('With Noise', 'Without Noise', 'With Noise and Kalman Filter', 'interpreter', 'latex')

% subplot 2
subplot(2,2,2)
plot(out.cont_nonoise{1}.Values, 'LineWidth', 1.25)
grid on
title('Continuous System Without Noise', 'interpreter', 'latex')
ylabel('Positon, $y_{x}$ [m]', 'interpreter', 'latex')
xlabel('Time [s]', 'interpreter', 'latex')

% subplot 3
subplot(2,2,3)
plot(out.cont_noise{1}.Values, 'LineWidth', 1.25)
grid on
title('Continuous System with Noise', 'interpreter', 'latex')
ylabel('Positon, $y_{x}$ [m]', 'interpreter', 'latex')
xlabel('Time [s]', 'interpreter', 'latex')

% subplot 4
subplot(2,2,4)
plot(out.cont_noise_KF{1}.Values, 'LineWidth', 1.25)
grid on
title('Continuous System with Noise and Kalman Filter', 'interpreter', 'latex')
ylabel('Positon, $y_{x}$ [m]', 'interpreter', 'latex')
xlabel('Time [s]', 'interpreter', 'latex')
