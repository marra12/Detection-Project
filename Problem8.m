clear
load('T8_numerical_experiment.mat');
data = T8_numerical_experiment;
%% Threshold values
var_s = 5;
var_w = 1;
Pfa = 0.1;
K = 256;
lambdaM_norm = sqrt(sqrt(K)*var_w)*qfuncinv(Pfa) + K*var_w;
x=200:0.01:300;
normH0 = normpdf(x,K*var_w,(sqrt(K)*var_w)^(1/2));
lambdaM_gamma = gaminv(1-Pfa,K,var_w);


figure(1)
plot(x, normH0)

%% NP detector
T = zeros(1, 100);
t = 0;

%% Using test statistic

for n = 1 : 100  
    for i = 1 : K
    t = t + abs(data(i, n))^2;
    end
    
    T(n) = t;
    t = 0;
end
x1  = 0:100-1;
figure(2)
stem(x1,T,'mx')
hold on
plot(x1, lambdaM_gamma*ones(length(x1)),'c')

% figure
% x2 = 1:1:K;
% plot(x2-1, data(x2,2))

