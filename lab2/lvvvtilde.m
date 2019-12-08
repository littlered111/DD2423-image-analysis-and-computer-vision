function pixels = lvvvtilde(inpic, shape)
%first order -  use central operator
dxmask = [0 0 0 0 0;
          0 0 0 0 0;
          0 -1/2 0 1/2 0;
          0 0 0 0 0;
          0 0 0 0 0];

dymask = dxmask';

%second order -  use simple operator
dxxmask = [0 0 0 0 0;
            0 0 0 0 0;
            0 1 -2 1 0;
            0 0 0 0 0;
            0 0 0 0 0];
dyymask = dxxmask';
dxymask = conv2(dxmask, dymask, shape);

%third order-concenate
dxxxmask = conv2(dxmask, dxxmask, shape);
dxyymask = conv2(dxmask, dyymask, shape);
dxxymask = conv2(dxxmask, dymask, shape);
dyyymask = conv2(dymask, dyymask, shape);

Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
Lxxx = filter2(dxxxmask, inpic, shape);
Lxyy = filter2(dxyymask, inpic, shape);
Lxxy = filter2(dxxymask, inpic, shape);
Lyyy = filter2(dyyymask, inpic, shape);

pixels = Lx.^3.*Lxxx + 3.*Lx.^2.*Ly.*Lxxy + 3.*Lx.*Ly.^2.*Lxyy + Ly.^3.*Lyyy;
end

