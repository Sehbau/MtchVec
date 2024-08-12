%
% Collects the 'total' measurements from mvecL and creates the distance and
% similarity matrix.
%
% IN   AMes   list of measurements {nImg 1}[nImg 4] (dis/sim/0/0)
%
function [MM] = u_MesMhatToMM( AMes, nImg )

MM.HST.DM = zeros(nImg, nImg, 'single');
MM.KOL.DM = MM.HST.DM;

for i = 1:nImg
    Mes         = AMes{i};
    MM.HST.DM(i,:)  = Mes(:,1);
    MM.KOL.DM(i,:)  = Mes(:,2);
end

end

