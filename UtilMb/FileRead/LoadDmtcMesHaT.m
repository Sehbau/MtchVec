%
% Loads matching results as saved with s_DmtcMesHaT in
% DmtcMes.h
%
% Loads 2 columns: 
%   - Col 1     histogram diffs
%   - Col 2     kolumn diffs
%
function [Mes]= LoadDmtcMesHaT( lfn, nImg ) 

fileID   = fopen(lfn, 'r');

if fileID<0, error('Could not open file %s', lfn); end

%% -----  [nImg 2]  -----
Mes = zeros(nImg, 2, 'single');
for i = 1:nImg
    Mes(i,:) = fscanf(fileID, '%f', 2); % hst/kolm
end
fclose(fileID);

end


