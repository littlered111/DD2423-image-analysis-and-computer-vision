function [linepar, acc] = houghline(curves, magnitude, nrho, ntheta, threshold, nlines, verbose)

% Check if input appear to be valid
if nrho < 1
    error('nrho must exceed zero');
end

if ntheta < 1
    error('ntheta must exceed zero');
end

if nlines < 1
    error('nlines must exceed zero');
end

%allocate accumulator space 
acc = zeros(nrho, ntheta);

%Define a coordinate system in the accumulator space
theta_x = linspace(-pi/2, pi/2, ntheta);
D = sqrt(size(magnitude, 1).^2 + size(magnitude, 2).^2);
rhoy = linspace(-D, D, nrho);

%Loop over all the input curves - Amount of pixels lying on a curve
insize = size(curves, 2) ;
trypointer = 1; 

%Loop over all the input curves (cf. pixelplotcurves)
while trypointer < insize
    polylength = curves(2, trypointer); 
    trypointer = trypointer + 1;
    
    %Loop through the points on the edge curve
    for curveidx = 1:polylength 
        x = curves(2, trypointer);
        y = curves(1, trypointer);
        trypointer = trypointer + 1;
            
        %Look at tresh 
        mag_new = abs(magnitude(round(x), round(y)));
        if mag_new > threshold
           
            %Loop over a set of theta values
            for theta_index = 1:ntheta
                %compute parameters
                rho_val = x*cos(theta_x(theta_index)) + y*sin(theta_x(theta_index));
                
                %find corresponding index
                rho_index = find(rhoy < rho_val, 1, 'last');
                
                %update the accumulator matrix 
                acc(rho_index, theta_index) = acc(rho_index, theta_index) + 1;
                
                %following is for Q10
                %acc(rho_index, theta_index) = acc(rho_index, theta_index) + (mag_new).^2;
                %acc(rho_index, theta_index) = acc(rho_index, theta_index) + log(mag_new);
            end
        end
    end
end

%Extract local maxima from the accumulator
acctmp=acc;
[pos,value] = locmax8(acctmp);
[~,indexvector] = sort(value);
nmaxima = size(value, 1);

% Compute a line for each one of the strongest responses in the accumulator
linepar = zeros(2, nlines);
for index = 1:nlines
    rho_index_accumulator = pos(indexvector(nmaxima - index + 1), 1);
    theta_index_accumulator = pos(indexvector(nmaxima - index + 1), 2);
    rho = rhoy(rho_index_accumulator);
    theta = theta_x(theta_index_accumulator);
    linepar(:,index) = [rho; theta];
    
    x0 = 0;
    y0 = (rho - x0 * cos(theta))./sin(theta);
    dx = D.^2;
    dy = (rho - dx * cos(theta))./sin(theta);
    
    %Given in lab description - visualizing results
    outcurves(1, 4*(index-1) + 1) = 0;          
    outcurves(2, 4*(index-1) + 1) = 3;
    outcurves(2, 4*(index-1) + 2) = x0 - dx;
    outcurves(1, 4*(index-1) + 2) = y0 - dy;
    outcurves(2, 4*(index-1) + 3) = x0;
    outcurves(1, 4*(index-1) + 3) = y0;
    outcurves(2, 4*(index-1) + 4) = x0+dx;
    outcurves(1, 4*(index-1) + 4) = y0+dy;
end

%Return the output data
linepar = outcurves;
end