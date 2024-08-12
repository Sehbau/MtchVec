%
% Collects the measurements from mvecL for each desctype and creates the
% corresponding distance and similarity matrices.
%
function [SMM] = u_MesMvecDtyToMM( ADIS, ASIM, neImg, aDty, AOrd )

nImg        = length(ADIS);
assert(nImg==neImg);
[nImg nDtyAll] = size(ADIS{1});
nDty        = length( aDty );       % selected

fprintf('nDty %d\n', nDty);

for d = 1:nDty
    
    AMesDty = cell(nImg, 1);
    for i = 1:nImg
        MesDis      = ADIS{i};
        MesSim      = ASIM{i};
        AMesDty{i}  = [ MesDis(:,d) MesSim(:,d) ];
    end
    
    dl      = aDty{d};
    
    if nargin==4
        SMM.(dl) = u_MesMvecToMM( AMesDty, nImg );
    else
        SMM.(dl) = u_MesMvecToMM( AMesDty, nImg, AOrd );
    end

end


end

