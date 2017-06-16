function plot_rms_4megan_orig(dataset_root) %dataset root of the form '/data/research_meg5/SIS_pert/KortNaomi/KortNaomi_SPRA_20080826'
% plot_rms_4megan_orig(/Users/zagnew/emovox_sis/R2527)

lreg = 'MLT';
rreg = 'MRT';

figure; 
subplot(2,1,1);
plot_SIS_avg_SISALT(dataset_root, lreg, 'first75noalt')
axis([-50 200 0 100])
title('Left Hemisphere First 75 No Alt')
xlabel('Time (msec)')
ylabel('Voltage (fT)')
%legend('Speaking', 'Listening');

subplot(2,1,2);
plot_SIS_avg_SISALT(dataset_root, rreg, 'first75noalt')
axis([-50 200 0 100])
title('Right Hemisphere First 75 No Alt')
xlabel('Time (msec)')
ylabel('Voltage (fT)')





