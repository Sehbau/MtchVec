% 
% Metric measurements from mvec/vgVec
%
% IN    Sto   standard out
%
% OUT   Mes   struct with dissimilarity/similarity values
%
function [Mes disImg] = u_MtrMvec(Sto, Hed)


%% -----   DescType   -----
Mes.Dis     = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'Dis');
Mes.DisMen  = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'DisMen');
Mes.Sim     = u_MtrMvecDscTyp(Sto.Mtr, Hed.nLev, 'Sim');

%% -----   Img    ------
Img         = Sto.Img; %(Hed.ixImg:end);
ix12        = strfind(Img,'disV12');
ix21        = strfind(Img,'disV21');
ixEOP       = strfind(Img,'EndOfProgram');
if isempty(ixEOP)
    error('cannot find EOP');
end

disImg.V12  = str2double(Img(ix12+7:ix21-1));
disImg.V21  = str2double(Img(ix21+7:ixEOP-1));
%disImg.Vec  = str2double(Sto(ixV+7:ixH-1));
%disImg.Hst  = str2double(Sto(ixH+7:ixEnd-1));

end

