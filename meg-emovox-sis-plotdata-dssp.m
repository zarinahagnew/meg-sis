clear all
close all
dir='/Users/zagnew/emovox_sis/dssp/'
cd(dir)
z_colours;
set(0,'DefaultFigureWindowStyle','docked')

load /Users/zagnew/emovox_sis/sis_axis.mat;
load /Users/zagnew/emovox_sis/dssp/meg_dssp;



%% Is there SIS at all?
data_speak=mean(meg_dssp.meg_dssp_ave.speech_left_speak)
data_listen=mean(meg_dssp.meg_dssp_ave.speech_left_listen)
figure
plot(sis_axis(200:800),data_speak(200:800),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(sis_axis(200:800),data_listen(200:800),'LineWidth', 1.3, 'Color',bigdown_gs);
goodplot_wide
axis([-200 400 -40 40])
title('speech SIS MLT')
legend('produce', 'listen','Location','northeast','Orientation','horizontal')
saveas(gcf,'SIS-MLT-dssp-speechonly', 'png')




%% plot speak listen MLT
figure
subplot(311)
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.speech_left_speak),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.speech_left_listen),'LineWidth', 1.3, 'Color',bigdown_gs);
goodplot
title('speech MLT')

subplot(312)
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.laugh_left_speak),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.laugh_left_listen),'LineWidth', 1.3, 'Color',bigdown_gs);
goodplot
title('laugh MLT')

subplot(313)
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.disgust_left_speak),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.disgust_left_listen),'LineWidth', 1.3, 'Color',bigdown_gs);
goodplot
title('disgust MLT')

legend('produce', 'listen','Location','northeast','Orientation','horizontal')

saveas(gcf, 'SIS-MLT-dssp', 'png')


%% plot speak listen MRT
figure
subplot(311)
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.speech_right_speak),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.speech_right_listen),'LineWidth', 1.3, 'Color',bigdown_gs);
goodplot
title('speech MRT')

subplot(312)
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.laugh_right_speak),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.laugh_right_listen),'LineWidth', 1.3, 'Color',bigdown_gs);
goodplot
title('laugh MRT')

subplot(313)
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.disgust_right_speak),'LineWidth', 1.3, 'Color',bigup_gs);
hold on
plot(sis_axis,mean(meg_dssp.meg_dssp_ave.disgust_right_listen),'LineWidth', 1.3, 'Color',bigdown_gs);
goodplot
title('disgust MRT')

legend('produce', 'listen','Location','northeast','Orientation','horizontal')

saveas(gcf, 'SIS-MRT-dssp', 'png')



% 
% 
% %% plot these
% for isubj=1:5
% figure
% subplot(311)
% plot(sis_axis,meg_dssp{isubj}.speech_ave.MLT.speak(1:length(sis_axis)), 'LineWidth', 1.3, 'Color',bigup_gs);
% hold on
% plot(sis_axis,meg_dssp{isubj}.speech_ave.MLT.listen(1:length(sis_axis)), 'LineWidth', 1.3, 'Color',bigdown_gs);
% goodplot
% legend('produce','listen')
% 
% subplot(312)
% plot(sis_axis,meg_dssp{isubj}.meg_dssp_ave.laugh_ave.MLT.speak(1:length(sis_axis)),'LineWidth', 1.3, 'Color',bigup_gs);
% hold on
% plot(sis_axis,meg_dssp{isubj}.laugh_ave.MLT.listen(1:length(sis_axis)),'LineWidth', 1.3, 'Color',bigdown_gs);
% goodplot
% legend('produce','listen')
% 
% subplot(313)
% plot(sis_axis,meg_dssp{isubj}.disgust_ave.MLT.speak(1:length(sis_axis)),'LineWidth', 1.3, 'Color',bigup_gs);
% hold on
% plot(sis_axis,meg_dssp{isubj}.disgust_ave.MLT.listen(1:length(sis_axis)),'LineWidth', 1.3, 'Color',bigdown_gs);
% goodplot
% legend('produce','listen')
% pause
% end
% 
% print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Fig2.pdf');

