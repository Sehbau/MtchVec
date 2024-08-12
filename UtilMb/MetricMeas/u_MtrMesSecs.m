% 
% Determines the measurement sections from mvec/vgVec as printed by...
%   - DispDmtcMesDty( MesTot.Dty );
%   - DispMesMtcImg( MesTot.tot );
% ...and returns them as struct Sec to be passed to u_MtrMesScnf.m
%
% More details in u_MtrMesScnf.m, where actual values are read.
%
% IN    Sto   standard out (full, unselected)
%
% OUT   Sec   sections, to be passed to  u_MtrMesScnf.m
%       H     utility info
%
function [Sec H] = u_MtrMesSecs( Sto )

%% -----   Detect Results Section  -----
ixRes   = strfind(Sto, '-----  MatchResults  -----');
if isempty(ixRes), 
    Sto
    error('cannot find result section '); 
end
Sto     = Sto(ixRes:end);     % eliminate section header

%% -----   nLev   -----
H.ixLev     = strfind(Sto, 'nLevRes')+8;
Hed         = sscanf(Sto(H.ixLev:end), '%d', 3); % reads three values
nLev        = Hed(1); % str2double(Sto(ixLev:ixLev+1));
assert(nLev>0 && nLev<=7, 'nLev %d', nLev);

H.nLev      = nLev;
H.bImg      = Hed(2);
H.bFoc      = Hed(3);

%% -----   desctypes   -----
ixDty       = strfind(Sto, '-----  desctypes  -----');
ixEodty     = strfind(Sto, 'eodty');
if isempty(ixDty) || isempty(ixEodty) 
    Sto
    error('cannot find desctypes or end of it');
end
Sec.Dty = Sto(ixDty:ixEodty);

%% -----   image   -----
ixImg       = strfind(Sto, '-----  img  -----');
%ixImg12     = strfind(Sto,'disV12');
%ixImg21     = strfind(Sto,'disV21');
ixEoim      = strfind(Sto, 'eoimg');
if isempty(ixImg) || isempty(ixEoim) % isempty(ixImg12) || isempty(ixImg21) || 
    Sto
    error('cannot find image total or end of it');
end
Sec.Img = Sto(ixImg:ixEoim);

%% -----   texture   -----
ixTxt       = strfind(Sto, '-----  txt  -----');
ixEotx      = strfind(Sto, 'eotxt');
if isempty(ixImg) || isempty(ixEoim) % isempty(ixImg12) || isempty(ixImg21) || 
    %Sto
    %    error('cannot find image total or end of it');
else
    Sec.Txt = Sto( ixTxt:ixEotx );
end

%% -----  Detect End  -----
H.ixEnd   = strfind(Sto, 'EndOfProgram');
if isempty(H.ixEnd), 
    error('cannot find EndOfProgram'); 
end


end

