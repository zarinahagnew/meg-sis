
clear all
close all
cd /Users/zagnew/emovox_sis
z_colours;
set_params_sis;

load meg
load sis
%  
% %% left hem individual subjects
for isubj=1:nsubs
    h=figure
    subplot(311)
    plot(meg{isubj}.speech_denoised.MLT.speak.taxis.ms, meg{isubj}.speech_denoised_normed.MLT.speak.ovrms,'LineWidth', 3, 'Color',speech_colour);
    hold
    plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.speech_denoised_normed.MLT.listen.ovrms,'LineWidth', 3, 'Color',laugh_colour);
    legend('speak', 'listen')
    goodplot
    axis([-350 500 0 15])
    
    subplot(312)
    plot(meg{isubj}.speech_denoised.MLT.speak.taxis.ms, meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms,'LineWidth', 3, 'Color',speech_colour);
    hold
    plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms,'LineWidth', 3, 'Color',laugh_colour);
    goodplot
    axis([-350 500 0 15])
    
    subplot(313)
    plot(meg{isubj}.disgust_denoised.MLT.speak.taxis.ms, meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms,'LineWidth', 3, 'Color',speech_colour);
    hold
    plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms,'LineWidth', 3, 'Color',laugh_colour);
    goodplot
    axis([-350 500 0 15])
    saveas(h,sprintf('singlesub_fig%d.png',isubj)); % will create FIG1, FIG2,...
end
% 
% for isubj=1:nsubs
%     figure
%     subplot(311)
%     plot(meg{isubj}.speech_denoised.MRT.speak.taxis.ms, meg{isubj}.speech_denoised_normed.MRT.speak.ovrms,'LineWidth', 3, 'Color',speech_colour);
%     hold
%     plot(meg{isubj}.speech_denoised.MRT.listen.taxis.ms,meg{isubj}.speech_denoised_normed.MRT.listen.ovrms,'LineWidth', 3, 'Color',laugh_colour);
%     legend('speak', 'listen')
%     goodplot
%     axis([-350 500 0 15])
%     
%     subplot(312)
%     plot(meg{isubj}.speech_denoised.MRT.speak.taxis.ms, meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms,'LineWidth', 3, 'Color',speech_colour);
%     hold
%     plot(meg{isubj}.speech_denoised.MRT.listen.taxis.ms,meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms,'LineWidth', 3, 'Color',laugh_colour);
%     goodplot
%     axis([-350 500 0 15])
%     
%     subplot(313)
%     plot(meg{isubj}.disgust_denoised.MRT.speak.taxis.ms, meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms,'LineWidth', 3, 'Color',speech_colour);
%     hold
%     plot(meg{isubj}.speech_denoised.MRT.listen.taxis.ms,meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms,'LineWidth', 3, 'Color',laugh_colour);
%     goodplot
%     axis([-350 500 0 15])
%     pause
% end

%% group plots
speech_colour=navy;
laugh_colour=pink;
disgust_colour=softgreen;

figure
subplot(211)
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.speech(1:1000), 'LineWidth', 2, 'Color',speech_colour); 
hold on
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.laugh(1:1000), 'LineWidth', 2, 'Color',laugh_colour);
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.disgust(1:1000), 'LineWidth', 2, 'Color',disgust_colour);

% with sems
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean_sem_up.MLT.speech(1:1000), 'LineWidth', 1, 'Color',speech_colour);
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean_sem_down.MLT.speech(1:1000), 'LineWidth', 1, 'Color',speech_colour);
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean_sem_up.MLT.laugh(1:1000), 'LineWidth', 1, 'Color',laugh_colour);
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean_sem_down.MLT.laugh(1:1000), 'LineWidth', 1, 'Color',laugh_colour);
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean_sem_up.MLT.disgust(1:1000), 'LineWidth', 1, 'Color',disgust_colour);
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean_sem_down.MLT.disgust(1:1000), 'LineWidth', 1, 'Color',disgust_colour);

axis([-300 600 -6 2])
goodplot

subplot(212)
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MRT.speech(1:1000), 'LineWidth', 2, 'Color',speech_colour);
hold on
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MRT.laugh(1:1000), 'LineWidth', 2, 'Color',laugh_colour);
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MRT.disgust(1:1000), 'LineWidth', 2, 'Color',disgust_colour);
axis([-300 600 -6 2])
goodplot

legend('speech', 'laugh', 'disgust','Location','southeast','Orientation','horizontal')

