close all; clear all; clc;

%thresholds = [20, 35, 60, 80, 100, 120,135,160,185];
thresholds=100;
scale=[0.0001, 1.0, 4.0, 16.0 , 64.0];
%scale=4;
house=godthem256;
shape='same';
figure();
for i = 1 : length(scale)
    subplot(2,3,i)  
    extractededge = extractedge(house, scale(i), thresholds, shape);
    overlaycurves(house, extractededge)
    title(['Lvvv thresholds =' num2str(thresholds) ', scale ' num2str(scale(i))]) 
end

tools=few256;
figure();
for i = 1 : length(scale)
    subplot(2,3,i)  
    extractededge = extractedge(tools, scale(i), thresholds, shape);
    overlaycurves(tools, extractededge)
    title(['Lvvv thresholds =' num2str(thresholds) ', scale ' num2str(scale(i))]) 
end