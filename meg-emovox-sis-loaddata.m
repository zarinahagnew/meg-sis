%% for analysis of SIS data in sensory space. 
% uses get_meg_and_rms and imports all subjects data into one data
% structure and saves it as meg.mat

clear all
close all
set_params_sis;
dir='/Users/zagnew/emovox_sis/'
cd(dir)

%% subject 1
isubj=1
subdir{isubj}='R2527'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2527_SPRA_20161006_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2527_SPRA_20161006_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2527_SPRA_20161006_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT);


%% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT

%% normalise by condition?

%% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;
cd(dir)

%% subject 2
isubj=2
subdir{isubj}='R2528'
cd(subdir{isubj})
megdir{isubj}='/Users/zagnew/emovox_sis/R2528/R2528_SPRA_20161006_speech_badex_ave.ds'
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2528_SPRA_20161006_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2528_SPRA_20161006_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2528_SPRA_20161006_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2528_SPRA_20161006_listen_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2528_SPRA_20161006_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2528_SPRA_20161006_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

%% subject 3
cd(dir)
isubj=3
subdir{isubj}='R2529'
cd(subdir{isubj})
megdir{isubj}='/Users/zagnew/emovox_sis/R2529/R2529_SPRA_20161006_speech_badex_ave.ds'
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2529_SPRA_20161006_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2529_SPRA_20161006_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2529_SPRA_20161006_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2529_SPRA_20161006_listen_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2529_SPRA_20161006_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2529_SPRA_20161006_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

%% subject 4
cd(dir)
isubj=4
subdir{isubj}='R2532'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2532_SPRA_20161012_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2532_SPRA_20161012_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2532_SPRA_20261012_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2532_SPRA_20161012_listen_laugh_badex_ave.ds',1,'MLT',2,40,1) 
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2532_SPRA_20161012_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2532_SPRA_20161012_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

%% subject 5
cd(dir)
isubj=5;
subdir{isubj}='R2535';
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2535_SPRA_20161013_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2535_SPRA_20161013_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
% ZED CHECK THIS OUT >>
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2532_SPRA_20261012_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2535_SPRA_20161013_listen_laugh_badex_ave.ds',1,'MLT',2,40,1) 
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2535_SPRA_20161013_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2535_SPRA_20161013_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;


%% subject 6
cd(dir)
isubj=6
subdir{isubj}='R2536'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2536_SPRA_20161013__speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2536_SPRA_20161013__listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2536_SPRA_20261012_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2536_SPRA_20161013__listen_laugh_badex_ave.ds',1,'MLT',2,40,1) 
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2536_SPRA_20161013__disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2536_SPRA_20161013__listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;


%% subject 7
cd(dir)
isubj=7
subdir{isubj}='R2538'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2538_SPRA_20161013_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2538_SPRA_20161013_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2538_SPRA_20161013_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2538_SPRA_20161013_listen_laugh_badex_ave.ds',1,'MLT',2,40,1) 
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2538_SPRA_20161013_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2538_SPRA_20161013_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;


%% subject 8
cd(dir)
isubj=8
subdir{isubj}='R2542'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2542_SPRA_20161018_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
% meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2542_SPRA_20161018_speech_badex_ave_2.ds',1,'MLT',2,40,1);
% meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_speech_badex_ave_2.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2542_SPRA_20161018_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_laugh_badex_ave.ds',1,'MLT',2,40,1) 
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2542_SPRA_20161018_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);

avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;



%% subject 9
cd(dir)
isubj=9
subdir{isubj}='R2533'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2533_SPRA_20161012_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2533_SPRA_20161012_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2533_SPRA_20261012_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2533_SPRA_20161012_listen_laugh_badex_ave.ds',1,'MLT',2,40,1) 
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2533_SPRA_20161012_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2533_SPRA_20161012_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);

avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

%% subject 10
cd(dir)
isubj=10
subdir{isubj}='R2539'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2539_SPRA_20161013_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2539_SPRA_20161013_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2539_SPRA_20161013_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2539_SPRA_20161013_listen_laugh_badex_ave.ds',1,'MLT',2,40,1) 
meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2539_SPRA_20161013_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2539_SPRA_20161013_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MLT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);

