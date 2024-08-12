%
% Plotting metric values for v2v matching.
%
% Explicit version, with Ndsc.
%
function [] = p_MvvDtyVx(M, Ndsc, bImg)

[nr nc] = deal(4,5);

p_MvvDtySet(M.Dnc.M12,    [nr nc 1], bImg, 'Mult');
p_MvvDtySet(M.DncMen.M12, [nr nc 2], bImg, 'Mean');
p_MvvDtySet(M.Sml.M12,    [nr nc 3], bImg, 'Simi');
p_MvvDtySet(Ndsc,         [nr nc 4], bImg, 'Ndsc');

aDtyS = {'c' 'r' 'a' 's'};

subplot(nr,nc,5);
bar(M.Dnc.Mdty);
set(gca,'xticklabel', aDtyS );

subplot(nr,nc,10);
bar(M.DncMen.Mdty);
set(gca,'xticklabel', aDtyS );

subplot(nr,nc,15);
bar(M.Sml.Mdty);
set(gca,'xticklabel', aDtyS );

end

