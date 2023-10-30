% 
% Runs program mvecL (1-versus-List), once for images, and once for focii.
%
clear;
cd('c:/klab/ppc/PROD/MtchVec');     % change to directory MtchVec
progMvecL  = 'mvecL';

addpath('UtilMb');
addpath('../UtilMb');

%% --------------------------------------------------------------
%                          Images
%  --------------------------------------------------------------
imgT 	= 'Desc/img1.vec';      % testing image 
aImg    = dir('Desc/*.vec');    % representation/reference image
finaLst = 'FinasVec.txt';
SaveFinasFullDir(finaLst, aImg, 'Desc/');
finaMes = 'MesMtc.txt';

%% --------   Options   --------
OptK            = u_OptMvecStc();
OptK.tolMtc     = 0.1;
OptK.wgtPos     = 0.5;
OptK.wgtRGB     = 0.8;
OptK.cntTolMtc  = 0.05;
OptK.rsgTolMtc  = 0.06;
OptK.arcTolMtc  = 0.07;
OptK.strTolMtc  = 0.08;
optS            = i_OptMvec(OptK);

%% =========   Command   ========
cmdImg          = [progMvecL ' ' imgT ' ' finaLst ' ' finaMes ' ' optS];

[Sts OutImg]    = dos(cmdImg);

%% -------   Load Matching Results   -------
MtcImg          = LoadMtchMes(finaMes, length(aImg));

%% -------   Plot Metric Measurements   --------
figure(1); clf;
[nr nc] = deal(2,1);
subplot(nr,nc,1); bar(MtcImg(:,1)); title('Distances');
subplot(nr,nc,2); bar(MtcImg(:,2)); title('Similarities');


%% --------------------------------------------------------------
%                          Focii
%  --------------------------------------------------------------
pthFocii    = '../FocExtr/Focii/';
aFoc        = dir([pthFocii '*.vef']);
aFoc        = aFoc(5:end);              % select '*_f1.vef'
focT        = [pthFocii aFoc(1).name];  % chose some testing image
finaLst     = 'FinasFoc.txt';
SaveFinasFullDir(finaLst, aFoc, pthFocii);
finaMtcFoc  = 'MesMtcFoc.txt';

%% =========   Command   ========
cmdFoc      = [progMvecL ' ' focT ' ' finaLst ' ' finaMtcFoc ' ' optS];

[Sts OutFoc] = dos(cmdFoc);

%% -------   Load Matching Results   -------
MtcFoc   	= LoadMtchMes(finaMtcFoc, length(aFoc));

%% -------   Plot Metric Measurements  --------
figure(2); clf;
[nr nc] = deal(2,1);
subplot(nr,nc,1); bar(MtcFoc(:,1)); title('Distances');
subplot(nr,nc,2); bar(MtcFoc(:,2)); title('Similarities');
% its own should be zero for distance (and high for similarity)
% note that a value of -2 means NOT loaded/matched


%% --------------------------------------------------------------
%                As Function (for the Two Focii)
%  --------------------------------------------------------------
OutFnc  = RennMvecL(focT, finaLst, finaMtcFoc, optS);
u_OptUnrec(OutFnc);

