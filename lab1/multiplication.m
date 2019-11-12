clear all;close all;clc;

F = [ zeros(56, 128); ones(16, 128); zeros(56, 128)];
G = F';
%% multiply then apply DFT
figure();
subplot(1,2,1);
showgrey(F .* G);
title('F .* G');
subplot(1,2,2);
showfs(fft2(F .* G));
title('DFT of F .* G ');
%% convolution
convim= conv2(fftshift(Fhat), fftshift(Ghat), 'same') / (sz^2);
convim_shift = fftshift(convim);
subplot(1,2,1);
showgrey(F .* G);
title('F .* G');
subplot(1,2,2);
showfs(convim_shift);
%showfs(fft2(F .* G));
title('DFT of F .* G (convolution)');