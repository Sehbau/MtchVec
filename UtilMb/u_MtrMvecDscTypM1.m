% 
% Descriptor metric measurements from mvec/vgVec for one metric type
% (dissim/simi) and one matching direction (12/21)
%
% IN  Sto       standard output from program mvec
%     nLev      # of expected levels
%     mtrTyp    dis/similarity  'Dis' | 'Sim'
%     mtcDir    '12' | '21'
%
% OUT Mes       struct with metric both ways
%
function [Mes] = u_MtrMvecDscTypM1(Sto, nLev, mtrTyp, mtcDir)

off         = length(mtrTyp);

ixSkl       = strfind(Sto, ['Skl' mtrTyp mtcDir]) + off + 6;
ixRsg       = strfind(Sto, ['Rsg' mtrTyp mtcDir]) + off + 6;
ixArcFll    = strfind(Sto, ['Arc' mtrTyp mtcDir]) + off + 6;
ixStrFll    = strfind(Sto, ['Str' mtrTyp mtcDir]) + off + 6;
ixArcGst    = strfind(Sto, ['ArcGst' mtrTyp mtcDir]) + off + 9;
ixStrGst    = strfind(Sto, ['StrGst' mtrTyp mtcDir]) + off + 9;

Mes.Skl     = sscanf(Sto(ixSkl:end), '%f', nLev);
Mes.Rsg     = sscanf(Sto(ixRsg:end), '%f', nLev);
Mes.ArcFll  = sscanf(Sto(ixArcFll:end), '%f', nLev);
Mes.StrFll  = sscanf(Sto(ixStrFll:end), '%f', nLev);
Mes.ArcGst  = sscanf(Sto(ixArcGst:end), '%f', nLev);
Mes.StrGst  = sscanf(Sto(ixStrGst:end), '%f', nLev);

if 0 % strcmp(mtrTyp,'Sim')==1
    
    %Mes.Skl     = uint16(Mes.Skl);
    %Mes.Rsg     = uint16(Mes.Rsg);
    %Mes.ArcFll  = uint16(Mes.ArcFll);
    %Mes.StrFll  = uint16(Mes.StrFll);
    %Mes.ArcGst  = uint16(Mes.ArcGst);
    %Mes.StrGst  = uint16(Mes.StrGst);
    
    Mes.ntSkl       = sum(Mes.Skl);
    Mes.ntRsg       = sum(Mes.Rsg);
    Mes.ntArcGst    = sum(Mes.ArcGst);
    Mes.ntStrGst    = sum(Mes.StrGst);
    Mes.ntArcFll    = sum(Mes.ArcFll);
    Mes.ntStrFll    = sum(Mes.StrFll);
    
    Mes.ntMtc       = Mes.ntSkl + Mes.ntRsg + ...
                      Mes.ntArcGst + Mes.ntStrGst + ...
                      Mes.ntArcFll + Mes.ntStrFll;
end

