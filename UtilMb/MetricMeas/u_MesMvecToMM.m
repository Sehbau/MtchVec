%
% Collects the 'total' measurements from mvecL and creates the distance and
% similarity matrix.
%
% IN   AMes   list of measurements {nImg 1}[nImg 4] (dis/sim/0/0)
%
function [MM] = u_MesMvecToMM( AMes, nImg, AOrd )

    MM.bAcc = 0;

if nargin==2

    %%  -----  regular case  -----
    % full matrix
    MM.DM = zeros(nImg, nImg, 'single');
    MM.SM = MM.DM;

    for i = 1:nImg
        Mes         = AMes{i};
        MM.DM(i,:)  = Mes(:,1);
        MM.SM(i,:)  = Mes(:,2);
    end

else
    
    %%  -----  accelerated case  -----
    % partial matrix
    nSel   = length( AOrd{1} );
    MM.DM  = zeros( nImg, nSel, 'single');
    MM.SM  = MM.DM;    
    MM.ORD = zeros( nImg, nSel, 'int32' );

    for i = 1:nImg
        Mes         = AMes{i};
        MM.DM(i,:)  = Mes(:,1);
        MM.SM(i,:)  = Mes(:,2);
        MM.ORD(i,:) = AOrd{i};      % preordered
    end    
    
    MM.bAcc = 1;
end

end

