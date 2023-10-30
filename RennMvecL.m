%
% Wrapper routine for program mvecL, matching a list of vector files.
% 
% IN   vecT     testing (vector) file, .vec | .vef
%      finaList list of vector files, .vec | .vef
%      finaMtc  output file name for matching results, length nFinasList   
%      Opts     [optional] options
%      dirProg  [optional] path of program
%
% OUT  Out      standard output
% 
function [Out] = RennMvecL(vecT, finaList, finaMtc, Opts, dirProg)

bDirProg = 0;

if nargin==3, Opts = ''; end
if nargin>4,  bDirProg = 1; end

cmd  	= ['mvecL ' vecT ' ' finaList ' ' finaMtc ' ' Opts];

if bDirProg
    cmd = [dirProg cmd];
end

[Sts Out] = dos(cmd);                   % excecute program

%% ------  Verify Proper Termination  -----
ixEOP = strfind(Out,'EndOfProgram');
if isempty(ixEOP)
    vecT
    cmd
    Out
    [VT KtT] = LoadFocVect(vecT);
    % [VL KtL] = LoadFocVect(vecL); I dont have a single file but a list
    fprintf('RennMvecL: EOP not found\n'); 
    
     % sometimes it hangs completely when allocating memory:
    if isempty(Out)
        fprintf('Out empty. We try to debug: '); 
        Opts    = [Opts ' --bDISP 3'];
        cmd  	= ['mvecL ' vecT ' ' finaList ' ' finaMtc ' ' Opts];
        if bDirProg
            cmd = [dirProg cmd];
        end
        [Sts Out] = dos(cmd);           % excecute program again
        Out
    end
    pause();
end


