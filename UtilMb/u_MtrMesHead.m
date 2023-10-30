% 
% Checks head and trailer of metric measurements from mvec/vgVec
%
% IN    Sto   standard out
%
% OUT   H     struct with info
%
function [Sec H] = u_MtrMesHead(Sto)

%% -----  Detect Results Section  -----
ixRes   = strfind(Sto, '-----  MatchResults  -----');
if isempty(ixRes), 
    error('cannot find result section '); 
end
Sto     = Sto(ixRes:end);     % eliminate section header

%% -----   nLev   -----
H.ixLev   = strfind(Sto, 'nLevRes')+8;
Hed     = sscanf(Sto(H.ixLev:end), '%d', 3);
nLev    = Hed(1); % str2double(Sto(ixLev:ixLev+1));
assert(nLev>0 && nLev<=7, 'nLev %d', nLev);

H.nLev  = nLev;
H.bImg  = Hed(2);
H.bFoc  = Hed(3);

%%  
ix12    = strfind(Sto,'-----  12  -----');
if isempty(ixRes), 
    Sto
    error('cannot find 12 section '); 
end
ix21    = strfind(Sto,'-----  21  -----');
if isempty(ixRes), 
    Sto
    error('cannot find 21 section '); 
end
ixNdsc  = strfind(Sto,'-----  Ndsc  -----');
if isempty(ixNdsc), 
    Sto
    error('cannot find Ndsc section '); 
end
Sec.Mtr  = Sto(ix12:ixNdsc-1);
%Sec.V21  = Sto(ix21:ixNdsc-1);
Sec.Ndsc = Sto(ixNdsc:end);

ixImg12     = strfind(Sto,'disV12');
ixImg21     = strfind(Sto,'disV21');
if isempty(ixImg12) || isempty(ixImg21)
    Sto
    error('cannot find image results');
end
Sec.Img = Sto(ixImg12:end);

%% -----  Detect End  -----
H.ixEnd   = strfind(Sto, 'EndOfProgram');
if isempty(H.ixEnd), 
    error('cannot find EndOfProgram'); 
end


end

