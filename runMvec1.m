% 
% Runs program mvec1, once for two images, and once for two focii.
% For multiple files see runMvecL.m
%
% PREVIOUS  runFocFew.m, runCopy12.cmd
% PRESENT   runMvec1.m
% NEXT      runMvecL.m (list)
% 
clear;
run('../UtilMb/globalsSB');
cd( PthProg.mtchVec );                     

finaProg  = 'mvec1';
% progName  = FipaExe.mvec1; % or use full path

%% --------------------------------------------------------------
%                          Two Images
%  --------------------------------------------------------------
pthDsc1 	= 'Desc/img1.vec';
pthDsc2   	= 'Desc/img2.vec';

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
cmdImg          = [finaProg ' ' pthDsc1 ' ' pthDsc2 ' ' optS];

[sts OutImg]    = dos(cmdImg);

%% -------   Read Out StdOut   -------
[StoI HedI]             = u_MtrMesSecs( OutImg );
[AMesDtyImg mesTotImg]  = u_MtrMesScnf( StoI );

% explicit version:
%[StoI HedI]     = u_MtrMesHead(OutImg);
%[MesImg disImg] = u_MtrMvec(StoI, HedI);
%Ndsc1I          = u_MtrMvecNdsc(StoI.Ndsc, HedI, '1');
%Ndsc2I          = u_MtrMvecNdsc(StoI.Ndsc, HedI, '2');
%MesI            = f_Mvv(MesImg, Ndsc1I, Ndsc2I, 'img');

%% -------   Plot Metric Measurements   --------
figure(1); clf;
bImg        = 1;
%p_MvvDtyVx(MesI, Ndsc1I, bImg);
p_MvvDty( AMesDtyImg );

%% --------------------------------------------------------------
%                          Two Focii
%  --------------------------------------------------------------
% needs FocExtr/runCopy12.cmd

dirFocii = '../FocExtr/Focii/';
cmndFoc  = [finaProg ' ' dirFocii 'foc1.vef' ' ' dirFocii 'foc2.vef ' optS];

[Sts OutFoc] = dos( cmndFoc );

%% -------   Read Out StdOut   -------
[StoF HedF]             = u_MtrMesSecs( OutFoc );
[AMesDtyFoc mesTotFoc]  = u_MtrMesScnf( StoF );

%[StoF HedF] = u_MtrMesHead(OutFoc);
%[MesFoc disFoc] = u_MtrMvec(StoF, HedF);
%Ndsc1F      = u_MtrMvecNdsc(StoF.Ndsc, HedF, '1');
%Ndsc2F      = u_MtrMvecNdsc(StoF.Ndsc, HedF, '2');
%MesF        = f_Mvv(MesFoc, Ndsc1F, Ndsc2F, 'foc');

%% -------   Plot Metric Measurements  --------
figure(2); clf;
bImg        = 0;
%p_MvvDty(MesF, Ndsc1F, bImg);
p_MvvDty( AMesDtyFoc );


%% --------------------------------------------------------------
%                As Function (for the Two Focii)
%  --------------------------------------------------------------
Admin       = u_CmndAdmin();
Admin.optS  = optS;

OutFnc  = RennMvec1([dirFocii 'foc1.vef'], [dirFocii 'foc2.vef'], Admin );
u_OptUnrec(OutFnc);

