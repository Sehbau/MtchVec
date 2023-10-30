% 
% Descriptor metrics measurements from mvec/vgVec
%
% IN  Sto   standard output from program mvec
%     nLev  # of expected levels
%     typ   dis/similarity  'Dis' | 'Sim'
%
% OUT Mes   struct with metric both ways
%
function [Mes] = u_MtrMvecDscTyp(Sto, nLev, mtrTyp)

Mes.M12 = u_MtrMvecDscTypM1(Sto, nLev, mtrTyp, '12');
Mes.M21 = u_MtrMvecDscTypM1(Sto, nLev, mtrTyp, '21');

end

