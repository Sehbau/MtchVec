%
% Focus-to-focus matching for two lists. Calls function f_FocToFoc for
% one-on-one matching.
%
function [M Mes] = MFOCTOFOC( aFipaQuy, aFipaRef, Admin, bDISP )

nFocQuy = length( aFipaQuy );
nFocRef = length( aFipaRef );

M.DMvec = ones( nFocQuy, nFocRef, 'single') * 99;
M.SMvec = zeros(nFocQuy, nFocRef, 'single');
M.SMbox = M.SMvec;

for qq = 1:nFocQuy
    
    %fprintf('q/r %2d/%2d: lev %d: %2d x %2d\n', ...
    %q, r, lev, nFocQuy, nFocRef);
    
    [FVquy LocQ] = LoadFocVect( aFipaQuy{qq} );
    
    for rr = 1:nFocRef
        
        [FVref LocR] = LoadFocVect( aFipaRef{rr} );
        
        % ============   FOC 2 FOC  ============
        % runs mvec1 (RennMvec1.m)
        Mftf = f_FocToFoc( LocQ, LocR, ...
                           aFipaQuy{qq}, aFipaRef{rr}, ...
                           Admin, bDISP );
        
        % -----  A2M res  -----
        M.SMbox( qq, rr ) = Mftf.mtcBox;
        if Mftf.totFoc.bMtched
            M.SMvec( qq, rr ) = Mftf.totFoc.sim;
            M.DMvec( qq, rr ) = Mftf.totFoc.dis;
        end
        
    end % rr
    
    %% --------   with RennMvecL: I needed to included location matching
    % af runMvecL.m
    % finaRefLst = aLipaRef{lev};
    %cmd     = [ 'mvecL ' pthQuy ' ' finaRefLst ' ' finaMes ];
    %OutMvecL = f_ExecCommand( cmd, Args );
    
    
end % qq

%% =====  analyze focal matches [lev]  =====
Mes.simBox = 0;
Mes.simVec = 0;
Mes.disVec = 0;
if nFocQuy>0 && nFocRef>0
    
    [simBoxLev OBOX] = f_MtrFromMM( M.SMbox, 'descend' );
    [simVecLev OSIM] = f_MtrFromMM( M.SMvec, 'descend' );
    [disVecLev ODIS] = f_MtrFromMM( M.DMvec, 'ascend' );
    
    Mes.simBox  = simBoxLev.mul;
    Mes.simVec  = simVecLev.mul;
    Mes.disVec  = disVecLev.mul;
    
    if bDISP>2
        figure(1); clf; [nr nc] = deal(3,2);
        subplot(nr,nc,1); imagesc(OBOX.O12); title('box');
        subplot(nr,nc,2); imagesc(OBOX.O21); title('box');
        subplot(nr,nc,3); imagesc(OSIM.O12); title('sim');
        subplot(nr,nc,4); imagesc(OSIM.O21); title('sim');
        subplot(nr,nc,5); imagesc(ODIS.O12); title('dis'); colorbar();
        subplot(nr,nc,6); imagesc(ODIS.O21); title('dis');
        pause();
    end
end

end

