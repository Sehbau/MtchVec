% 
% Vector-vector metric for similarities (match count) of one descriptor
% type.
%
% see f_MvvPyrDis for distance
% 
function [S] = f_MvvPyrSim(Sim1, Sim2, Ndsc1, Ndsc2)

nLev    = length(Sim1);

NdscBoth = Ndsc1 + Ndsc2;
bLev1emp = NdscBoth(1)==0;

if nLev==1                  % ^^^^^  1 level  ^^^^^
    
    if bLev1emp
        S.sim1 = 0;
        S.sim2 = 0;
        S.men  = 0;
    else
        S.sim1 = Sim1(1);% / Ndsc2(1); assert(S.sim1<=1);
        S.sim2 = Sim2(1);% / Ndsc1(1); assert(S.sim2<=1);
        S.men  = ( S.sim1 + S.sim2 ) / 2.0;
    end
    
else                        % ^^^^^  >2 levels  ^^^^^
    
    % -----   1st level   ------
    if bLev1emp,            % if no descriptors present
        s1 = 1;             % set to one to make multiplicative
        s2 = 1;             % measure succesful
    else
        s1 = Sim1(1);% / Ndsc2(1); %assert(s1<=1);
        s2 = Sim2(1);% / Ndsc1(1); %assert(s2<=1);
    end
    
    % -----   remaining levels   ------
    for l = 2:nLev
        if NdscBoth(l)==0,  % skip if no descriptors present
            continue;
        end
        s1 = s1 + Sim1(l);% / Ndsc2(l) );
        s2 = s2 + Sim2(l);% / Ndsc1(l) );
    end
    
    S.men  = (s1+s2) / 2.0;
    S.sim1 = s1;
    S.sim2 = s2;
    
end
    
end

