%
% Wrapper routine for program mvec1
%
% sa RennDscx.m
% 
% IN    pthVec1 vector file 1, .vec | .vef
%       pthVec2 vector file 2, .vec | .vef
%       Admin   administration, u_CmndAdmin.m
% OUT   Out     standard output
% 
function [Out] = RennMvec1( pthVec1, pthVec2, Admin )

if nargin==2, 
    Admin.pthProg = ''; 
    Admin.optS    = '';
end

cmd  	= [Admin.pthProg 'mvec1 ' pthVec1 ' ' pthVec2 ' ' Admin.optS ];

[status Out] = dos(cmd);            % excecute program

%% ------  Status  ------
if status>0
    Out
    warning('Command %s returns exit code > 0 (see Out above)', cmd);
end

%% ------  Verify Proper Termination  -----
ixEOP = strfind(Out,'EndOfProgram');
if isempty(ixEOP)
    warning('Command %s not executed. See Out below', cmd);
    Out
    LoadFocVect(pthVec2);
    fprintf('paused'); pause();
end


