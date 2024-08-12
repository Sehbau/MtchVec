%
% Wrapper routine for program mvecL, matching a list of vector files.
%
% sa RennDscx
% 
% IN   pthvecT   testing (vector) file, .vec | .vef
%      finaList  list of vector files, .vec | .vef
%      finaMes   output file name for matching results, length nFinasList   
%      Admin     administration, u_CmndAdmin.m
% OUT  Out       standard output
% 
function [Out] = RennMvecL( pthVecT, finaList, finaMes, Admin )

bDirProg = 0;

if nargin==3, 
    Admin.pthProg = ''; 
    Admin.optS    = '';
end

cmd = [Admin.pthProg ...
        'mvecL ' pthVecT ' ' finaList ' ' finaMes ' ' Admin.optS];

[status Out] = dos(cmd);                   % excecute program

%% ------  Status  ------
if status>0
    Out
    warning('something went wrong');
end

%% ------  Verify Proper Termination  -----
ixEOP = strfind(Out,'EndOfProgram');

if isempty(ixEOP)
    pthVecT
    cmd
    Out
    [VT KtT] = LoadFocVect(pthVecT);
    % [VL KtL] = LoadFocVect(vecL); I dont have a single file but a list
    fprintf('RennMvecL: EOP not found\n'); 
    
     % sometimes it hangs completely when allocating memory:
    if isempty(Out)
        fprintf('Out empty. We try to debug: '); 
        Opts    = [Opts ' --bDISP 3'];
        cmd  	= ['mvecL ' pthVecT ' ' finaList ' ' finaMes ' ' Opts];
        if bDirProg
            cmd = [dirProg cmd];
        end
        [stu Out] = dos(cmd);           % excecute program again
        Out
    end
    pause();
end


