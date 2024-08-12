% 
% Runs program mvecL (1-versus-List) for three cases:
% 1) images (matching vec files)
% 2) focii  (matching vef files)
% 3) for focii with function wrapper RennMvecL
%
% PREVIOUS  runFocFew.m
%
clear;
run('../UtilMb/globalsSB');
cd( PthProg.mtchVec );

finaProg   = 'mvecL';

%% --------------------------------------------------------------
%                          Images
%  --------------------------------------------------------------
pthImgTst   = 'Desc/img1.vec';      % testing image 
aImgNaRep   = dir('Desc/*.vec');    % representation/reference image
finaLst     = 'FinasVec.txt';
SaveFipaLstFromDir( aImgNaRep, 'Desc/', finaLst );
finaMes     = 'MesMtc.txt';

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
cmndImg      = [finaProg ' ' pthImgTst ' ' finaLst ' ' finaMes ' ' optS];

[Sts OutImg] = dos(cmndImg);

%% -------   Load Matching Results   -------
MtcImg       = LoadMtchMes(finaMes, length(aImgNaRep));

%% -------   Plot Metric Measurements   --------
figure(1); clf;
[nr nc] = deal(2,1);
subplot(nr,nc,1); bar(MtcImg(:,1)); title('Distances');
subplot(nr,nc,2); bar(MtcImg(:,2)); title('Similarities');


%% --------------------------------------------------------------
%                          Focii
%  --------------------------------------------------------------
dirFocii    = '../FocExtr/Focii/';
aFocNa      = dir( [dirFocii '*.vef'] );
aFocNa      = aFocNa(5:end);              % select '*_f1.vef'
pthFocTst   = [dirFocii aFocNa(1).name];  % chose some testing image
finaLst     = 'FinasFoc.txt';
SaveFipaLstFromDir( aFocNa, dirFocii, finaLst );
finaMtcFoc  = 'MesMtcFoc.txt';

%% =========   Command   ========
cmndFoc     = [finaProg ' ' pthFocTst ' ' finaLst ' ' finaMtcFoc ' ' optS];

[Sts OutFoc] = dos(cmndFoc);

%% -------   Load Matching Results   -------
MtcFoc   	= LoadMtchMes(finaMtcFoc, length(aFocNa));

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
Admin       = u_CmndAdmin();
Admin.optS  = optS;

OutFnc  = RennMvecL( pthFocTst, finaLst, finaMtcFoc, Admin );
u_OptUnrec(OutFnc);

