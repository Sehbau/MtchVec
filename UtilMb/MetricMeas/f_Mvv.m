%
% Metric for vector-to-vector matching
%
function [S] = f_Mvv(Mes, Ndsc1, Ndsc2, typ)

S.Dnc    = f_MvvDis(Mes.DisSum, Ndsc1, Ndsc2, typ);
S.DncMen = f_MvvDis(Mes.DisMen, Ndsc1, Ndsc2, typ);

S.Sml    = f_MvvSim(Mes.Sim,    Ndsc1, Ndsc2, typ);

end

