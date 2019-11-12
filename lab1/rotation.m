close all;clear all;clc;

F = [zeros(60, 128); ones(8, 128); zeros(60, 128)] .* ...
[zeros(128, 48) ones(128, 32) zeros(128, 48)];
figure();
Fhat=fft2(F);
showfs(Fhat);
title('DFT of F');
figure();
subplot(1,3,1);
G = rot(F, 0);
showgrey(G);
title('rotate F by 0бу')
axis on;
subplot(1,3,2);
Ghat = fft2(G);
showfs(Ghat);
title('DFT of rotated G by 0бу');
subplot(1,3,3);
Hhat = rot(fftshift(Ghat), -0 );
showgrey(log(1 + abs(Hhat)));
title('DFT of rotated back G');
