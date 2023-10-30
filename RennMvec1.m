%
% Wrapper routine for program mvec1
% 
% IN    vec1    vector file 1, .vec | .vef
%       vec2    vector file 2, .vec | .vef
%       Opts    [optional] options
%       dirProg [optional] path of program
%
% OUT   Out     standard output
% 
function [Out] = RennMvec1(vec1, vec2, Opts, dirProg)

bDirProg = 0;

if nargin==2, Opts = ''; end
if nargin>3,  bDirProg = 1; end

cmd  	= ['mvec1 ' vec1 ' ' vec2 ' ' Opts];

if bDirProg
    cmd = [dirProg cmd];
end

[Sts Out] = dos(cmd);                   % excecute program

%% ------  Verify Proper Termination  -----
ixEOP = strfind(Out,'EndOfProgram');
if isempty(ixEOP)
    vec1
    vec2
    cmd
    Out
    LoadFocVect(vec2);
    fprintf('paused'); pause();
end


