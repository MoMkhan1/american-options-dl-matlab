function [t,S,g] = simulate_paths(tmax,N_intervals,r,delta,S_0,sigma,M,K)
dt = tmax/N_intervals; % Time step between two consecutive samples
t = 0:dt:tmax; % Array of time instants
dW = sqrt(dt)*randn(M,N_intervals+1);
W = cumsum(dW,2);
S = S_0*exp((r-delta)*repmat(t,[M 1]) - (sigma/2)*W);
g = max(0,S-K);
end