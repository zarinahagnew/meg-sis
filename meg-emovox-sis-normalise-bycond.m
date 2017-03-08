
clear all
close all
cd /Users/zagnew/emovox_sis
z_colours;
set_params_sis;
load meg

%% write average data into one matrix
for isubj=1:length(goodsubs)
sis.MLT.disgust(isubj,:)=meg{isubj}.disgust_denoised_normed.MLT.difference;
sis.MLT.laugh(isubj,:)=meg{isubj}.laugh_denoised_normed.MLT.difference;
sis.MLT.speech(isubj,:)=meg{isubj}.speech_denoised_normed.MLT.difference;
sis.MRT.disgust(isubj,:)=meg{isubj}.disgust_denoised_normed.MRT.difference;
sis.MRT.laugh(isubj,:)=meg{isubj}.laugh_denoised_normed.MRT.difference;
sis.MRT.speech(isubj,:)=meg{isubj}.speech_denoised_normed.MRT.difference;
end

%% mean across the group
sis.groupmean.MLT.disgust=mean(sis.MLT.disgust);
sis.groupmean.MLT.speech=mean(sis.MLT.speech);
sis.groupmean.MLT.laugh=mean(sis.MLT.laugh);
sis.groupmean.MRT.disgust=mean(sis.MRT.disgust);
sis.groupmean.MRT.speech=mean(sis.MRT.speech);
sis.groupmean.MRT.laugh=mean(sis.MRT.laugh);

% sems
sis.groupsem.MLT.disgust=std(sis.MLT.disgust)/sqrt(10);
sis.groupsem.MLT.speech=std(sis.MLT.speech)/sqrt(10);
sis.groupsem.MLT.laugh=std(sis.MLT.laugh)/sqrt(10);
sis.groupsem.MRT.disgust=std(sis.MRT.disgust)/sqrt(10);
sis.groupsem.MRT.speech=std(sis.MRT.speech)/sqrt(10);
sis.groupsem.MRT.laugh=std(sis.MRT.laugh)/sqrt(10);

% calculate flanking sem lines
sis.groupmean_sem_up.MLT.speech=sis.groupmean.MLT.speech+sis.groupsem.MLT.speech;
sis.groupmean_sem_down.MLT.speech=sis.groupmean.MLT.speech-sis.groupsem.MLT.speech;
sis.groupmean_sem_up.MLT.laugh=sis.groupmean.MLT.laugh+sis.groupsem.MLT.laugh;
sis.groupmean_sem_down.MLT.laugh=sis.groupmean.MLT.laugh-sis.groupsem.MLT.laugh;
sis.groupmean_sem_up.MLT.disgust=sis.groupmean.MLT.disgust+sis.groupsem.MLT.disgust;
sis.groupmean_sem_down.MLT.disgust=sis.groupmean.MLT.disgust-sis.groupsem.MLT.disgust;

sis.groupmean_sem_up.MRT.speech=sis.groupmean.MRT.speech+sis.groupsem.MRT.speech;
sis.groupmean_sem_down.MRT.speech=sis.groupmean.MRT.speech-sis.groupsem.MRT.speech;
sis.groupmean_sem_up.MRT.laugh=sis.groupmean.MRT.laugh+sis.groupsem.MRT.laugh;
sis.groupmean_sem_down.MRT.laugh=sis.groupmean.MRT.laugh-sis.groupsem.MRT.laugh;
sis.groupmean_sem_up.MRT.disgust=sis.groupmean.MRT.disgust+sis.groupsem.MRT.disgust;
sis.groupmean_sem_down.MRT.disgust=sis.groupmean.MRT.disgust-sis.groupsem.MRT.disgust;

save sis sis