saveas(gcf,'figures/SIS-bothhems-nosem.png')


%% plot LEFT CHANNEL SIS
baseLine = 2;        %# Baseline value for filling under the curves
index = 1:1000;         %# Indices of points to fill under

x=meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000);
speech.MLT.y1=sis.groupmean_sem_up.MLT.speech(1:1000);
speech.MLT.y2=sis.groupmean_sem_down.MLT.speech(1:1000);
laugh.MLT.y1=sis.groupmean_sem_up.MLT.laugh(1:1000);
laugh.MLT.y2=sis.groupmean_sem_down.MLT.laugh(1:1000);
disgust.MLT.y1=sis.groupmean_sem_up.MLT.disgust(1:1000);
disgust.MLT.y2=sis.groupmean_sem_down.MLT.disgust(1:1000);

speech.MRT.y1=sis.groupmean_sem_up.MRT.speech(1:1000);
speech.MRT.y2=sis.groupmean_sem_down.MRT.speech(1:1000);
laugh.MRT.y1=sis.groupmean_sem_up.MRT.laugh(1:1000);
laugh.MRT.y2=sis.groupmean_sem_down.MRT.laugh(1:1000);
disgust.MRT.y1=sis.groupmean_sem_up.MRT.disgust(1:1000);
disgust.MRT.y2=sis.groupmean_sem_down.MRT.disgust(1:1000);

