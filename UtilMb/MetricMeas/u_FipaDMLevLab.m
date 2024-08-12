% 
% Creates DM file path for ONE level and ONE label.
%
% cf DMINST.m
% From u_FinasLevLab
%
function fipa = u_FipaDMLevLab(pth, lev, lab)

fipa  = [pth 'DM'  num2str(lev) '/Lab' num2str(lab)];

end

