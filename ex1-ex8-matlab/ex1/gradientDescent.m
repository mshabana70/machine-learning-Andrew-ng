function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

theta1 = theta(1);
theta2 = theta(2);

temp0 = 0;
temp1 = 0;
error = 0;

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    h = X * theta;

    temp0 = 0;
    temp1 = 0;
    for i = 1:m
        error = (h(i) - y(i));
        temp0 = temp0 + (error * X(i, 1));
        temp1 = temp1 + (error * X(i, 2));
        %disp(temp0);
    end

    theta1 = theta1 - ((alpha/m) * temp0);
    theta2 = theta2 - ((alpha/m) * temp1);
    theta = [theta1; theta2];

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
