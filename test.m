clear;

clear
load('T8_numerical_experiment.mat');
data = T8_numerical_experiment;
%% NP detector
T = zeros(1, 100);
t = 0;
K = 256;
x=1:100;
%% Using test statistic

for n = 1 : 100
    
    for i = 1 : K
    t = t + abs(data(i, n))^2;
    end
    
    T(n) = t;
    t = 0;
end
stem(x, T)


% x = 1:1:K;
% plot(x-1, data(x,1))



