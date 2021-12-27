% Housing Problem Pricing Prediciton model
% Housing.txt file contains comma delinated data
% turn into matrices of data to solve gradient descent equation w constant step
% f(x) = 1/(2*m) ||X*w-y||^2
% m = number of training points
% X = housing data m*n matrix
% w = vector in Rn for weights
% y = price data vector in Rd

% STEP 1 IMPORT DATA & FILTER
clear
close all
data=load('Housing.txt'); % must be in same folder as script
X = data(:,1:2); %takes first and second column (sq feet and # bedrooms)
y = data(:,3); % takes third column, price
m = length(y); % counts data points and sets m equal to that

% STEP 2 SCALING get x1 and x2 in similar range (ideally [-1,1])
% mean scaling
mu = [];
d = [];
for i=1:size(X,2)
    mu(i) = mean(X(:,i));
    d(i) = std(X(:,i));
    Xs(:,i)=(X(:,i)-mu(i))/d(i);
end
X = Xs;

% STEP 3 EXTENDING X MATRIX FOR SOLVE
X=[ones(m,1) X];

% STEP 4 CALLING FUNCTION
% functions must be in same folder as this script
N = 1000; % iterations
t = 0.01; % constant stepsize
% [val,w] = GD(X,y,t,N); % call gradient descent constant
% plot(1:N,val);
s = 1;
[val,w,iter] = GD2(X,y); % call grad descent backtracing
plot(1:iter,val);

% STEP 5 MAKING PREDICITON
housing = [1, 2080, 4]; % 4 bed 2800 sq ft house
housing_scaling = [1,(2080-mu(1))/d(1),(4-mu(2))/d(2)];
price=housing_scaling*w;
fprintf('The predicted housing price is %6.0f',price)