avebaseline_MLT(isubj,:)=mean(baselinemeg);
aveavebaseline_MLT(isubj)=mean(avebaseline_MLT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline_MLT(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline_MLT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

cd(dir)




%% ========================================================================
%% for analysis of SIS data in sensory space. 
% uses get_meg_and_rms and imports all subjects data into one data
% structure and saves it as meg.mat

clear all
close all
set_params_sis;
dir='/Users/zagnew/emovox_sis/'
cd(dir)

%% subject 1
isubj=1
subdir{isubj}='R2527'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2527_SPRA_20161006_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2527_SPRA_20161006_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2527_SPRA_20161006_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT);

%% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT

%% normalise by condition?




%% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;
cd(dir)

%% subject 2
isubj=2
subdir{isubj}='R2528'
cd(subdir{isubj})
megdir{isubj}='/Users/zagnew/emovox_sis/R2528/R2528_SPRA_20161006_speech_badex_ave.ds'
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2528_SPRA_20161006_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2528_SPRA_20161006_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2528_SPRA_20161006_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2528_SPRA_20161006_listen_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2528_SPRA_20161006_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2528_SPRA_20161006_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;

%% subject 3
cd(dir)
isubj=3
subdir{isubj}='R2529'
cd(subdir{isubj})
megdir{isubj}='/Users/zagnew/emovox_sis/R2529/R2529_SPRA_20161006_speech_badex_ave.ds'
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2529_SPRA_20161006_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2529_SPRA_20161006_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2529_SPRA_20161006_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2529_SPRA_20161006_listen_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2529_SPRA_20161006_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2529_SPRA_20161006_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;

%% subject 4
cd(dir)
isubj=4
subdir{isubj}='R2532'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2532_SPRA_20161012_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2532_SPRA_20161012_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2532_SPRA_20261012_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2532_SPRA_20161012_listen_laugh_badex_ave.ds',1,'MRT',2,40,1) 
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2532_SPRA_20161012_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2532_SPRA_20161012_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;

%% subject 5
cd(dir)
isubj=5;
subdir{isubj}='R2535';
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2535_SPRA_20161013_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2535_SPRA_20161013_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
% ZED CHECK THIS OUT >>
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2532_SPRA_20261012_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2535_SPRA_20161013_listen_laugh_badex_ave.ds',1,'MRT',2,40,1) 
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2535_SPRA_20161013_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2535_SPRA_20161013_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;


%% subject 6
cd(dir)
isubj=6
subdir{isubj}='R2536'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2536_SPRA_20161013__speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2536_SPRA_20161013__listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2536_SPRA_20261012_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2536_SPRA_20161013__listen_laugh_badex_ave.ds',1,'MRT',2,40,1) 
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2536_SPRA_20161013__disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2536_SPRA_20161013__listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;


%% subject 7
cd(dir)
isubj=7
subdir{isubj}='R2538'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2538_SPRA_20161013_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2538_SPRA_20161013_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2538_SPRA_20161013_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2538_SPRA_20161013_listen_laugh_badex_ave.ds',1,'MRT',2,40,1) 
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2538_SPRA_20161013_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2538_SPRA_20161013_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;


%% subject 8
cd(dir)
isubj=8
subdir{isubj}='R2542'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2542_SPRA_20161018_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
% meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2542_SPRA_20161018_speech_badex_ave_2.ds',1,'MRT',2,40,1);
% meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_speech_badex_ave_2.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2542_SPRA_20161018_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_laugh_badex_ave.ds',1,'MRT',2,40,1) 
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2542_SPRA_20161018_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);

avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;



%% subject 9
cd(dir)
isubj=9
subdir{isubj}='R2533'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2533_SPRA_20161012_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2533_SPRA_20161012_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2533_SPRA_20261012_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2533_SPRA_20161012_listen_laugh_badex_ave.ds',1,'MRT',2,40,1) 
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2533_SPRA_20161012_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2533_SPRA_20161012_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);

avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;

%% subject 10
cd(dir)
isubj=10
subdir{isubj}='R2539'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MRT.speak = get_meg_and_rms('R2539_SPRA_20161013_speech_badex_ave.ds',1,'MRT',2,40,1);
meg{isubj}.speech_denoised.MRT.listen = get_meg_and_rms('R2539_SPRA_20161013_listen_speech_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.speak = get_meg_and_rms('R2539_SPRA_20161013_laugh_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.laugh_denoised.MRT.listen = get_meg_and_rms('R2539_SPRA_20161013_listen_laugh_badex_ave.ds',1,'MRT',2,40,1) 
meg{isubj}.disgust_denoised.MRT.speak = get_meg_and_rms('R2539_SPRA_20161013_disgust_badex_ave.ds',1,'MRT',2,40,1)
meg{isubj}.disgust_denoised.MRT.listen = get_meg_and_rms('R2539_SPRA_20161013_listen_disgust_badex_ave.ds',1,'MRT',2,40,1)

% calc -300 to 0 average stdev across all conditions
baselinemeg(1,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(2,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(3,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg(7,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(8,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(9,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);
baselinemeg(10,:)=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg(11,:)=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg(12,:)=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);

avebaseline_MRT(isubj,:)=mean(baselinemeg);
aveavebaseline_MRT(isubj)=mean(avebaseline_MRT(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.speech_denoised_normed.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/aveavebaseline_MRT(isubj)
meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/aveavebaseline_MRT(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;






for isubj=1:nsubs
baselinemeg{isubj}.speech_denoised.MLT.speak=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MLT.speak=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MLT.speak=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.speech_denoised.MLT.listen=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MLT.listen=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MLT.listen=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);

baselinemeg{isubj}.speech_denoised.MRT.speak=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MRT.speak=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MRT.speak=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg{isubj}.speech_denoised.MRT.listen=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MRT.listen=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MRT.listen=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);

meg{isubj}.speech_denoised_normed_bycond.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.speak)
meg{isubj}.speech_denoised_normed_bycond.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.speak)
meg{isubj}.laugh_denoised_normed_bycond.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.speak)
meg{isubj}.laugh_denoised_normed_bycond.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.speak)
meg{isubj}.disgust_denoised_normed_bycond.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.speak)
meg{isubj}.disgust_denoised_normed_bycond.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.speak)

meg{isubj}.speech_denoised_normed_bycond.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.speak)
meg{isubj}.speech_denoised_normed_bycond.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.speak)
meg{isubj}.laugh_denoised_normed_bycond.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.speak)
meg{isubj}.laugh_denoised_normed_bycond.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.speak)
meg{isubj}.disgust_denoised_normed_bycond.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.speak)
meg{isubj}.disgust_denoised_normed_bycond.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.speak)

end



cd(dir)
save meg meg

% plotz



