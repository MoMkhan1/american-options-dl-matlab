function [BNN,savecost] = train_network(neurons_2,neurons_3,neurons_4,S,g,eta,Niter,Niter_to_plot)
% scale input data to fit into the interval [0,1]
scale_g = 1/(1.1*max(max(g)));
g = g*scale_g;
scale_S = 1/(1.1*max(max(S)));
S = S*scale_S;

[rows,columns] = size(S);
M = rows;
N_intervals = columns - 1; 

savecost = zeros(9,100); % value of cost function at each iteration

% Enter a loop for training Neural Networks to approximate the conditional 
% expectations of G(xn). There should be a trained Neural Network for each tn.
for network_index = 8:-1:1

% Randomly initialize each neural network setting neurons weights and bias
W2 = 0.5*randn(neurons_2,1);
b2 = 0.5*randn(neurons_2,1);
W3 = 0.5*randn(neurons_3,neurons_2);
b3 = 0.5*randn(neurons_3,1);
W4 = 0.5*randn(neurons_4,neurons_3);
b4 = 0.5*randn(neurons_4,1);

% Select the n-th simulated data set of the underlying process S and
% the corresponding (n+1)-th simulated expectation of G(Sn) and use
% them to train the Neural Network
delta_data = N_intervals/9;
y = g(:,(network_index+1)*delta_data);
% xx = S(:,network_index*delta_data);
xx = S(:,(network_index+1)*delta_data-1);    
    
    
    % Initiate the training loop for a specific Neural Network
    
    
    
    i_to_plot = 0;
    point_to_plot = 0;
    for counter = 1:Niter
        k = randi(M); % Randomly choose a training point
        x = xx(k);
        % Forward pass
        a2 = 1./(1+exp(-(W2*x  + b2)));
        a3 = 1./(1+exp(-(W3*a2 + b3)));
        a4 = 1./(1+exp(-(W4*a3 + b4)));

        % Backward pass
        delta4 = a4.*(1-a4).*(a4-y(k));
        delta3 = a3.*(1-a3).*(W4'*delta4);
        delta2 = a2.*(1-a2).*(W3'*delta3);

        % Gradient step
        W2 = W2 - eta*delta2*x';
        W3 = W3 - eta*delta3*a2';
        W4 = W4 - eta*delta4*a3';
        b2 = b2 - eta*delta2;
        b3 = b3 - eta*delta3;
        b4 = b4 - eta*delta4;
        
        
        
        % Monitor progress
        i_to_plot = i_to_plot + 1;
        if (i_to_plot == Niter_to_plot)
            point_to_plot = point_to_plot + 1;
            i_to_plot = 0;
            costvec = zeros(M,1);
            for j = 1:M
                a2 = 1./(1+exp(-(W2*xx(j) + b2)));
                a3 = 1./(1+exp(-(W3*a2+b3)));
                a4 = 1./(1+exp(-(W4*a3+b4)));
                costvec(j) = norm(y(j) - a4,2);
            end
            savecost(network_index,point_to_plot) = norm(costvec,2)^2;
        end
    end
    NN.W2 = W2;
    NN.b2 = b2;
    NN.W3 = W3;
    NN.b3 = b3;
    NN.W4 = W4;
    NN.b4 = b4;
    BNN(network_index) = NN;

end
    

% figure (2)
% semilogy(1:point_to_plot,savecost(1:point_to_plot))
% xlabel('Percentage of training iterations')
% ylabel('Log(error)')
% title('Neural Network Error in logaritmic scale during the trainig process')
% figure(3)
% plot(1:point_to_plot,savecost(1:point_to_plot))
% xlabel('Percentage of training iterations')
% ylabel('Error')
% title('Neural Network Error during the trainig process')

end

