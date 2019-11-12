close all;clear all;clc;

img = phonecalc256;
smoothimg = img;
smoothimg_low= img;
N=5;
for i=1:N
if i>1 % generate subsampled versions
img = rawsubsample(img);
smoothimg = gaussfft(smoothimg,1.8);% <call_your_filter_here>(smoothimg, <params>);
smoothimg = rawsubsample(smoothimg);
smoothimg_low = ideal(smoothimg_low,0.2);% <call_your_filter_here>(smoothimg, <params>);
smoothimg_low = rawsubsample(smoothimg_low);
end

if i==1
subplot(3, N, i);
showgrey(img);
title('subsampled original image')
subplot(3, N, i+N);
showgrey(smoothimg);
title('subsampled image with Gauss filter')
subplot(3, N, i+2*N);
showgrey(smoothimg_low);
title('subsampled image with Ideal low-pass filter')
else
subplot(3, N, i);
showgrey(img);

subplot(3, N, i+N);
showgrey(smoothimg);

subplot(3, N, i+2*N);
showgrey(smoothimg_low);
end
    
end