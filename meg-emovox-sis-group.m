
clear all
close all
cd /Users/zagnew/emovox_sis
set_params_sis;
load meg
z_colours;

%% write average data into one matrix
for isubj=1:nsubs
sis.disgust(isubj,:)=meg{isubj}.disgust_denoised_normed.MLT.difference;
sis.laugh(isubj,:)=meg{isubj}.laugh_denoised_normed.MLT.difference;
sis.speech(isubj,:)=meg{isubj}.speech_denoised_normed.MLT.difference;
end

%% mean across the group
sis.groupmean.disgust=mean(sis.disgust);
sis.groupmean.speech=mean(sis.speech);
sis.groupmean.laugh=mean(sis.laugh);

save sis sis
%% plot these
figure
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.speech(1:1000),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.disgust(1:1000), 'LineWidth', 1.3, 'Color',bigdown_gs);
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.laugh(1:1000), 'LineWidth', 1.3, 'Color',clear_colour);
legend('speech', 'laugh', 'digust')
goodplot
axis([-300 600 -3 2])

