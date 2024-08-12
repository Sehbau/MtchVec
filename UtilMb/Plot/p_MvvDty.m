%
% Plotting metric values for v2v matching.
%
function [] = p_MvvDty(M)

[nr nc] = deal(1,2);

aDtyS = {'c' 'r' 'a' 's'};
IxD   = 1:4;

subplot(nr,nc,1);
bar( M( IxD,1 ) );
title('distance');
set(gca,'xticklabel', aDtyS );

subplot(nr,nc,2);
bar( M( IxD,2 ) );
title('similarity');
set(gca,'xticklabel', aDtyS );

end

