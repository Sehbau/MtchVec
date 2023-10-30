% 
% Vector-vector metric for distances of one descriptor type.
%
% See f_MvvPyrSim for similarities (match count)
% 
function [D] = f_MvvPyrDis(Dis1, Dis2, Ndsc1, Ndsc2)

nLev    = length(Dis1);

NdscBoth = Ndsc1 + Ndsc2;
bLev1emp = NdscBoth(1)==0;

if nLev==1                  % ^^^^^  1 level  ^^^^^
    
    if bLev1emp
        D.dis1 = NaN;
        D.dis2 = NaN;
        D.men  = NaN;
    else
        D.dis1 = Dis1(1);
        D.dis2 = Dis2(1);
        D.men  = ( Dis1(1) + Dis2(1) ) / 2;
    end
    
else                        % ^^^^^  >2 levels  ^^^^^
    
    % -----   1st level   ------
    if bLev1emp,            % if no descriptors present
        s1 = 1;             % set to one to make multiplicative
        s2 = 1;             % measure succesful
    else
        s1 = Dis1(1);
        s2 = Dis2(1);
    end
    
    % -----   remaining levels   ------
    for l = 2:nLev
        if NdscBoth(l)==0,  % skip if no descriptors present
            continue;
        end
        s1 = s1 * Dis1(l);
        s2 = s2 * Dis2(l);
    end
    
    D.men  = (s1+s2)/2;
    D.dis1 = s1;
    D.dis2 = s2;
    
end
    
end

