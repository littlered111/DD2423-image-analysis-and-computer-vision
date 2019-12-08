function  [linepar, acc] = houghedgeline(img, scale, gradmagnthresh, nrho, ntheta, nlines, verbose)
curves = extractedge(img, scale, gradmagnthresh, 'same');
magnitude = lv(img, 'same');

[linepar, acc] = houghline(curves, magnitude, nrho, ntheta, gradmagnthresh, nlines, verbose);                       

if verbose == 0
    figure();  
    subplot(1,2,1)
    overlaycurves(img, linepar);
    axis([1 size(img, 2) 1 size(img, 1)]);                        
    title('imput image')
    
    subplot(1,2,2)
    showgrey(binsepsmoothiter(acc, 0.5, 1))
    title('Hough transform (with smoothing)')
end

if verbose == 1
    figure
    subplot(1,2,1)
    overlaycurves(img, curves)
    title('image with curves')
    subplot(1,2,2)
    showgrey(magnitude)
    title('Magnitude')
end

if verbose == 2
    figure
    subplot(1,2,1)
    showgrey(acc)
    title('accumolator')
    subplot(1,2,2)
    showgrey(binsepsmoothiter(acc, 0.5, 1));
    title('accumolator with binseopsmoothiter')
end

if verbose == 3
    figure
    subplot(1,2,2)
    overlaycurves(img, linepar);
    axis([1 size(img, 2) 1 size(img, 1)]);                        
    title('input image')

    subplot(1,2,1)
    surf(binsepsmoothiter(acc, 0.5, 1))
    title('Hough transform with smoothing')
end

