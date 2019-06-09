clear
load('T3_data_x_H0.mat')
load('T3_data_x_H1.mat')
load('T3_data_sigma_s.mat')
load('T3_data_sigma_w')

%% Estimating sigma_s and sigma_w by taking the mean

var_s = var(s_t);
var_w = var(w);

%% Our threshold lambda found theoretically in the book
K = 1;
lambda = 0:0.01:1000;
lambda_ = (var_w*(var_w+var_s)/var_s)*(log(lambda)-K*log(var_w/(var_s+var_w)));

%% Pfa and Pda, and ROC (THIS HAS TO BE DONE PRETTIER!!)
Pfa = 1 - gamcdf(lambda_, K, var_w);
Pd_Pfa = 1 - gamcdf(gaminv(1-Pfa, K, var_w),K, var_w+var_s);
figure(1)
plot(Pfa, Pd_Pfa,'b')
hold on
K=5;
lambda_ = (var_w*(var_w+var_s)/var_s)*(log(lambda)-K*log(var_w/(var_s+var_w)));
Pfa = 1 - gamcdf(lambda_, K, var_w);
Pd_Pfa = 1 - gamcdf(gaminv(1-Pfa, K, var_w),K, var_w+var_s);
plot(Pfa,Pd_Pfa,'c')
hold on
K=20;
lambda_ = (var_w*(var_w+var_s)/var_s)*(log(lambda)-K*log(var_w/(var_s+var_w)));
Pfa = 1 - gamcdf(lambda_, K, var_w);
Pd_Pfa = 1 - gamcdf(gaminv(1-Pfa, K, var_w),K, var_w+var_s);
plot(Pfa,Pd_Pfa,'m')
legend('K = 1','K = 10','K = 20')
title('ROC for various K')

%% Pd plotted as a function of K
k = 0:1:256;
PFA = 0.01;
Pd_k = 1 - gamcdf(gaminv(1-PFA, k, var_w),k, var_w+var_s);
figure(2)
plot(k, Pd_k,'b','Linewidth',1.5)
xlim([0 256])
title('P_D(K) for P_F_A = 0.1')
xlabel('K')


%% Testing function things

% function lambda__ = lambda_(K)
%     lambda__ = (var_w*(var_w+var_s)/var_s)*(log(lambda)-K*log(var_w/(var_s+var_w)));
% end
% 
% function PFA = Pfa(K)
%      PFA = 1 - gamcdf(lambda_(K), K, var_w);
% end
% 
% function PD_PFA = Pd_Pfa(K)
%      PD_PFA = 1 - gamcdf(gaminv(1-Pfa, K, var_w),K, var_w+var_s);
% end
