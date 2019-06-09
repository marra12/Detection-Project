clear
load('T3_data_x_H0.mat')
load('T3_data_x_H1.mat')
load('T3_data_sigma_s.mat')
load('T3_data_sigma_w')

%% Estimating sigma_s and sigma_w by taking the mean

var_s = var(s_t);
var_w = var(w);

%% Pdf of test statistic using gamma
x = 0:0.01:256;
const_H0 = var_w/2;
const_H1 =(var_w+var_s)/2;
K=30;
Chi_K = chi2pdf(x,K);

figure(1)
gamh0 = gampdf(x, K, 2*const_H0);
gamh1 = gampdf(x, K, 2*const_H1);
plot(x,gamh0, 'b','LineWidth',1.4)
hold on
plot(x,gamh1, 'c','LineWidth',1.4)
legend('p_0(x)', 'p_1(x)')
title('PDF of test statistic using gamma distribution')
xlabel('T(x)=\Sigma|X(n)|^2')
%% Pdf using chi^2
% Chi_K = chi2pdf(x,K);

% figure(2)
% plot(x/const_H0, Chi_K*const_H0, 'm','LineWidth',2)
% hold on
% plot(x/const_H1, Chi_K*const_H1, 'b','LineWidth',2)
% legend('p_0(x)', 'p_1(x)')
% title('PDF of test statistic using \chi^2')
% xlabel('T(x)=\Sigma|X(n)|^2')

%% Pdf using central limit
% gaussian_H0 = normpdf(x, K, 2*K);
% gaussian_H1 = chi2pdf(x, K);
% % gaussian_H0 = normpdf(x,(2/var_w)*K*var_w,(4/var_w^2)*2*K*var_w^2);
% % gaussian_H1 = normpdf(x,K*(var_w+var_s),2*K*(var_w+var_s)^2);
% figure(2)
% plot(x,gaussian_H0)
% hold on
% plot(x,gaussian_H1)

%% ROC using gaussian
K = 256;
lambda = 0:0.01:1000;
lambda_ = (var_w*(var_w+var_s)/var_s)*(log(lambda)-K*log(var_w/(var_s+var_w)));
Pfa = qfunc((lambda_- K*var_w)/sqrt(sqrt((K)*var_w)));
Pd = qfunc((qfuncinv(Pfa)*sqrt(sqrt(K)*var_w) - K*var_s)/sqrt((sqrt(K)*(var_w+var_s))));

figure(2)
plot(Pfa, Pd,'m','Linewidth',1.4)
title('ROC using gaussian')
xlabel('P_F_A')
ylabel('P_D')