%plot flanking lines      
figure
title('SIS Left temporal channels')
subplot(311)
speech.h2 = fill(x(index([1 1:end end])), [baseLine speech.MLT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
speech.h1 = fill(x(index([1 1:end end])), [baseLine speech.MLT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.speech(1:1000),'LineWidth', 2, 'Color',speech_colour);
goodplot
axis([-300 600 -7 2])

% laugh
subplot(312)
laugh.h2 = fill(x(index([1 1:end end])), [baseLine laugh.MLT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
laugh.h1 = fill(x(index([1 1:end end])), [baseLine laugh.MLT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.laugh(1:1000),'LineWidth', 2, 'Color',laugh_colour);
goodplot
axis([-300 600 -7 2])
% disgust
subplot(313)
disgust.h2 = fill(x(index([1 1:end end])), [baseLine disgust.MLT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
%disgust.h2 = fill(x(index([1 1:end end])), [2 disgust.MLT.y2(index) 2], mediumgrey, 'EdgeColor','none');
hold on
disgust.h1 = fill(x(index([1 1:end end])), [baseLine disgust.MLT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.disgust(1:1000),'LineWidth', 2, 'Color',disgust_colour);
goodplot
axis([-300 600 -7 2])
saveas(gcf,'figures/SIS-MLT.png')


%% PLOT MRT SIS
baseLine = 2;        %# Baseline value for filling under the curves
index = 1:1000;         %# Indices of points to fill under

x=meg{1}.speech_denoised.MRT.speak.taxis.ms(1:1000);
speech.MRT.y1=sis.groupmean_sem_up.MRT.speech(1:1000);
speech.MRT.y2=sis.groupmean_sem_down.MRT.speech(1:1000);
laugh.MRT.y1=sis.groupmean_sem_up.MRT.laugh(1:1000);
laugh.MRT.y2=sis.groupmean_sem_down.MRT.laugh(1:1000);
disgust.MRT.y1=sis.groupmean_sem_up.MRT.disgust(1:1000);
disgust.MRT.y2=sis.groupmean_sem_down.MRT.disgust(1:1000);

speech.MRT.y1=sis.groupmean_sem_up.MRT.speech(1:1000);
speech.MRT.y2=sis.groupmean_sem_down.MRT.speech(1:1000);
laugh.MRT.y1=sis.groupmean_sem_up.MRT.laugh(1:1000);
laugh.MRT.y2=sis.groupmean_sem_down.MRT.laugh(1:1000);
disgust.MRT.y1=sis.groupmean_sem_up.MRT.disgust(1:1000);
disgust.MRT.y2=sis.groupmean_sem_down.MRT.disgust(1:1000);

%plot flanking lines      
figure
title('SIS Right temporal channels')
subplot(311)
speech.h2 = fill(x(index([1 1:end end])), [baseLine speech.MRT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
speech.h1 = fill(x(index([1 1:end end])), [baseLine speech.MRT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MRT.speak.taxis.ms(1:1000),sis.groupmean.MRT.speech(1:1000),'LineWidth', 2, 'Color',speech_colour);
goodplot
axis([-300 600 -7 6])

% laugh
subplot(312)
laugh.h2 = fill(x(index([1 1:end end])), [baseLine laugh.MRT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
laugh.h1 = fill(x(index([1 1:end end])), [baseLine laugh.MRT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MRT.speak.taxis.ms(1:1000),sis.groupmean.MRT.laugh(1:1000),'LineWidth', 2, 'Color',laugh_colour);
goodplot
axis([-300 600 -7 2]) 

% disgust
subplot(313)
%disgust.h2 = fill(x(index([1 1:end end])), [baseLine disgust.MRT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
disgust.h2 = fill(x(index([1 1:end end])), [2 disgust.MRT.y2(index) 2], mediumgrey, 'EdgeColor','none');
hold on
disgust.h1 = fill(x(index([1 1:end end])), [2 disgust.MRT.y1(index) 2], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MRT.speak.taxis.ms(1:1000),sis.groupmean.MRT.disgust(1:1000),'LineWidth', 2, 'Color',disgust_colour);
goodplot
axis([-300 600 -7 2]) 

saveas(gcf,'figures/SIS-MRT.png')

%% ========================================================================
% short time window 
% plot LEFT CHANNEL SIS
baseLine = 2;        %# Baseline value for filling under the curves

x=meg{1}.speech_denoised.MLT.speak.taxis.ms(200:800);
speech.MLT.y1=sis.groupmean_sem_up.MLT.speech(200:800);
speech.MLT.y2=sis.groupmean_sem_down.MLT.speech(200:800);
laugh.MLT.y1=sis.groupmean_sem_up.MLT.laugh(200:800);
laugh.MLT.y2=sis.groupmean_sem_down.MLT.laugh(200:800);
disgust.MLT.y1=sis.groupmean_sem_up.MLT.disgust(200:800);
disgust.MLT.y2=sis.groupmean_sem_down.MLT.disgust(200:800);

speech.MRT.y1=sis.groupmean_sem_up.MRT.speech(200:800);
speech.MRT.y2=sis.groupmean_sem_down.MRT.speech(200:800);
laugh.MRT.y1=sis.groupmean_sem_up.MRT.laugh(200:800);
laugh.MRT.y2=sis.groupmean_sem_down.MRT.laugh(200:800);
disgust.MRT.y1=sis.groupmean_sem_up.MRT.disgust(200:800);
disgust.MRT.y2=sis.groupmean_sem_down.MRT.disgust(200:800);

%plot flanking lines      
figure
title('SIS Left temporal channels')
subplot(311)
speech.h2 = fill(x(index([1 1:end end])), [baseLine speech.MLT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
speech.h1 = fill(x(index([1 1:end end])), [baseLine speech.MLT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(200:800),sis.groupmean.MLT.speech(200:800),'LineWidth', 2, 'Color',speech_colour);
goodplot
axis([-150 400 -7 6])

% laugh
subplot(312)
laugh.h2 = fill(x(index([1 1:end end])), [baseLine laugh.MLT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
laugh.h1 = fill(x(index([1 1:end end])), [baseLine laugh.MLT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(200:800),sis.groupmean.MLT.laugh(200:800),'LineWidth', 2, 'Color',laugh_colour);
goodplot
axis([-150 400 -7 6])

% disgust
subplot(313)
disgust.h2 = fill(x(index([1 1:end end])), [baseLine disgust.MLT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
%disgust.h2 = fill(x(index([1 1:end end])), [2 disgust.MLT.y2(index) 2], mediumgrey, 'EdgeColor','none');
hold on
disgust.h1 = fill(x(index([1 1:end end])), [baseLine disgust.MLT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(200:800),sis.groupmean.MLT.disgust(200:800),'LineWidth', 2, 'Color',disgust_colour);
goodplot
axis([-150 400 -7 6])

saveas(gcf,'figures/SIS-MLT-shorttimewindow.png')

% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(200:800),sis.groupmean.MLT.speech(200:800),'LineWidth', 2, 'Color',speech_colour);
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(200:800),sis.groupmean.MLT.laugh(200:800),'LineWidth', 2, 'Color',up_gs);
% plot(meg{1}.speech_denoised.MLT.speak.taxis.ms(200:800),sis.groupmean.MLT.disgust(200:800),'LineWidth', 2, 'Color',laugh_colour);


%% PLOT MRT SIS
% baseLine = 2;        %# Baseline value for filling under the curves
% index = 200:800;         %# Indices of points to fill under

x=meg{1}.speech_denoised.MRT.speak.taxis.ms(200:800);
speech.MRT.y1=sis.groupmean_sem_up.MRT.speech(200:800);
speech.MRT.y2=sis.groupmean_sem_down.MRT.speech(200:800);
laugh.MRT.y1=sis.groupmean_sem_up.MRT.laugh(200:800);
laugh.MRT.y2=sis.groupmean_sem_down.MRT.laugh(200:800);
disgust.MRT.y1=sis.groupmean_sem_up.MRT.disgust(200:800);
disgust.MRT.y2=sis.groupmean_sem_down.MRT.disgust(200:800);

speech.MRT.y1=sis.groupmean_sem_up.MRT.speech(200:800);
speech.MRT.y2=sis.groupmean_sem_down.MRT.speech(200:800);
laugh.MRT.y1=sis.groupmean_sem_up.MRT.laugh(200:800);
laugh.MRT.y2=sis.groupmean_sem_down.MRT.laugh(200:800);
disgust.MRT.y1=sis.groupmean_sem_up.MRT.disgust(200:800);
disgust.MRT.y2=sis.groupmean_sem_down.MRT.disgust(200:800);

%plot flanking lines      
figure
title('SIS Right temporal channels')
subplot(311)
speech.h2 = fill(x(index([1 1:end end])), [baseLine speech.MRT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
speech.h1 = fill(x(index([1 1:end end])), [baseLine speech.MRT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MRT.speak.taxis.ms(200:800),sis.groupmean.MRT.speech(200:800),'LineWidth', 2, 'Color',speech_colour);
goodplot
axis([-300 600 -7 2]) 

% laugh
subplot(312)
laugh.h2 = fill(x(index([1 1:end end])), [baseLine laugh.MRT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
hold on
laugh.h1 = fill(x(index([1 1:end end])), [baseLine laugh.MRT.y1(index) baseLine], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MRT.speak.taxis.ms(200:800),sis.groupmean.MRT.laugh(200:800),'LineWidth', 2, 'Color',laugh_colour);
goodplot
axis([-300 600 -7 2]) 

% disgust
subplot(313)
%disgust.h2 = fill(x(index([1 1:end end])), [baseLine disgust.MRT.y2(index) baseLine], mediumgrey, 'EdgeColor','none');
disgust.h2 = fill(x(index([1 1:end end])), [2 disgust.MRT.y2(index) 2], mediumgrey, 'EdgeColor','none');
hold on
disgust.h1 = fill(x(index([1 1:end end])), [2 disgust.MRT.y1(index) 2], 'w' ,'EdgeColor','none');
plot(meg{1}.speech_denoised.MRT.speak.taxis.ms(200:800),sis.groupmean.MRT.disgust(200:800),'LineWidth', 2, 'Color',disgust_colour);
goodplot
axis([-300 600 -7 2]) 

saveas(gcf,'figures/SIS-MRT-short time window.png')


%% normed by condition

meg{isubj}.speech_denoised_normed_bycond.MLT.difference
figure
subplot(211)
plot(meg{1}.speech_denoised_normed_bycond.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.speech(1:1000), 'LineWidth', 2, 'Color',speech_colour);
hold on
plot(meg{1}.speech_denoised_normed_bycond.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.laugh(1:1000), 'LineWidth', 2, 'Color',laugh_colour);
plot(meg{1}.speech_denoised_normed_bycond.MLT.speak.taxis.ms(1:1000),sis.groupmean.MLT.disgust(1:1000), 'LineWidth', 2, 'Color',disgust_colour);
axis([-300 600 -6 6])
goodplot

subplot(212)
plot(meg{1}.speech_denoised_normed_bycond.MLT.speak.taxis.ms(1:1000),sis.groupmean.MRT.speech(1:1000), 'LineWidth', 2, 'Color',speech_colour);
hold on
plot(meg{1}.speech_denoised_normed_bycond.MLT.speak.taxis.ms(1:1000),sis.groupmean.MRT.laugh(1:1000), 'LineWidth', 2, 'Color',laugh_colour);
plot(meg{1}.speech_denoised_normed_bycond.MLT.speak.taxis.ms(1:1000),sis.groupmean.MRT.disgust(1:1000), 'LineWidth', 2, 'Color',disgust_colour);
axis([-300 600 -6 6])
goodplot
legend('speech', 'laugh', 'disgust')
saveas(gcf,'figures/SIS-bothhems-nosem.png')



