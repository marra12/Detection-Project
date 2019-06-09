clear;

%% Problem 2: Performance of the one-sample-detector

load('T3_data_x_H0.mat')
load('T3_data_x_H1.mat')
load('T3_data_sigma_s.mat')
load('T3_data_sigma_w')

T3_data_w = w;
clear w;

T3_data_s = s_t;
clear s_t;
%% estimating var_s and var_w by using the mean estimator

var_s = var(T3_data_s);
var_w = var(T3_data_w);

% Finding 

h0_vec = 2*( abs(T3_data_x_H0).^2 )/var_w;
%h0_vec = ( abs(T3_data_x_H0).^2 );

h1_vec = 2*( abs(T3_data_x_H1).^2 )/(var_w + var_s);
%h1_vec = ( abs(T3_data_x_H1).^2 );

% finding true PDFs for Chisquared 

x = 0 : 0.15 : 20;
chi = chi2pdf(x,2);

const_H0 = 2/var_w;
const_H1 = 2/(var_w+var_s);
%% plotting histograms

% Histograms for H0
% figure(1)
% subplot(2,2,1)
% histogram(h0_vec, 40)
% %xlim([0 5])
% title('H_0')
% 
% subplot(2,2,2)
% histogram(h1_vec, 40)
% %xlim([0 5])
% title('H_1')
% 
% subplot(2,2,3)
% plot(const_H0*x, chi, 'r')
% title('Chisquare, \nu = 2')
% 
% subplot(2,2,4)
% plot(const_H1*x, chi, 'r')
% title('Chisquare, \nu = 2')


% figure 
% subplot(2,1,1)
% histogram(h0_vec, 40)
% hold on
% histogram(h1_vec, 40)
% xlim([0 18])
% legend('H0', 'H1')
% 
% subplot(2,1,2)
% plot(x, chi, 'r')
% title('Chisquare, \nu = 2')


figure
plot(const_H0*x, chi/const_H0, 'r')
hold on
plot(const_H1*x, chi/const_H1, 'b')
legend('H0', 'H1')
%% Testing alpha vs beta

% alpha = 0 : 000.1 : 1;
% gamma = gamma(1);
% 
% beta = alpha.^((var_w + var_s)/(var_w));
% 
% figure
% plot(alpha, beta)