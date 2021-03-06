%% for analysis of SIS data in sensory space. 
% uses get_meg_and_rms and imports all subjects data into one data
% structure and saves it as meg.mat

clear all
close all
% set_params_sis
cd /Users/zagnew/emovox_sis/

%% subject 1
isubj=1
subdir{isubj}='R2527'
cd(subdir{isubj})
megdir{isubj}='/Users/zagnew/emovox_sis/R2527/R2527_SPRA_20161006_speech_badex_ave.ds'
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
baselinemeg(4,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg(5,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg(6,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline);

%% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline

%% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

%% subject 2
cd ..
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
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

cd ..

%% subject 3
cd ..
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
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

cd ..

%% subject 4
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
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

cd ..


%% subject 5
isubj=5
subdir{isubj}='R2535'
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
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

cd ..

%% subject 6
isubj=6
subdir{isubj}='R2536'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2536_SPRA_20161013__speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2536_SPRA_20161013__listen_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2532_SPRA_20261012_laugh_badex_ave.ds',1,'MLT',2,40,1)
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
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

cd ..

%% subject 7
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
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;
cd ..

%% subject 8
isubj=8
subdir{isubj}='R2542'
cd(subdir{isubj})
meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2542_SPRA_20161018_speech_badex_ave.ds',1,'MLT',2,40,1);
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2542_SPRA_20161018_listen_speech_badex_ave.ds',1,'MLT',2,40,1)
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
avebaseline(isubj,:)=mean(baselinemeg);
aveavebaseline(isubj)=mean(avebaseline(isubj,:));

% divide all trials by this value to normalise them
meg{isubj}.speech_denoised_normed.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.speech_denoised_normed.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/aveavebaseline(isubj)
meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/aveavebaseline(isubj)
                                                    
% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

cd ..
save meg meg

%% plots
% figure
% subplot(311)
% plot(meg{isubj}.disgust_denoised.MLT.speak.taxis.ms, meg{isubj}.speech_denoised_normed.MLT.difference)
% axis([-300 500 -15 5])
% title 'speak > listen - speech')
% goodplot
% 
% subplot(312)
% plot(meg{isubj}.disgust_denoised.MLT.speak.taxis.ms, meg{isubj}.laugh_denoised_normed.MLT.difference)
% axis([-300 500 -15 5])
% title 'speak > listen - laughter')
% goodplot
% 
% subplot(313)
% plot(meg{isubj}.disgust_denoised.MLT.speak.taxis.ms, meg{isubj}.disgust_denoised_normed.MLT.difference)
% axis([-300 500 -15 5])
% title 'speak > listen - disgust')
% goodplot
% 
% print('SIS looks like a peak on this graph')
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% %% plots
% 
% figure
% subplot(411)
% plot(meg{isubj}.speech_denoised.MLT.speak.taxis.ms, meg{isubj}.speech_denoised.MLT.speak.ovrms,'k')
% hold
% plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.speech_denoised.MLT.listen.ovrms,'r')
% legend('speak', 'listen')
% goodplot
% 
% subplot(412)
% plot(meg{isubj}.laugh_denoised.MLT.speak.taxis.ms,meg{isubj}.laugh_denoised.MLT.speak.ovrms,'k')
% hold
% plot(meg{isubj}.laugh_denoised.MLT.listen.taxis.ms,meg{isubj}.laugh_denoised.MLT.listen.ovrms,'r')
% legend('speak', 'listen')
% goodplot
% 
% subplot(413)
% plot(meg{isubj}.disgust_denoised.MLT.speak.taxis.ms,meg{isubj}.disgust_denoised.MLT.speak.ovrms,'k')
% hold
% plot(meg{isubj}.disgust_denoised.MLT.listen.taxis.ms,meg{isubj}.disgust_denoised.MLT.listen.ovrms,'r')
% legend('speak', 'listen')
% goodplot
