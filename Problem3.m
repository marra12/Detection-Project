clear
load('T3_data_x_H0.mat')
load('T3_data_x_H1.mat')
load('T3_data_sigma_s.mat')
load('T3_data_sigma_w')

%% Estimating sigma_s and sigma_w by taking the mean

var_s = var(s_t);
var_w = var(w);

%% Our hypothesises and chi square
H0 = 2*abs(T3_data_x_H0).^2/var_s;
H1 = 2*abs(T3_data_x_H1).^2/(var_s+var_w);

x = 0:0.01:15;
Chi_2 = chi2pdf(x,2);
Chi_10 = chi2pdf(x,10);
const_H0 = 2/var_w;
const_H1 = 2/(var_w+var_s);
gamma_H0 = gampdf(x,1, 2*const_H0);
gamma_H1 = gampdf(x,1, 2*const_H1);

% plot(x*const_H0,chi2pdf(x,2),'m')
% hold on
% plot(x*const_H1,chi2pdf(x,2),'b')
% legend('H0','H1')
%% Plotting histograms
figure(1)
subplot(2,2,1)
histogram(H0)
title('H_0')

subplot(2,2,2)
histogram(H1)
title('H_1')

subplot(2,2,[3,4])
plot(x,real(Chi_2))
title('Chi-real, \nu = 2')

%% Plotting pdf for H0 and H1


% figure(2)
% plot(x/const_H0, Chi_2*const_H0, 'm','LineWidth',2)
% hold on
% plot(x/const_H1, Chi_2*const_H1, 'b','LineWidth',2)
% legend('p_0(x)', 'p_1(x)')
% title('PDF of test statistic')
% xlabel('T(x)=|X(0)|^2')

figure(2)
plot(x, gamma_H0, 'm','LineWidth',2)
hold on
plot(x, gamma_H1, 'b','LineWidth',2)
legend('p_0(x)', 'p_1(x)')
title('PDF of test statistic')
xlabel('T(x)=|X(0)|^2')

