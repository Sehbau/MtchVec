% 
% Creates long-option string for program mvec.
%
% IN    O   option structure with fields set by user, u_OptMvecStc.m
% OUT   S   options as string 
%
function S = i_OptMvec(O)

S = '';

%% -----  Generell  -----
if O.tolMtc>-1, S = [S ' --tolMtc ' num2str(O.tolMtc)]; end
if O.wgtPos>-1, S = [S ' --wgtPos ' num2str(O.wgtPos)]; end
if O.wgtRGB>-1, S = [S ' --wgtRGB ' num2str(O.wgtRGB)]; end

%% -----  Per DescType  -----
if O.cntTolMtc>-1,  S = [S ' --cntTolMtc ' num2str(O.cntTolMtc)]; end
if O.rsgTolMtc>-1,  S = [S ' --rsgTolMtc ' num2str(O.rsgTolMtc)]; end
if O.arcTolMtc>-1,  S = [S ' --arcTolMtc ' num2str(O.arcTolMtc)]; end
if O.strTolMtc>-1,  S = [S ' --strTolMtc ' num2str(O.strTolMtc)]; end

end

