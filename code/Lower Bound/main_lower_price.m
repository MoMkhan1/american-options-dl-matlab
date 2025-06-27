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
K = 100; % Strike price

[t,S,g] = simulate_paths(tmax,N_intervals,r,delta,S_0,sigma,M,K);

% Set Neural Network parameters
neurons_in_layer_2 = 2;
n2 = neurons_in_layer_2;
neurons_in_layer_3 = 3;
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

% Generate ML simulated paths of the process to use them to calculate the
% lower bound.
ML = 50; % Number of path to calculate the lower bound
% simulate ML paths to be used to calculate the lower bound 
[t,S,g] = simulate_paths(tmax,N_intervals,r,delta,S_0,sigma,ML,K);
delta = 30;
% Use the trained Neural Network to predict the minimu
Lsum = 0;
% frequency = zeros(9,1);
lower_g = zeros(1:ML);
for i = 1:ML
    % Read the data to estimate lower bound
    St = S(i,delta:delta:270);
    gt = g(i,delta:delta:270);
    j = 1;
    % Set the default time to sell at the maximum time
    lower_g(i) = g(9);
    for j = 1:8
        NN = BNN(j); % Read the j-th Neural Network from the array BNN
        W2 = NN.W2; % Store weights and bias of the Neural Network
        b2 = NN.b2;
        W3 = NN.W3;
        b3 = NN.b3;
        W4 = NN.W4;
        b4 = NN.b4;
    % Calculate Neural Network output with the j-th sample of St as input
        a2 = 1./(1+exp(-(W2*St(j) + b2)));
        a3 = 1./(1+exp(-(W3*a2+b3)));
        a4 = 1./(1+exp(-(W4*a3+b4))); % a4 is the Neural Network output
        if(gt(j) >= a4)
            lower_g(i) = gt(j);
            break
        end
    end
    % frequency(minimum_time) = frequency(minimum_time)+1;
    % Lsum = Lsum + minimum_time;
end
lower_bound = sum(lower_g)/ML;
standard_deviation = sqrt((sum((lower_g - lower_bound).^2))/(ML-1)); 
% fprintf('Minimum Stopping Time Frequencies.\n')
% for i = 1:9
%     fprintf('%.0f = %.0f   ',i,frequency(i))
% end
fprintf('\nThe calculated Lower Bound for the optimal value V is %.7f\n',lower_bound) 
fprintf('\nThe Standard deviation of the calculated Lower Bound is %.7f\n',standard_deviation) 

for i = 1:8
    figure (i)
    % figure(3)
    plot(1:length(savecost(1,:)),savecost(i,:))
    xlabel('Percentage of training iterations')
    ylabel('Error')
    title(sprintf('Neural Network Error in Theta_%d during the trainig process',i))
    grid on
end
