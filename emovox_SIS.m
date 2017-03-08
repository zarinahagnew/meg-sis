%% for analysis of SIS data in sensory space. 
% uses get_meg_and_rms


clear all
close all
% set_params_sis
cd /Users/zagnew/emovox_sis/
% scp -r R2527_SPRA_20161006_listen_laugh_badex_ave.ds zagnew@carvaka.radiology.ucsf.edu:/data/research_meg10/zarinah/sis/meg_data/R2527_LH/ .

subdir{1}='R2527';

for isubj=1:1
cd(subdir{isubj})

meg{isubj}.speech_denoised.MLT.speak = get_meg_and_rms('R2527_SPRA_20161006_speech_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.speech_denoised.MLT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_speech_badex_ave.ds',1,'MLT',2,40,1)

meg{isubj}.laugh_denoised.MLT.speak = get_meg_and_rms('R2527_SPRA_20161006_laugh_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.laugh_denoised.MLT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_laugh_badex_ave.ds',1,'MLT',2,40,1)

meg{isubj}.disgust_denoised.MLT.speak = get_meg_and_rms('R2527_SPRA_20161006_disgust_badex_ave.ds',1,'MLT',2,40,1)
meg{isubj}.disgust_denoised.MLT.listen = get_meg_and_rms('R2527_SPRA_20161006_listen_disgust_badex_ave.ds',1,'MLT',2,40,1)



%% calc -300 to 0 average stdev across all conditions
% meg{isubj}.laugh_denoised.MLT.speak.ovrms
for icond=1:6
baselinemeg(icond,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361)
baselinemeg(icond,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361)
baselinemeg(icond,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361)
baselinemeg(icond,:)=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361)
baselinemeg(icond,:)=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361)
baselinemeg(icond,:)=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361)
end

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
meg{isubj}.speech_denoised_normed.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.speak.ovrms - meg{isubj}.speech_denoised_normed.MLT.listen.ovrms;
meg{isubj}.laugh_denoised_normed.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms - meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms;
meg{isubj}.disgust_denoised_normed.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms - meg{isubj}.digust_denoised_normed.MLT.listen.ovrms;


%% save this for each subject
save meg
cd ..

end

%% plots

figure
subplot(411)
plot(meg{isubj}.speech_denoised.MLT.speak.taxis.ms, meg{isubj}.speech_denoised.MLT.speak.ovrms,'k')
hold
plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.speech_denoised.MLT.listen.ovrms,'r')
legend('speak', 'listen')
goodplot

subplot(412)
plot(meg{isubj}.laugh_denoised.MLT.speak.taxis.ms,meg{isubj}.laugh_denoised.MLT.speak.ovrms,'k')
hold
plot(meg{isubj}.laugh_denoised.MLT.listen.taxis.ms,meg{isubj}.laugh_denoised.MLT.listen.ovrms,'r')
legend('speak', 'listen')
goodplot

subplot(413)
plot(meg{isubj}.disgust_denoised.MLT.speak.taxis.ms,meg{isubj}.disgust_denoised.MLT.speak.ovrms,'k')
hold
plot(meg{isubj}.disgust_denoised.MLT.listen.taxis.ms,meg{isubj}.disgust_denoised.MLT.listen.ovrms,'r')
legend('speak', 'listen')
goodplot
