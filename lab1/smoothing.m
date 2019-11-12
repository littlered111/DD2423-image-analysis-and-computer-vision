close all;clear all;clc;

office = office256;
add = gaussnoise(office, 16);
sap = sapnoise(office, 0.1, 255);
%% show original iamges 
figure();
subplot(1,2,1);
showgrey(add);
title('source image with gaussnoise');
subplot(1,2,2);
showgrey(sap);
title('source image with sapnoise');
%% Gaussian filter
t=[0.1,0.3,0.5,1.0,1.5,1.7,2.0,2.5,3.0];
figure();
for i=1:9
denoise_gauss_add=gaussfft(add,t(i));
subplot(3,3,i);
showgrey(denoise_gauss_add);
title(['Guassian filter + Gaussion noise t=' num2str(t(i))])
end

figure();
for i=1:9
denoise_gauss_sap=gaussfft(sap,t(i));
subplot(3,3,i);
showgrey(denoise_gauss_sap);
title(['Guassian filter + sapnoise t=' num2str(t(i))])
end

%% Median filter
height=[1.0,2.0,3.0,4.0,6.0,8.0,9.0,10.0,15.0];
figure();
for i=1:9
denoise_med_gauss=medfilt(add,height(i));
subplot(3,3,i);
showgrey(denoise_med_gauss);
title(['Median filter + gaussnoise height=' num2str(height(i))])
end

figure();
for i=1:9
denoise_med_sap=medfilt(sap,height(i));
subplot(3,3,i);
showgrey(denoise_med_sap);
title(['Median filter + sapnoise height=' num2str(height(i))])
end
%% ideal low-pass filter
cutoff=[0.1,0.125,0.15,0.175,0.2,0.25,0.3,0.4,0.5];
figure();
for i=1:9
denoise_ideal_gauss=ideal(add,cutoff(i));
subplot(3,3,i);
showgrey(denoise_ideal_gauss);
title(['ideal filter + gaussnoise height=' num2str(cutoff(i))])
end

figure();
for i=1:9
denoise_ideal_sap=ideal(sap,cutoff(i));
subplot(3,3,i);
showgrey(denoise_ideal_sap);
title(['ideal filter + sapnoise height=' num2str(cutoff(i))])
end

