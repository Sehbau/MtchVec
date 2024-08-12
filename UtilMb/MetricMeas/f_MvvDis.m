%
% Distance metric for vector-to-vector matching
% 
% see also f_MvvSim.m
%
function [D] = f_MvvDis(D, N1, N2, typ)

if strcmp(typ,'img') % using Geruest (selection of arcs/strs)

    D.skl   = f_MvvPyrDis(D.M12.Skl, D.M21.Skl, N1.Skl, N2.Skl);
    D.rsg   = f_MvvPyrDis(D.M12.Rsg, D.M21.Rsg, N1.Rsg, N2.Rsg);
    D.arcg  = f_MvvPyrDis(D.M12.ArcGst, D.M21.ArcGst, N1.ArcGst, N2.ArcGst);
    D.strg  = f_MvvPyrDis(D.M12.StrGst, D.M21.StrGst, N1.StrGst, N2.StrGst);

    D.Mdty  = [D.skl.men D.rsg.men D.arcg.men D.strg.men];
    
elseif strcmp(typ,'foc') % using full set of arcs/strs

    D.skl   = f_MvvPyrDis(D.M12.Skl, D.M21.Skl, N1.Skl, N2.Skl);
    D.rsg   = f_MvvPyrDis(D.M12.Rsg, D.M21.Rsg, N1.Rsg, N2.Rsg);
    D.arc   = f_MvvPyrDis(D.M12.ArcFll, D.M21.ArcFll, N1.ArcFll, N2.ArcFll);
    D.str   = f_MvvPyrDis(D.M12.StrFll, D.M21.StrFll, N1.StrFll, N2.StrFll);

    D.Mdty  = [D.skl.men D.rsg.men D.arc.men D.str.men];
    
else
    error('not defined');
end

%% ----  Product:
% replace NaN with ones to make product work
Bnan    = isnan(D.Mdty);
Anan1   = D.Mdty;
Anan1(Bnan) = 1;
D.mul	= prod(Anan1);

%% ----  Mean:
D.men	= nanmean(D.Mdty);

%% ----  Assert no NaN present:
assert( isnan(D.mul)==0 );
assert( isnan(D.men)==0 );


end

