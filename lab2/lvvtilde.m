function pixels = lvvtilde(inpic, shape)
%first order mask - use central operator
dxmask = [0 0 0 0 0;
          0 0 0 0 0;
          0 -1/2 0 1/2 0;
          0 0 0 0 0;
          0 0 0 0 0];

dymask = dxmask';

%second order mask - use simple operator
dxxmask = [0 0 0 0 0;
            0 0 0 0 0;
            0 1 -2 1 0;
            0 0 0 0 0;
            0 0 0 0 0];
dyymask = dxxmask';
dxymask = conv2(dxmask, dymask, shape);

Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lxx = filter2(dxxmask, inpic, shape);
Lxy = filter2(dxymask, inpic, shape);
Lyy = filter2(dyymask, inpic, shape);

pixels = Lx.^2.*Lxx + 2*Lx.*Lxy.*Ly + Ly.^2.*Lyy;
end

