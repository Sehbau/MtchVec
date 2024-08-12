% 
% Metric measurement values from mvec/vgVec as printed by:
%   - DispDmtcMesDty( MesTot.Dty );
%   - DispMesMtcImg( MesTot.tot ); 
%
% Follows u_MtrMesSecs.m (where the section were determined)
%
% cf mvec1.cpp
%
% IN    Sto     standard out in sections (u_MtrMesSecs.m)
%
% OUT   AMes    array [nDsc 2] (dissim/simi)
%       mesImg  struct with dissimilarity/similarity values
%
function [AMes mesImg] = u_MtrMesScnf( StoSec )


%% -----   DescTypes  -----
% -----  desctypes  -----
% dty  dis       sim
% skl  1.701431  0.027669
% rsg  6.547936  0.034358
% arc  2.031621  0.000000
% str  1.811071  0.009634
% shp  7.919334  0.014331
% eodty.
aDty = { 'skl' 'rsg' 'arc' 'str' 'shp' };
nDty = length(aDty);

AMes = zeros(nDty,2,'single'); % dis, sim
for d = 1:nDty
    
    dty     = aDty{d};
    ixD     = strfind( StoSec.Dty, dty );
    Mes     = sscanf( StoSec.Dty(ixD+5:end), '%f', 2 ); % dis, sim
    AMes(d,:) = Mes;
end
%mesImg.dis = mean( AMes(:,1) );
%mesImg.sim = mean( AMes(:,2) );

%% -----   Img    ------
% -----  img  -----
% dis 324.627686
% sim 0.000000
% eoimg.
Img         = StoSec.Img; %(Hed.ixImg:end);
ixDis       = strfind(Img,'dis');
ixSim       = strfind(Img,'sim');
mesImg.dis  = str2double( Img( ixDis+3 : ixSim-1) );
mesImg.sim  = str2double( Img( ixSim+3 : end-1) );

%% -----   Txt   -----
Txt         = StoSec.Txt;
ixDis       = strfind(Txt,'dis');
mesImg.txt  = str2double( Txt( ixDis+3 : end-1) );


end




