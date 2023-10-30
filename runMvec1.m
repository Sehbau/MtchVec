% 
% Runs program mvec1, once for two images, and once for two focii.
%
clear;
addpath('UtilMb');

progName  = 'mvec1';

%% --------------------------------------------------------------
%                          Two Images
%  --------------------------------------------------------------
dsc1 	= 'Desc/img1.vec';
dsc2   	= 'Desc/img2.vec';

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
cmdImg          = [progName ' ' dsc1 ' ' dsc2 ' ' optS];

[Sts OutImg]    = dos(cmdImg);

%% -------   Read Out StdOut   -------
[StoI HedI]     = u_MtrMesHead(OutImg);
[MesImg disImg] = u_MtrMvec(StoI, HedI);
Ndsc1I          = u_MtrMvecNdsc(StoI.Ndsc, HedI, '1');
Ndsc2I          = u_MtrMvecNdsc(StoI.Ndsc, HedI, '2');

MesI            = f_Mvv(MesImg, Ndsc1I, Ndsc2I, 'img');

%% -------   Plot Metric Measurements   --------
figure(1); clf;
bImg        = 1;
p_MvvDty(MesI, Ndsc1I, bImg);

%% --------------------------------------------------------------
%                          Two Focii
%  --------------------------------------------------------------
pthFocii = '../FocExtr/Focii/';
cmdFoc   = [progName ' ' pthFocii 'foc1.vef' ' ' pthFocii 'foc2.vef ' optS];

[Sts OutFoc] = dos(cmdFoc);

%% -------   Read Out StdOut   -------
[StoF HedF] = u_MtrMesHead(OutFoc);
[MesFoc disFoc] = u_MtrMvec(StoF, HedF);
Ndsc1F      = u_MtrMvecNdsc(StoF.Ndsc, HedF, '1');
Ndsc2F      = u_MtrMvecNdsc(StoF.Ndsc, HedF, '2');

MesF        = f_Mvv(MesFoc, Ndsc1F, Ndsc2F, 'foc');

%% -------   Plot Metric Measurements  --------
figure(2); clf;
bImg        = 0;
p_MvvDty(MesF, Ndsc1F, bImg);


%% --------------------------------------------------------------
%                As Function (for the Two Focii)
%  --------------------------------------------------------------
OutFnc  = RennMvec1([pthFocii 'foc1.vef'], [pthFocii 'foc2.vef'], optS);
u_OptUnrec(OutFnc);

