
clear all
close all
cd /Users/zagnew/emovox_sis
load meg

%% write average data into one matrix
for isubj=1:2
sis.disgust(isubj,:)=meg{isubj}.disgust_denoised_normed.MLT.difference
sis.laugh(isubj,:)=meg{isubj}.laugh_denoised_normed.MLT.difference
sis.speech(isubj,:)=meg{isubj}.speech_denoised_normed.MLT.difference
end

%% mean across the group
sis.groupmean.disgust=mean(sis.disgust)
sis.groupmean.speech=mean(sis.speech)
sis.groupmean.laugh=mean(sis.laugh)
% meg{2}.disgust_denoised_normed.MLT.difference
% 
% %% calculate average diffs across subjects 