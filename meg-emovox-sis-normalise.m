clear all
close all
cd /Users/zagnew/emovox_sis
z_colours;
set_params_sis;
load meg

for isubj=1:nsubs
%for each sub, calculate baseline by condition
baselinemeg{isubj}.speech_denoised.MLT.speak=meg{isubj}.speech_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MLT.speak=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MLT.speak=meg{isubj}.disgust_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.speech_denoised.MLT.listen=meg{isubj}.speech_denoised.MLT.listen.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MLT.listen=meg{isubj}.laugh_denoised.MLT.speak.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MLT.listen=meg{isubj}.disgust_denoised.MLT.listen.ovrms(1:361);

baselinemeg{isubj}.speech_denoised.MRT.speak=meg{isubj}.speech_denoised.MRT.speak.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MRT.speak=meg{isubj}.laugh_denoised.MRT.listen.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MRT.speak=meg{isubj}.disgust_denoised.MRT.speak.ovrms(1:361);
baselinemeg{isubj}.speech_denoised.MRT.listen=meg{isubj}.speech_denoised.MRT.listen.ovrms(1:361);
baselinemeg{isubj}.laugh_denoised.MRT.listen=meg{isubj}.laugh_denoised.MRT.speak.ovrms(1:361);
baselinemeg{isubj}.disgust_denoised.MRT.listen=meg{isubj}.disgust_denoised.MRT.listen.ovrms(1:361);

%for each sub, normalise the trial by this value
meg{isubj}.speech_denoised_normed_bycond.MLT.speak.ovrms=meg{isubj}.speech_denoised.MLT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.speak);
meg{isubj}.speech_denoised_normed_bycond.MLT.listen.ovrms=meg{isubj}.speech_denoised.MLT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MLT.listen);
meg{isubj}.laugh_denoised_normed_bycond.MLT.speak.ovrms=meg{isubj}.laugh_denoised.MLT.speak.ovrms/mean(baselinemeg{isubj}.laugh_denoised.MLT.speak);
meg{isubj}.laugh_denoised_normed_bycond.MLT.listen.ovrms=meg{isubj}.laugh_denoised.MLT.listen.ovrms/mean(baselinemeg{isubj}.laugh_denoised.MLT.listen);
meg{isubj}.disgust_denoised_normed_bycond.MLT.speak.ovrms=meg{isubj}.disgust_denoised.MLT.speak.ovrms/mean(baselinemeg{isubj}.disgust_denoised.MLT.speak);
meg{isubj}.disgust_denoised_normed_bycond.MLT.listen.ovrms=meg{isubj}.disgust_denoised.MLT.listen.ovrms/mean(baselinemeg{isubj}.disgust_denoised.MLT.listen);

meg{isubj}.speech_denoised_normed_bycond.MRT.speak.ovrms=meg{isubj}.speech_denoised.MRT.speak.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.speak);
meg{isubj}.speech_denoised_normed_bycond.MRT.listen.ovrms=meg{isubj}.speech_denoised.MRT.listen.ovrms/mean(baselinemeg{isubj}.speech_denoised.MRT.listen);
meg{isubj}.laugh_denoised_normed_bycond.MRT.speak.ovrms=meg{isubj}.laugh_denoised.MRT.speak.ovrms/mean(baselinemeg{isubj}.laugh_denoised.MRT.speak);
meg{isubj}.laugh_denoised_normed_bycond.MRT.listen.ovrms=meg{isubj}.laugh_denoised.MRT.listen.ovrms/mean(baselinemeg{isubj}.laugh_denoised.MRT.listen);
meg{isubj}.disgust_denoised_normed_bycond.MRT.speak.ovrms=meg{isubj}.disgust_denoised.MRT.speak.ovrms/mean(baselinemeg{isubj}.disgust_denoised.MRT.speak);
meg{isubj}.disgust_denoised_normed_bycond.MRT.listen.ovrms=meg{isubj}.disgust_denoised.MRT.listen.ovrms/mean(baselinemeg{isubj}.disgust_denoised.MRT.listen);


% calulate difference between speak and listen for all three conditions
meg{isubj}.speech_denoised_normed_bycond.MLT.difference= meg{isubj}.speech_denoised_normed.MLT.listen.ovrms - meg{isubj}.speech_denoised_normed.MLT.speak.ovrms;
meg{isubj}.laugh_denoised_normed_bycond.MLT.difference= meg{isubj}.laugh_denoised_normed.MLT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MLT.speak.ovrms;
meg{isubj}.disgust_denoised_normed_bycond.MLT.difference= meg{isubj}.disgust_denoised_normed.MLT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MLT.speak.ovrms;

meg{isubj}.speech_denoised_normed_bycond.MRT.difference= meg{isubj}.speech_denoised_normed.MRT.listen.ovrms - meg{isubj}.speech_denoised_normed.MRT.speak.ovrms;
meg{isubj}.laugh_denoised_normed_bycond.MRT.difference= meg{isubj}.laugh_denoised_normed.MRT.listen.ovrms - meg{isubj}.laugh_denoised_normed.MRT.speak.ovrms;
meg{isubj}.disgust_denoised_normed_bycond.MRT.difference= meg{isubj}.disgust_denoised_normed.MRT.listen.ovrms - meg{isubj}.disgust_denoised_normed.MRT.speak.ovrms;

end

save meg meg