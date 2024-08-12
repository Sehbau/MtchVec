%
% Plotting metric values for v2v matching for one metric type
%
function [] = p_MvvDtySet(M, Arr, bImg, yLab)

nLev    = length(M.Skl);
[nr nc] = deal(Arr(1), Arr(2));
rb      = (Arr(3)-1) * nc;

subplot(nr, nc, rb+1); 
bar(M.Skl);
set(gca,'xlim', [0.5 nLev+0.5]);
ylabel(yLab);
title('Skl');

subplot(nr, nc, rb+2); 
bar(M.Rsg);
set(gca,'xlim', [0.5 nLev+0.5]);
title('Rsg');

subplot(nr, nc, rb+3); 
if bImg, bar(M.ArcGst);
else     bar(M.ArcFll);
end
set(gca,'xlim', [0.5 nLev+0.5]);
title('Arc');

subplot(nr, nc, rb+4); 
if bImg, bar(M.StrGst);
else     bar(M.StrFll);
end
set(gca,'xlim', [0.5 nLev+0.5]);
title('Str');



end

