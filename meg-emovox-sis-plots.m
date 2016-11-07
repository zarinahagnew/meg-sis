
clear all
close all
cd /Users/zagnew/emovox_sis
set_params_sis;
z_colours;
load meg

for isubj=1:nsubs
    figure
    subplot(311)
    plot(meg{isubj}.speech_denoised.MLT.speak.taxis.ms, meg{isubj}.speech_denoised_normed.MLT.speak.ovrms,'LineWidth', 1.3, 'Color',bigup_gs);
    hold
    plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.speech_denoised_normed.MLT.listen.ovrms,'LineWidth', 1.3, 'Color',bigdown_gs);
    legend('speak', 'listen')
    goodplot
    axis([-350 500 0 15])
    
    subplot(312)
    plot(meg{isubj}.speech_denoised.MLT.speak.taxis.ms, meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms,'LineWidth', 1.3, 'Color',bigup_gs);
    hold
    plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms,'LineWidth', 1.3, 'Color',bigdown_gs);
    goodplot
    axis([-350 500 0 15])
    
    subplot(313)
    plot(meg{isubj}.disgust_denoised.MLT.speak.taxis.ms, meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms,'LineWidth', 1.3, 'Color',bigup_gs);
    hold
    plot(meg{isubj}.speech_denoised.MLT.listen.taxis.ms,meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms,'LineWidth', 1.3, 'Color',bigdown_gs);
    goodplot
    axis([-350 500 0 15])
    pause
end

