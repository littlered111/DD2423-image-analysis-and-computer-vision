clear;clc;

img1= phonecalc128;
img2= few128;
img3= nallo128;
%% show source images
figure();
subplot(3,3,1);
showgrey(img1);
title('source pic phonecalc128');
subplot(3,3,2);
showgrey(img2);
title('source pic few128');
subplot(3,3,3);
showgrey(img3);
title('source pic nallo128');

%% show same phase and different magnitude
pixels1 = pow2image(img1, 1e-10);
pixels2 = pow2image(img2, 1e-10);
pixels3 = pow2image(img3, 1e-10);
subplot(3,3,4);
showgrey(pixels1);
title('pow2image pic phonecalc128');
subplot(3,3,5);
showgrey(pixels2);
title('pow2image pic few128');
subplot(3,3,6);
showgrey(pixels3);
title('pow2image pic nallo128');

%% show same magnitude and different phase
pixels1_r = randphaseimage(img1);
pixels2_r = randphaseimage(img2);
pixels3_r = randphaseimage(img3);
subplot(3,3,7);
showgrey(pixels1_r);
title('randphaseimage pic phonecalc128');
subplot(3,3,8);
showgrey(pixels2_r);
title('randphaseimage pic few128');
subplot(3,3,9);
showgrey(pixels3_r);
title('randphaseimage pic nallo128');
