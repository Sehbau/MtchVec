%
% Focus-to-focus (1-on-1) matching using wrapper RennMvec1.
%
% Two steps:
%   1) determines proper spatial location 
%   2) matches vectors
%
% RETURNS OutFoc only if step no. 2) has occured.
% 
%
function [M] = f_FocToFoc( LocQ,  LocR, ...
                           fipaQ, finaR, ...
                           Admin, bDISP )
                                      
M.OutFoc = 'not run yet';

%% ---------------   Spatial Location   -------------                                      
                                      
Gbx   = f_BoxCong( LocQ.hgtN, LocQ.wthN, LocR.hgtN, LocR.wthN );

spcng = f_SpcngTol( LocQ.posV, LocQ.posH, ...
                    LocR.posV, LocR.posH, Gbx );

if spcng > 1,     spcng = 1; end % will set sim to zero
if Gbx.g < 0.125, Gbx.g = 0; end

M.mtcBox  = Gbx.g * ( 1 - spcng );

bMtcBox   = M.mtcBox > 0.1;   % determines if mvec is run
if bDISP > 0
    fprintf('%1.3f  %1.3f = %1.3f  %d\n', spcng, Gbx.g, M.mtcBox, bMtcBox);
end

%% -------------   Match Vectors   ---------------
% af runMvec1.m
M.totFoc            = struct;
M.totFoc.bMtched    = 0;
if bMtcBox

    M.OutFoc      = RennMvec1( fipaQ, finaR, Admin );

    u_OptUnrec( M.OutFoc );

    [StoF HedF]            = u_MtrMesSecs( M.OutFoc );
    [AMesDtyFoc M.totFoc]  = u_MtrMesScnf( StoF );
    
    M.totFoc.bMtched = 1;
end


end

