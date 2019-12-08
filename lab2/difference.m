close all; clear all; clc;
%define differential operators
%simple difference operator
simple_x = [-1 0 1];
simple_y = simple_x';
%central differences operator
central_x = [-0.5 0 0.5];
central_y= central_x';
%Robert's diagonal operator 
roberts_x = [-1 0; 0 1];
roberts_y = [0 -1; 1 0];
%Sobel operator
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [1 2 1; 0 0 0; -1 -2 -1];

tools = few256;
%show the results
%simple
figure('name', 'Simple Difference Operator')
dxtools_simple = conv2(tools, simple_x, 'valid');
dytools_simple = conv2(tools, simple_y, 'valid');
subplot(1,2,1)
showgrey(dxtools_simple);
title('x direction');
subplot(1,2,2)
showgrey(dytools_simple);
title('y direction');


%central
figure('name', 'Central Difference Operator')
dxtools_central = conv2(tools, central_x, 'valid');
dytools_central = conv2(tools, central_y, 'valid');
subplot(1,2,1)
showgrey(dxtools_central);
title('x direction');
subplot(1,2,2)
showgrey(dytools_central);
title('y direction');

%robert
figure('name', 'Roberts Diagonal Operator')
dxtools_r = conv2(tools, roberts_x, 'valid');
dytools_r = conv2(tools, roberts_y, 'valid');
subplot(1,2,1)
showgrey(dxtools_r);
title('x direction');
subplot(1,2,2)
showgrey(dytools_r);
title('y direction');

%sobel
figure('name', 'Sobel Operator')
dxtools_so = conv2(tools, sobel_x, 'valid');
dytools_so= conv2(tools, sobel_y, 'valid');
subplot(1,2,1)
showgrey(dxtools_so);
title('x direction');
subplot(1,2,2)
showgrey(dytools_so);
title('y direction');
