close all;clear all; clc;

t=[0.1,0.3,1.0,10.0,100.0];
v={};
figure();
for i=1:5
subplot(2,3,i)
psf = gaussfft(deltafcn(128, 128), t(i));
%psf=discgaussfft(deltafcn(128, 128), t(i));
v{i}=variance(psf);
showgrey(psf1);
%surf(psf);
title(['t = ' num2str(t(i))]);
colormap default;
end

%Q16 Convolve images with Gaussian functions of different variances
t_im=[1.0,4.0,16.0,64.0,256.0];
img1=phonecalc128;
img2=few128;
img3=nallo128;

figure();
subplot(1,3,1);
showgrey(img1);
title('original images');
subplot(1,3,2);
showgrey(img2);
subplot(1,3,3);
showgrey(img3);

psf_im=gaussfft(deltafcn(128, 128), t_im(i));
for i=1:5
figure();
psf_im1=gaussfft(img1, t_im(i));
psf_im2=gaussfft(img2, t_im(i));
psf_im3=gaussfft(img3, t_im(i));

subplot(1,3,1);
showgrey(psf_im1);
title(['t = ' num2str(t_im(i))]);
subplot(1,3,2);
showgrey(psf_im2);
subplot(1,3,3);
showgrey(psf_im3);
end



