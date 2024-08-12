%
% Concatenate metrics of descriptor types to one array
%
function [A] = u_MvvCatMtrDty(M, typ)

if strcmp(typ,'img')
    A = [M.skl.men  M.rsg.men  M.arcg.men  M.strg.men];
elseif strcmp(typ,'foc')
    A = [M.skl.men  M.rsg.men  M.arc.men  M.str.men];
end

end

