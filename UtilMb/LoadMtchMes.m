%
% Loads matching results.
%
% Loads 4 columns: 
%   - Col 1     distances
%   - Col 2     similarities
%   - Col 3-4   unused
%
function [Mes]= LoadMtchMes(lfn, nImg) 

fileID   = fopen(lfn, 'r');
    
%% -----  [nImg 4]  -----
Mes = zeros(nImg, 4, 'single');
for l = 1:nImg
    Mes(l,:) = fscanf(fileID, '%f', 4);
    %fprintf('\n');
end
fclose(fileID);

end


