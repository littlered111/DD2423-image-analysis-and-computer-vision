close all;clear all;clc;
%% test p=5,q=9
% Fhat=zeros(128, 128);
% p=5;
% q=9;
% Fhat(p,q)= 1;

%% show the original image
%figure();
%showgrey(Fhat);
%title('original image');

%% look at its real and imaginary parts
u=5; v=1; %change different values
sz=128;
fftwave(u, v, sz)