clear all;close all;clc;

%% test retangular
F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';
H = F + 2 * G;
subplot(1,3,1);
showgrey(F);
title('original F');
subplot(1,3,2);
showgrey(G);
title('original G');
subplot(1,3,3);
showgrey(H);
title('original H');

%% show Fourier transform
Fhat = fft2(F);
Ghat = fft2(G);
Hhat = fft2(H);

%with log function
subplot(2,2,1);
showgrey(log(1 + abs(Fhat)));
title('DFT of F');
subplot(2,2,2);
showgrey(log(1 + abs(Ghat)));
title('DFT of G');
subplot(2,2,3);
showgrey(log(1 + abs(Hhat)));
title('DFT of H');
subplot(2,2,4);
showgrey(log(1 + abs(fftshift(Hhat))));
title('shifted DFT of H ');

%histogram without log function
subplot(2,2,1);
hist(1+abs(Fhat),256);
title('histogram of F without log');
subplot(2,2,2);
hist(1 + abs(Ghat),256);
title('histogram of G without log');
subplot(2,2,3);
hist(1 + abs(Hhat),256);
title('histogram of H without log');
subplot(2,2,4);
hist(1 + abs(fftshift(Hhat)),256);
title('histogram of shifted H without log ');

%histogram with log function
subplot(2,2,1);
hist(log(1+abs(Fhat)),256);
title('histogram of F with log');
subplot(2,2,2);
hist(log(1 + abs(Ghat)),256);
title('histogram of G with log');
subplot(2,2,3);
hist(log(1 + abs(Hhat)),256);
title('histogram of H with log');
subplot(2,2,4);
hist(log(1 + abs(fftshift(Hhat))),256);
title('histogram of shifted H with log ');

%without log function
subplot(2,2,1);
showgrey(1 + abs(Fhat));
title('DFT of F');
subplot(2,2,2);
showgrey(1 + abs(Ghat));
title('DFT of G');
subplot(2,2,3);
showgrey(1 + abs(Hhat));
title('DFT of H');
subplot(2,2,4);
showgrey(1 + abs(fftshift(Hhat)));
title('shifted DFT of H ');