% main program
% close all figures, removes all variables from the current workspace and
% clears all the text from the Command Window clearing the screen.
close all
clear
clc

% Set parameters for simulated data paths generation
tmax = 3; % Total simulation time
N_intervals = 270; % Number of subintervals 
r = 0.05; % Risk-free interest rate
delta = 0.1; % Dividend yields
S_0 = 90; % Initial value of S at t=0
sigma = 0.2; % Volatility
M = 50; % Number of paths to be simulated
K = 90; % Strike price

[t,S,g] = simulate_paths(tmax,N_intervals,r,delta,S_0,sigma,M,K);

% Set Neural Network parameters
neurons_in_layer_2 = 75;
n2 = neurons_in_layer_2;
neurons_in_layer_3 = 75;
n3 = neurons_in_layer_3;
neurons_in_layer_4 = 1;
n4 = neurons_in_layer_4;

% Set Neural Network training parameters
eta = 0.15; % Learning Rate
Niter = 1e6; % Number of Stochastic Gradient iterations
Niter_to_plot = 1e4; % Number of iterations between progress evaluations

tic
[BNN,savecost] = train_network(n2,n3,n4,S,g,eta,Niter,Niter_to_plot);
toc

for i = 1:8
    figure (i)
% figure(3)
plot(1:length(savecost(1,:)),savecost(i,:))
xlabel('Percentage of training iterations')
ylabel('Error')
title(sprintf('Neural Network Error in Theta_%d during the trainig process',i))
grid on
end

