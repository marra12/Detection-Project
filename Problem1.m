clear
load('T1_data_Sk_Gaussian.mat')
load('T1_data_Sk_BPSK.mat')
%Help variables
N = 1024;
sumSGaussian = 0;
sumSBPSK = 0;
s_n_Gaussian = zeros(1024, 1);
s_n_BPSK = zeros(1, 1024);
%% Creating s(n) for BPSK and Gaussian
for n = 1:N
    for k = 1:N
        sumSGaussian = sumSGaussian+ T1_data_Sk_Gaussian(k).*exp((1i*2*pi*n*k)/N);
        sumSBPSK = sumSBPSK+ T1_data_Sk_BPSK(k).*exp((1i*2*pi*n*k)/N);
    end
    s_n_Gaussian(n) = (1/sqrt(N))*sumSGaussian;
    sumSGaussian = 0;
    s_n_BPSK(n) = (1/sqrt(N))*sumSBPSK;
    sumSBPSK = 0;
end

%% Real and imaginary parts of s(n)
s_nr_Gaussian  = real(s_n_Gaussian);
s_ni_Gaussian  = imag(s_n_Gaussian);
s_nr_BPSK = real(s_n_BPSK);
s_ni_BPSK = imag(s_n_BPSK);


%% Calculating expectation values and variances
%Gaussian
E_sn_Gaussian = mean(s_nr_Gaussian)+1i*mean(s_ni_Gaussian);
E_sn_BPSK = mean(s_nr_BPSK)+1i*mean(s_ni_BPSK);
E_snri_Gaussian = mean(s_nr_Gaussian.*s_ni_Gaussian);
E_snri_BPSK = mean(s_nr_BPSK.*s_ni_BPSK);
Var_snr_Gaussian = var(s_nr_Gaussian);
Var_sni_Gaussian = var(s_ni_Gaussian);
Var_snr_BPSK = var(s_nr_BPSK);
Var_sni_BPSK = var(s_ni_BPSK);

%% Plotting histograms
figure(1)
subplot(2,2,1)
hist(s_nr_Gaussian)
title('Gaussian: s(n)_R')

subplot(2,2,2)
hist(s_ni_Gaussian)
title('Gaussian: s(n)_I')

subplot(2,2,3)
hist(s_nr_BPSK)
title('BPSK: s(n)_R')

subplot(2,2,4)
hist(s_ni_BPSK)
title('BPSK: s(n)_I')