function output=gaussfft(pic,t)

x=size(pic,1);
y=size(pic,2);

[x1,y1] = meshgrid(-x / 2 : (x / 2) - 1, -y / 2 : (y / 2) - 1);
G = (1 / (2 * pi * t)) * exp(-(x1 .* x1 + y1 .* y1) / (2 * t));

Phat = fft2(pic);
Ghat = fft2(G);
convim= Phat.* Ghat;
invert=ifft2(convim);
output=fftshift(invert);
end