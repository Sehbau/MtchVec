%
% Similarity metric for vector-to-vector matching
% see also f_MvvDis.m
%
function [S] = f_MvvSim(S, N1, N2, typ)

if strcmp(typ,'img') % using Geruest (selection of arcs/strs)

    S.skl   = f_MvvPyrSim(S.M12.Skl,    S.M21.Skl,    N1.Skl, N2.Skl);
    S.rsg   = f_MvvPyrSim(S.M12.Rsg,    S.M21.Rsg,    N1.Rsg, N2.Rsg);
    S.arcg  = f_MvvPyrSim(S.M12.ArcGst, S.M21.ArcGst, N1.ArcGst, N2.ArcGst);
    S.strg  = f_MvvPyrSim(S.M12.StrGst, S.M21.StrGst, N1.StrGst, N2.StrGst);

    S.Mdty  = [S.skl.men S.rsg.men S.arcg.men S.strg.men];

elseif strcmp(typ,'foc') % using full set of arcs/strs

    S.skl   = f_MvvPyrSim(S.M12.Skl,    S.M21.Skl,    N1.Skl, N2.Skl);
    S.rsg   = f_MvvPyrSim(S.M12.Rsg,    S.M21.Rsg,    N1.Rsg, N2.Rsg);
    S.arc   = f_MvvPyrSim(S.M12.ArcFll, S.M21.ArcFll, N1.ArcFll, N2.ArcFll);
    S.str   = f_MvvPyrSim(S.M12.StrFll, S.M21.StrFll, N1.StrFll, N2.StrFll);

    S.Mdty  = [S.skl.men S.rsg.men S.arc.men S.str.men];
    
else
    error('not defined');
end

S.sum   = nansum(S.Mdty);
S.mul	= prod(S.Mdty);
S.men	= nanmean(S.Mdty);

assert( all(isnan(S.Mdty)==0) );

end

