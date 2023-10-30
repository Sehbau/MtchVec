% 
% Obtains Ndsc involved in mvec, displayed in stdout
%
% IN    Sto    standard out of mvec
%       lst    list: '1' or '2'
%
function [Ndsc] = u_MtrMvecNdsc(Sto, Hed, lst)

ixSkl       = strfind(Sto, ['SklNdsc' lst]) + 9;
ixRsg       = strfind(Sto, ['RsgNdsc' lst] ) + 9;
ixArc       = strfind(Sto, ['ArcNdsc' lst] ) + 9;
ixStr       = strfind(Sto, ['StrNdsc' lst] ) + 9;
ixArcGst    = strfind(Sto, ['ArcGstNdsc' lst] ) + 12;
ixStrGst    = strfind(Sto, ['StrGstNdsc' lst] ) + 12;

nLev        = Hed.nLev;
Ndsc.Skl    = sscanf(Sto(ixSkl:end), '%d', nLev);
Ndsc.Rsg    = sscanf(Sto(ixRsg:end), '%d', nLev);
Ndsc.ArcFll = sscanf(Sto(ixArc:end), '%d', nLev);
Ndsc.StrFll = sscanf(Sto(ixStr:end), '%d', nLev);
Ndsc.ArcGst = sscanf(Sto(ixArcGst:end), '%d', nLev);
Ndsc.StrGst = sscanf(Sto(ixStrGst:end), '%d', nLev);

Ndsc.ntSkl      = sum(Ndsc.Skl);
Ndsc.ntRsg      = sum(Ndsc.Rsg);
Ndsc.ntArc      = sum(Ndsc.ArcFll);
Ndsc.ntStr      = sum(Ndsc.StrFll);
Ndsc.ntArcGst   = sum(Ndsc.ArcGst);
Ndsc.ntStrGst   = sum(Ndsc.StrGst);

Ndsc.ntDscI     = Ndsc.ntSkl + Ndsc.ntRsg + Ndsc.ntArcGst + Ndsc.ntStrGst;
Ndsc.ntDscF     = Ndsc.ntSkl + Ndsc.ntRsg + Ndsc.ntArc + Ndsc.ntStr;

end

