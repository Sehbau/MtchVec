% 
% Metric measurements from mvec/vgVec
%
% fka u_ResFromVec (glaube ich)
%
% IN    Sto   standard out, see example below
%
% OUT   Mes   struct with dissimilarity/similarity values
%
function [Mes mesImg] = u_MtrMvec(Sto, Hed)


%% -----   DescType   -----
Mes.DisSum  = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'DisSum');
Mes.DisMen  = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'DisMen');
Mes.SimPrp  = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'SimPrp');
Mes.SimHit  = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'SimHit');

%% -----   Ndsc   -----
% unfinished:
bInteger = 1;
%Mes.Ndsc1   = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'Ndsc1', bInteger);

%% -----   Img    ------
Img         = Sto.Img; %(Hed.ixImg:end);
ixDis       = strfind(Img,'dis');
ixSim       = strfind(Img,'sim');
%ix12        = strfind(Img,'disV12');
%ix21        = strfind(Img,'disV21');

mesImg.dis  = str2double( Img(ixDis+3:ixSim-1) );
mesImg.sim  = str2double( Img(ixSim+3:end-1) );
%disImg.V12  = str2double(Img(ix12+7:ix21-1));
%disImg.V21  = str2double(Img(ix21+7:end-1));
%disImg.comb = disImg.V12 + disImg.V21;
%disImg.Vec  = str2double(Sto(ixV+7:ixH-1));
%disImg.Hst  = str2double(Sto(ixH+7:ixEnd-1));

%% -----   ShapeWise   -----
jShw       = Sto.ShpWis;
ix12dis    = strfind( jShw, 'DisMen 12');
ix12sim    = strfind( jShw, 'SimPrpDet 12');
Shw.Dis12  = sscanf(  jShw(ix12dis +9:end), '%f', Hed.nLev);
Shw.Sim12  = sscanf(  jShw(ix12sim+12:end), '%f', Hed.nLev);

ix21dis    = strfind( jShw, 'DisMen 21');
ix21sim    = strfind( jShw, 'SimPrpDet 21');
Shw.Dis21  = sscanf(  jShw(ix21dis +9:end), '%f', Hed.nLev);
Shw.Sim21  = sscanf(  jShw(ix21sim+12:end), '%f', Hed.nLev);
Mes.Shw    = Shw;

if any(Shw.Dis12<0)
    Sto.ShpWis
end
%sscanf( Shw(ix12

end


% 
% -----  MatchResults  -----
% nLevRes 5 1 0
% -----  12  -----
% DistSum:
% SklDis12 10.208 20.289 28.178 32.065 18.597 
% RsgDis12 53.061 30.147 22.140 11.363 3.490 
% ArcGstDis12 38.851 56.571 43.439 21.126 7.195 
% StrGstDis12 15.021 32.040 28.880 14.215 5.020 
% ArcDis12 0.000 0.000 0.000 0.000 0.000 
% StrDis12 0.000 0.000 0.000 0.000 0.000 
% ShpDis12 80.200 88.127 74.359 23.745 6.534 
% DistMean:
% SklDisMen12 0.129 0.134 0.122 0.105 0.186 
% RsgDisMen12 0.089 0.118 0.160 0.210 0.268 
% ArcGstDisMen12 0.165 0.150 0.163 0.182 0.212 
% StrGstDisMen12 0.129 0.128 0.120 0.109 0.139 
% ArcDisMen12 0.000 0.000 0.000 0.000 0.000 
% StrDisMen12 0.000 0.000 0.000 0.000 0.000 
% Simi:
% SklSim12 0.620 0.821 0.931 0.954 0.840 
% RsgSim12 0.896 0.934 0.920 0.852 0.769 
% ArcGstSim12 0.331 0.838 0.929 0.966 0.971 
% StrGstSim12 0.629 0.873 0.967 0.969 0.944 
% ArcSim12 0.000 0.000 0.000 0.000 0.000 
% StrSim12 0.000 0.000 0.000 0.000 0.000 
% ShpSim12 0.128 0.198 0.255 0.250 0.333 
% -----  21  -----
% DistSum:
% SklDis21 3.490 9.065 11.161 11.623 7.093 
% RsgDis21 60.660 36.060 15.302 7.891 4.883 
% ArcGstDis21 31.483 36.754 30.039 24.936 7.827 
% StrGstDis21 13.591 17.430 15.796 13.309 6.800 
% ArcDis21 0.000 0.000 0.000 0.000 0.000 
% StrDis21 0.000 0.000 0.000 0.000 0.000 
% ShpDis21 87.314 49.241 28.320 32.692 13.353 
% DistMean:
% SklDisMen21 0.087 0.096 0.089 0.067 0.113 
% RsgDisMen21 0.095 0.126 0.155 0.208 0.287 
% ArcGstDisMen21 0.157 0.138 0.147 0.183 0.217 
% StrGstDisMen21 0.118 0.111 0.105 0.113 0.158 
% ArcDisMen21 0.000 0.000 0.000 0.000 0.000 
% StrDisMen21 0.000 0.000 0.000 0.000 0.000 
% Simi:
% SklSim21 0.875 0.957 0.968 0.994 0.984 
% RsgSim21 0.861 0.909 0.889 0.816 0.706 
% ArcGstSim21 0.363 0.895 0.980 0.978 0.972 
% StrGstSim21 0.687 0.936 0.960 0.966 0.930 
% ArcSim21 0.000 0.000 0.000 0.000 0.000 
% StrSim21 0.000 0.000 0.000 0.000 0.000 
% ShpSim21 0.160 0.435 0.310 0.267 0.167 
% -----  Ndsc  -----
% Ndsc1:
% SklNdsc1   79  151  231  306  100 
% RsgNdsc1  594  256  138   54   13 
% ArcGstNdsc1  236  376  267  116   34 
% StrGstNdsc1  116  251  241  131   36 
% ArcNdsc1    0    0    0    0    0 
% StrNdsc1    0    0    0    0    0 
% ShpNdsc1  109  111   55   12    3 
% Ndsc2:
% SklNdsc2   40   94  125  173   63 
% RsgNdsc2  640  287   99   38   17 
% ArcGstNdsc2  201  267  204  136   36 
% StrGstNdsc2  115  157  151  118   43 
% ArcNdsc2    0    0    0    0    0 
% StrNdsc2    0    0    0    0    0 
% ShpNdsc2  119   62   29   15    6 
% -----  img  -----
% disV12 209118320.000
% disV21 46439316.000
% EndOfProgram.