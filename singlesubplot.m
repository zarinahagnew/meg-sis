
cd /Users/zagnew/emovox_sis/R2527

one=get_meg_and_rms('R2527_SPRA_20161006_speech_badex_ave.ds',1,'MLT',2,40,1);

subplot(411)
plot(one.taxis.ms,one.dat.filtered)
goodplot

subplot(412)
plot(one.taxis.ms,one.dat.denoised)
goodplot

subplot(413)
plot(one.taxis.ms,one.dat.rms)
goodplot

subplot(414)
plot(one.taxis.ms,one.ovrms)
goodplot



two=get_meg_and_rms('R2527_SPRA_20161006_speech_badex_ave.ds',2,'MLT',2,40,1);

figure
subplot(411)
plot(two.taxis.ms,one.dat.filtered)
goodplot

subplot(412)
plot(two.taxis.ms,one.dat.denoised)
goodplot

subplot(413)
plot(two.taxis.ms,one.dat.rms)
goodplot

subplot(414)
plot(two.taxis.ms,one.ovrms)
goodplot

three=get_meg_and_rms('R2527_SPRA_20161006_speech_badex_ave.ds',3,'MLT',2,40,1);

figure
subplot(411)
plot(three.taxis.ms,one.dat.filtered)
goodplot

subplot(412)
plot(three.taxis.ms,one.dat.denoised)
goodplot

subplot(413)
plot(three.taxis.ms,one.dat.rms)
goodplot

subplot(414)
plot(three.taxis.ms,one.ovrms)
goodplot
