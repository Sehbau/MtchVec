%
% Loads matching results as saved with s_MesMtchLst in
% MACHLEARN/Metric/Metric.h
%
% Loads 4 columns: 
%   - Col 1     distances
%   - Col 2     similarities
%   - Col 3-4   unused
%
function [Mes]= LoadMtchMes( lfn, nImg ) 

fileID   = fopen(lfn, 'r');

if fileID<0, error('Could not open file %s', lfn); end

%% -----  [nImg 4]  -----
Mes = zeros(nImg, 4, 'single');
for i = 1:nImg
    Mes(i,:) = fscanf(fileID, '%f', 4); % dist/simi/notused/notused
    %fprintf('\n');
end
fclose(fileID);

end


