% 
% The option structure for vector matching program mvec. 
%
% Default is that NO options will be modified and no string will be created
% in i_OptMvec.
%
% IN    - 
% OUT   O   struct with options
%
% NEXT  i_OptMvec
%
function O = u_OptMvecStc()

%% -----  Generell  -----
O.tolMtc    = -1; 

O.wgtPos    = -1;
O.wgtRGB    = -1;

%% -----  Per DescType  -----
O.cntTolMtc   = -1;
O.rsgTolMtc   = -1;
O.arcTolMtc   = -1;
O.strTolMtc   = -1;

end

