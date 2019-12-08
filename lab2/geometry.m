close all; clear all; clc;
%Lvv for image godthem256
house = godthem256;
scale = [0.0001, 1.0, 4.0, 16.0 , 64.0];
for i=1:length(scale)
subplot(2,3,i);
contour(lvvtilde(discgaussfft(house, scale(i) ), 'same'), [0 0])
axis('image')
axis('ij')
title(['scale = ' num2str(scale(i))])
end
%Lvvv for image few256
tools = few256;
for i=1:length(scale)
subplot(2,3,i);
showgrey(lvvvtilde(discgaussfft(tools, scale(i)), 'same') < 0);
axis('image')
axis('ij')
title(['scale = ' num2str(scale(i))])
end