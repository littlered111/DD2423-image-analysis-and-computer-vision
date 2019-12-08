close all; clear all;clc

testimage1 = triangle128;
smalltest1 = binsubsample(testimage1);

testimage2 = houghtest256;
smalltest2 = binsubsample(binsubsample(testimage2));

%set input parameters for function houghedgeline
img1=few256;
img2 = godthem256;
img3=phonecalc256;
thresh = 160;
scale = 20;

nrho = 256;
ntheta = 256;
 nlines = 15;
 verbose = 0;

[linepar, acc] = houghedgeline(img1, scale, thresh, nrho, ntheta, nlines, verbose);

% results and computational time vs the number of cells in the accumulator
time_1 = cputime;
no_rho = 100;
no_theta = 100;

[linepar, acc] = houghedgeline(img1, scale, thresh, no_rho, no_theta, nlines, verbose);
time_1

time_2 = cputime;
no_rho = 1200;
no_theta = 100;
[linepar, acc] = houghedgeline(img1, scale, thresh, no_rho, no_theta, nlines, verbose);
time_2

time_3 = cputime;
no_rho = 100;
no_theta = 1200;
[linepar, acc] = houghedgeline(img1, scale, thresh, no_rho, no_theta, nlines, verbose);
time_3