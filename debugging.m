
/Users/zagnew/emovox_sis/R2542

listen=get_meg_and_rms('R2542_SPRA_20161018_speech_listen_badexcluded.ds',1,'MLT',2,40,1)
speak=get_meg_and_rms('R2542_SPRA_20161018_speech_badexcluded.ds',1,'MLT',2,40,1)
figure

plot(listen.taxis.ms, listen.ovrms,'k')
hold
plot(speak.taxis.ms, speak.ovrms,'r')
legend('speak', 'listen')
goodplot
axis([-500 1500 0 200])
