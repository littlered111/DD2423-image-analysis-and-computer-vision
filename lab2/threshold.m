close all; clear all; clc;
%here use Sobel operator
deltax = [-1 0 1; -2 0 2; -1 0 1];
deltay = [1 2 1; 0 0 0; -1 -2 -1];


tools = few256;
dxtools = conv2(tools, deltax, 'valid');
dytools = conv2(tools, deltay, 'valid');
%Compute histogram of the image
figure();
histogram(tools);
title('histogram of image few256');
thresholds = [20, 35, 60, 80, 100, 120,135,160,185];
gradmagntools = sqrt(dxtools .^2 + dytools .^2);
%show different differential magenitude
figure()
for t = 1 : length(thresholds)
    subplot(3,3,t)
    showgrey((gradmagntools - thresholds(t)) > 0)
    title(['threshold =' num2str(thresholds(t)) ])
end

%Compute godthem256 
house=godthem256;
pixels = lv(house, 'valid');
figure();
histogram(house);
title('histogram of image godthem256');

thresholds_house=[20, 60, 100, 125,145,170,185,220,240];
figure();
for t = 1 : length(thresholds_house)
    subplot(3,3,t)
    showgrey((pixels - thresholds_house(t)) > 0)
    title(['threshold =' num2str(thresholds_house(t)) ])
end

%smoothing prior to computing the gradient magnitude
house_smooth_1=discgaussfft(house, 5);
pixels_smooth_1 = lv(house_smooth_1, 'valid');
figure();
for t = 1 : length(thresholds_house)
    subplot(3,3,t)
    showgrey((pixels_smooth_1 - thresholds_house(t)) > 0)
    title(['threshold =' num2str(thresholds_house(t)) ])
end

house_smooth_2=discgaussfft(house, 1);
pixels_smooth_2 = lv(house_smooth_2, 'valid');
figure();
for t = 1 : length(thresholds_house)
    subplot(3,3,t)
    showgrey((pixels_smooth_2 - thresholds_house(t)) > 0)
    title(['threshold =' num2str(thresholds_house(t)) ])
end
