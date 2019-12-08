function edgecurves = extractedge(inpic, scale, threshold, shape)

%first order
lv_ori = lv(discgaussfft(inpic, scale), shape);

%Second order
lvv = lvvtilde(discgaussfft(inpic, scale), shape);

%Third order
lvvv = lvvvtilde(discgaussfft(inpic, scale), shape);

lv_mask = (lv_ori > threshold) -0.5;
lvvv_mask = (lvvv < 0) - 0.5;

edgecurves = zerocrosscurves(lvv, lvvv_mask);
edgecurves = thresholdcurves(edgecurves, lv_mask);

end

