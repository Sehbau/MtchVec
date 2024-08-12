%
% Loads matching results for each desctype column-wise [nMtc nDscTyp]
%
% cf lvngRunMvec.m 
%
function [Mes]= LoadMtchMESdty(lfn, nImg, nDty) 

fileID   = fopen(lfn, 'rt');

if fileID<0, error('Could not open file %s', lfp); end
    
%% -----  [nImg nDty]  -----
Mes = zeros(nImg, nDty, 'single');
for l = 1:nImg
    Row      = fscanf(fileID, '%f', nDty);
    %l
    %size(Row)
    Mes(l,:) = Row;
end
fclose(fileID);

end


