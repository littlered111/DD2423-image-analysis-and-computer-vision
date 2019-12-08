function pixels = lv(inpic, shape)
if (nargin < 2)
shape = 'same';
end
dxmask=fspecial('sobel');
dymask=dxmask';
Lx = filter2(dxmask, inpic, shape);
Ly = filter2(dymask, inpic, shape);
pixels = Lx.^2 + Ly.^2;
end

