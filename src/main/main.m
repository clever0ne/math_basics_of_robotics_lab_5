% Лабораторная работа №5
clc; close all; clear;

%% Задание 1. Скорость выходного звена пятизвенного манипулятора
dh_params = load_data('../../dh_params_1.txt');
q = load_data('../../joint_coordinates_1.txt');
qd = load_data('../../joint_velocities_1.txt');
[v1, omega1] = end_effector_speed(q, qd, dh_params);
save_data(v1, omega1, '../../velocities_1.txt');

%% Задание 2. Скорость выходного звена шестизвенного манипулятора
dh_params = load_data('../../dh_params_2.txt');
q = load_data('../../joint_coordinates_2.txt');
qd = load_data('../../joint_velocities_2.txt');
[v2, omega2] = end_effector_speed(q, qd, dh_params);
save_data(v2, omega2, '../../velocities_2.txt');
