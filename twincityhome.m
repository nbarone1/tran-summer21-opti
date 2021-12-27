% TWIN CITY PREDICTION
clear
close all

% STEP 1 SET DATA
load('TwinCityHomes.mat');
% Set each var as vector and concatenate into X
y = ListPrice1;
m = length(y);
b1 = BEDS1;
b2 = BATHS1;
a = Age1;
p = ParkingSpots1;
l = LotSize1;
s = SQFT1;
X = [b1 b2 s l a p]
% data = TwinCityHomes;
% X = data(:,[2:7])
% y = data(:,1);
% m = length(y);

%STEP 2 SCALING
mu = [];
d = [];
for i=1:size(X,2)
    mu(i) = mean(X(:,i));
    d(i) = std(X(:,i));
    Xs(:,i)=(X(:,i)-mu(i))/d(i);
end
X = Xs;

% STEP 3 Extend
X = [ones(m,1) X];

% STEP 4 CALL FUNCTION
% Constant Step Code
% N = 1000
% t = 0.01
% function call
% plot
% Back Tracking
[val,w,iter] = GDTC(X,y);
plot(1:iter,val)
% STEP 5 Prediction
% housing = [1, 4, 2.5, 2080, 5600, 14, 2];
% housing_scaling = [1, (4-mu(1))/d(1),(2.5-mu(2))/d(2), (2080-mu(3))/d(3), (5600-mu(4))/d(4), (14-mu(5))/d(5), (2-mu(6))/d(6)];
housing = [4, 2.5, 2080, 5600, 14, 2];
for i=1:size(housing,2)
    z(:,i)=(housing(:,i)-mu(i))/d(i);
end
housing_scaling = [1 z];
price = housing_scaling*w;
fprintf('The predicted house price is %6.0f', price)
