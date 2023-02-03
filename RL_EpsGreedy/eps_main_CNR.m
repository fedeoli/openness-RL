% ---------------------------------------- %
%  File: eps_main.m                        %
%  Date: February 22, 2022                 %
%  Author: Alessandro Tenaglia             %
%  Email: alessandro.tenaglia@uniroma2.it  %
% ---------------------------------------- %

clear; close all; clc;

%% Deterministic and stationary case: constant vs decreasing eps
close all;
rng(1);
nArms = 1;
stat = true;
alphas = 0;
nIters = 2000;
initEst = ones(nArms, 1);
epsilons = 1;
epsconst = false;

% define input
input_file = 'versione8/input_CNR.xlsx';
action_table = 'versione8/actionsTable.xlsx';
exec_file = 'versione8/OPENNESS_RomaTermini_v8_InputExcel_linux.sh';
dir_results = 'versione8/Risultati';
dir_storage = 'versione8/Store';

% Run
eg = EpsGreedy_CNR(stat, alphas, nIters, initEst, ...
                   input_file, exec_file, dir_results, dir_storage, action_table, ...
                   epsilons, epsconst);
% eg = eg.read_store_dir();
eg = eg.run();


