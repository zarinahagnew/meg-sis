clear all
close all
set_params_sis;
dir='/Users/zagnew/emovox_sis/'
cd(dir)

z_colours
isubj=1
subdir{isubj}='R2527'
cd(subdir{isubj})
megdssp{isubj}.speech.MLT.speak=load('sess_SIS_produce_speech_response_locked_left_hem_dssp.mat');

chan_labels.lefttempchans=megdssp{1}.speech.MLT.speak.meg.sensor_labels(97:129)
chan_labels.rightempchans=megdssp{1}.speech.MLT.speak.meg.sensor_labels(228:261)

cd(dir)
save chan_labels