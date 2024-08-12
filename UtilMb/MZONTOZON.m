%
% Zone-to-zone matching for two lists. Same as MFOCTOFOC but we assume
% correspondence exists.
%
function Mes = MZONTOZON( aFipaQuy, aFipaRef, Admin, bDISP )

nZon    = length( aFipaQuy );
nZonRef = length( aFipaRef );

if nZon~=nZonRef
    error('#Zones not same: %d <> %d', nZon, nZonRef);
end

Mes.Sim = zeros( nZon, 1, 'single');
Mes.Dis = zeros( nZon, 1, 'single');
for z = 1:nZon
    
    fipaQ   = aFipaQuy{z};    
    fipaR   = aFipaRef{z};
    
    [VECQ, LocQ, KtQuy] = LoadFocVect( fipaQ );
    [VECR, LocR, KtRef] = LoadFocVect( fipaR );
    
    OutFoc  = RennMvec1( fipaQ, fipaR, Admin );

    u_OptUnrec( OutFoc );

    [StoF HedF]         = u_MtrMesSecs( OutFoc );
    [AMesDtyFoc totZon] = u_MtrMesScnf( StoF );
    
    if KtQuy.ntDsc==0 || KtRef.ntDsc==0 
        totZon.sim
        totZon.dis
    end
    
    Mes.Sim( z ) = totZon.sim;
    Mes.Dis( z ) = totZon.dis;
        
end % zones

%Mes.simVec = mean(Mes.Sim);
%Mes.disVec = mean(Mes.Dis);

% try taking best
if 0
SimO = sort( Mes.Sim, 'descend');
DisO = sort( Mes.Dis, 'ascend');
nLim = 8;
Mes.simVec = mean( SimO(1:nLim) );
Mes.disVec = mean( DisO(1:nLim) );
end


% Mes.simVec = sum(Mes.Sim);
% Mes.disVec = sum(Mes.Dis);
% etwas weniger akkurat:
% Mes.simVec = prod(Mes.Sim);
% Mes.disVec = prod(Mes.Dis);

end

