clear all
close all
dir='/data/research_meg10/zarinah/sis/meg_data/'
cd(dir)
load /data/research_meg10/zarinah/sis/meg_data/sis_axis.mat;
z_colours;
set_params_sis;

%% subject 1
isubj=1
subdir{isubj}='R2527_LH';
cd(subdir{isubj});
cd sessionfiles;
megdssp{isubj}.speech.MLT.speak=load('sess_SIS_produce_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.speak=load('sess_SIS_produce_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.speak=load('sess_SIS_produce_disgust_response_locked_left_hem_dssp.mat');
megdssp{isubj}.speech.MLT.listen=load('sess_SIS_listen_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.listen=load('sess_SIS_listen_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.listen=load('sess_SIS_listen_disgust_response_locked_left_hem_dssp.mat');

% right
megdssp{isubj}.speech.MRT.speak=load('sess_SIS_produce_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.speak=load('sess_SIS_produce_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.speak=load('sess_SIS_produce_disgust_response_locked_right_hem_dssp.mat');
megdssp{isubj}.speech.MRT.listen=load('sess_SIS_listen_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.listen=load('sess_SIS_listen_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.listen=load('sess_SIS_listen_disgust_response_locked_right_hem_dssp.mat');


%% subject 2
cd(dir)
isubj=2
subdir{isubj}='R2528_TA'
cd(subdir{isubj})
cd sessionfiles
megdssp{isubj}.speech.MLT.speak=load('R2528_sess_SIS_produce_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.speak=load('R2528_sess_SIS_produce_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.speak=load('R2528_sess_SIS_produce_disgust_response_locked_left_hem_dssp.mat');
megdssp{isubj}.speech.MLT.listen=load('R2528_sess_SIS_listen_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.listen=load('R2528_sess_SIS_listen_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.listen=load('R2528_sess_SIS_listen_disgust_response_locked_left_hem_dssp.mat');
%right
megdssp{isubj}.speech.MRT.speak=load('R2528_sess_SIS_produce_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.speak=load('R2528_sess_SIS_produce_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.speak=load('R2528_sess_SIS_produce_disgust_response_locked_right_hem_dssp.mat');
megdssp{isubj}.speech.MRT.listen=load('R2528_sess_SIS_listen_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.listen=load('R2528_sess_SIS_listen_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.listen=load('R2528_sess_SIS_listen_disgust_response_locked_right_hem_dssp.mat');


%% subject 3
cd(dir)
isubj=3
subdir{isubj}='R2529_EJH'
cd(subdir{isubj})
cd sessionfiles
megdssp{isubj}.speech.MLT.speak=load('R2529_sess_SIS_produce_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.speak=load('R2529_sess_SIS_produce_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.speak=load('R2529_sess_SIS_produce_disgust_response_locked_left_hem_dssp.mat');
megdssp{isubj}.speech.MLT.listen=load('R2529_sess_SIS_listen_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.listen=load('R2529_sess_SIS_listen_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.listen=load('R2529_sess_SIS_listen_disgust_response_locked_left_hem_dssp.mat');
% right
megdssp{isubj}.speech.MRT.speak=load('R2529_sess_SIS_produce_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.speak=load('R2529_sess_SIS_produce_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.speak=load('R2529_sess_SIS_produce_disgust_response_locked_right_hem_dssp.mat');
megdssp{isubj}.speech.MRT.listen=load('R2529_sess_SIS_listen_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.listen=load('R2529_sess_SIS_listen_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.listen=load('R2529_sess_SIS_listen_disgust_response_locked_right_hem_dssp.mat');


%% subject 4
cd(dir)
isubj=4
subdir{isubj}='R2538_CM'
cd(subdir{isubj})
cd sessionfiles
megdssp{isubj}.speech.MLT.speak=load('R2538_sess_SIS_produce_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.speak=load('R2538_sess_SIS_produce_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.speak=load('R2538_sess_SIS_produce_disgust_response_locked_left_hem_dssp.mat');
megdssp{isubj}.speech.MLT.listen=load('R2538_sess_SIS_listen_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.listen=load('R2538_sess_SIS_listen_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.listen=load('R2538_sess_SIS_listen_disgust_response_locked_left_hem_dssp.mat');
% right
megdssp{isubj}.speech.MRT.speak=load('R2538_sess_SIS_produce_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.speak=load('R2538_sess_SIS_produce_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.speak=load('R2538_sess_SIS_produce_disgust_response_locked_right_hem_dssp.mat');
megdssp{isubj}.speech.MRT.listen=load('R2538_sess_SIS_listen_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.listen=load('R2538_sess_SIS_listen_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.listen=load('R2538_sess_SIS_listen_disgust_response_locked_right_hem_dssp.mat');

%% subject 5
cd(dir)
isubj=5
subdir{isubj}='R2542_GM'
cd(subdir{isubj})
cd sessionfiles
megdssp{isubj}.speech.MLT.speak=load('R2542_sess_SIS_produce_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.speak=load('R2542_sess_SIS_produce_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.speak=load('R2542_sess_SIS_produce_disgust_response_locked_left_hem_dssp.mat');
megdssp{isubj}.speech.MLT.listen=load('R2542_sess_SIS_listen_speech_response_locked_left_hem_dssp.mat');
megdssp{isubj}.laugh.MLT.listen=load('R2542_sess_SIS_listen_laugh_response_locked_left_hem_dssp.mat');
megdssp{isubj}.disgust.MLT.listen=load('R2542_sess_SIS_listen_disgust_response_locked_left_hem_dssp.mat');
%right
megdssp{isubj}.speech.MRT.speak=load('R2542_sess_SIS_produce_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.speak=load('R2542_sess_SIS_produce_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.speak=load('R2542_sess_SIS_produce_disgust_response_locked_right_hem_dssp.mat');
megdssp{isubj}.speech.MRT.listen=load('R2542_sess_SIS_listen_speech_response_locked_right_hem_dssp.mat');
megdssp{isubj}.laugh.MRT.listen=load('R2542_sess_SIS_listen_laugh_response_locked_right_hem_dssp.mat');
megdssp{isubj}.disgust.MRT.listen=load('R2542_sess_SIS_listen_disgust_response_locked_right_hem_dssp.mat');




% =========================================================================
%% calc average
for isubj=1:5
meg_dssp{isubj}.speech_ave.MLT.speak=mean(megdssp{isubj}.speech.MLT.speak.meg.data(:,97:129,1)');
meg_dssp{isubj}.laugh_ave.MLT.speak=mean(megdssp{isubj}.laugh.MLT.speak.meg.data(:,97:129,1)');
meg_dssp{isubj}.disgust_ave.MLT.speak=mean(megdssp{isubj}.disgust.MLT.speak.meg.data(:,97:129,1)');
meg_dssp{isubj}.speech_ave.MLT.listen=mean(megdssp{isubj}.speech.MLT.listen.meg.data(:,97:129,1)');
meg_dssp{isubj}.laugh_ave.MLT.listen=mean(megdssp{isubj}.laugh.MLT.listen.meg.data(:,97:129,1)');
meg_dssp{isubj}.disgust_ave.MLT.listen=mean(megdssp{isubj}.disgust.MLT.listen.meg.data(:,97:129,1)');

meg_dssp{isubj}.speech_ave.MRT.speak=mean(megdssp{isubj}.speech.MRT.speak.meg.data(:,228:261,1)');
meg_dssp{isubj}.laugh_ave.MRT.speak=mean(megdssp{isubj}.laugh.MRT.speak.meg.data(:,228:261,1)');
meg_dssp{isubj}.disgust_ave.MRT.speak=mean(megdssp{isubj}.disgust.MRT.speak.meg.data(:,228:261,1)');
meg_dssp{isubj}.speech_ave.MRT.listen=mean(megdssp{isubj}.speech.MRT.listen.meg.data(:,228:261,1)');
meg_dssp{isubj}.laugh_ave.MRT.listen=mean(megdssp{isubj}.laugh.MRT.listen.meg.data(:,228:261,1)');
meg_dssp{isubj}.disgust_ave.MRT.listen=mean(megdssp{isubj}.disgust.MRT.listen.meg.data(:,228:261,1)');
end

%% stdev
for isubj=1:5
meg_dssp{isubj}.speech_std.MLT.speak=std(megdssp{isubj}.speech.MLT.speak.meg.data(:,97:129,1)');
meg_dssp{isubj}.laugh_std.MLT.speak=std(megdssp{isubj}.laugh.MLT.speak.meg.data(:,97:129,1)');
meg_dssp{isubj}.disgust_std.MLT.speak=std(megdssp{isubj}.disgust.MLT.speak.meg.data(:,97:129,1)');
meg_dssp{isubj}.speech_std.MLT.listen=std(megdssp{isubj}.speech.MLT.listen.meg.data(:,97:129,1)');
meg_dssp{isubj}.laugh_std.MLT.listen=std(megdssp{isubj}.laugh.MLT.listen.meg.data(:,97:129,1)');
meg_dssp{isubj}.disgust_std.MLT.listen=std(megdssp{isubj}.disgust.MLT.listen.meg.data(:,97:129,1)');

meg_dssp{isubj}.speech_std.MRT.speak=std(megdssp{isubj}.speech.MRT.speak.meg.data(:,228:261,1)');
meg_dssp{isubj}.laugh_std.MRT.speak=std(megdssp{isubj}.laugh.MRT.speak.meg.data(:,228:261,1)');
meg_dssp{isubj}.disgust_std.MRT.speak=std(megdssp{isubj}.disgust.MRT.speak.meg.data(:,228:261,1)');
meg_dssp{isubj}.speech_std.MRT.listen=std(megdssp{isubj}.speech.MRT.listen.meg.data(:,228:261,1)');
meg_dssp{isubj}.laugh_std.MRT.listen=std(megdssp{isubj}.laugh.MRT.listen.meg.data(:,228:261,1)');
meg_dssp{isubj}.disgust_std.MRT.listen=std(megdssp{isubj}.disgust.MRT.listen.meg.data(:,228:261,1)');
end

%% sem
for isubj=1:5
meg_dssp{isubj}.speech_sem.MLT.speak=std(megdssp{isubj}.speech.MLT.speak.meg.data(:,97:129,1)')/sqrt(33);
meg_dssp{isubj}.laugh_sem.MLT.speak=std(megdssp{isubj}.laugh.MLT.speak.meg.data(:,97:129,1)')/sqrt(33);
meg_dssp{isubj}.disgust_sem.MLT.speak=std(megdssp{isubj}.disgust.MLT.speak.meg.data(:,97:129,1)'/sqrt(33));
meg_dssp{isubj}.speech_sem.MLT.listen=std(megdssp{isubj}.speech.MLT.listen.meg.data(:,97:129,1)'/sqrt(33));
meg_dssp{isubj}.laugh_sem.MLT.listen=std(megdssp{isubj}.laugh.MLT.listen.meg.data(:,97:129,1)'/sqrt(33));
meg_dssp{isubj}.disgust_sem.MLT.listen=std(megdssp{isubj}.disgust.MLT.listen.meg.data(:,97:129,1)'/sqrt(33));

meg_dssp{isubj}.speech_sem.MRT.speak=std(megdssp{isubj}.speech.MRT.speak.meg.data(:,228:261,1)'/sqrt(33));
meg_dssp{isubj}.laugh_sem.MRT.speak=std(megdssp{isubj}.laugh.MRT.speak.meg.data(:,228:261,1)'/sqrt(33));
meg_dssp{isubj}.disgust_sem.MRT.speak=std(megdssp{isubj}.disgust.MRT.speak.meg.data(:,228:261,1)'/sqrt(33));
meg_dssp{isubj}.speech_sem.MRT.listen=std(megdssp{isubj}.speech.MRT.listen.meg.data(:,228:261,1)'/sqrt(33));
meg_dssp{isubj}.laugh_sem.MRT.listen=std(megdssp{isubj}.laugh.MRT.listen.meg.data(:,228:261,1)'/sqrt(33));
meg_dssp{isubj}.disgust_sem.MRT.listen=std(megdssp{isubj}.disgust.MRT.listen.meg.data(:,228:261,1)'/sqrt(33));
end


%% group averages
for isubj=1:5;
meg_dssp_ave.speech_left_speak(isubj,:)=meg_dssp{isubj}.speech_ave.MLT.speak(1:2161);
meg_dssp_ave.speech_right_speak(isubj,:)=meg_dssp{isubj}.speech_ave.MRT.speak(1:2161);
meg_dssp_ave.speech_left_listen(isubj,:)=meg_dssp{isubj}.speech_ave.MLT.listen(1:2161);
meg_dssp_ave.speech_right_listen(isubj,:)=meg_dssp{isubj}.speech_ave.MRT.listen(1:2161);
meg_dssp_ave.laugh_left_speak(isubj,:)=meg_dssp{isubj}.laugh_ave.MLT.speak(1:2161);
meg_dssp_ave.laugh_right_speak(isubj,:)=meg_dssp{isubj}.laugh_ave.MRT.speak(1:2161);
meg_dssp_ave.laugh_left_listen(isubj,:)=meg_dssp{isubj}.laugh_ave.MLT.listen(1:2161);
meg_dssp_ave.laugh_right_listen(isubj,:)=meg_dssp{isubj}.laugh_ave.MRT.listen(1:2161);
meg_dssp_ave.disgust_left_speak(isubj,:)=meg_dssp{isubj}.disgust_ave.MLT.speak(1:2161);
meg_dssp_ave.disgust_right_speak(isubj,:)=meg_dssp{isubj}.disgust_ave.MRT.speak(1:2161);
meg_dssp_ave.disgust_left_listen(isubj,:)=meg_dssp{isubj}.disgust_ave.MLT.listen(1:2161);
meg_dssp_ave.disgust_right_listen(isubj,:)=meg_dssp{isubj}.disgust_ave.MRT.listen(1:2161);
meg_dssp_sem.speech_left_speak(isubj,:)=meg_dssp{isubj}.speech_sem.MLT.speak(1:2161);
meg_dssp_sem.speech_right_speak(isubj,:)=meg_dssp{isubj}.speech_sem.MRT.speak(1:2161);
meg_dssp_sem.speech_left_listen(isubj,:)=meg_dssp{isubj}.speech_sem.MLT.listen(1:2161);
meg_dssp_sem.speech_right_listen(isubj,:)=meg_dssp{isubj}.speech_sem.MRT.listen(1:2161);
meg_dssp_sem.laugh_left_speak(isubj,:)=meg_dssp{isubj}.laugh_sem.MLT.speak(1:2161);
meg_dssp_sem.laugh_right_speak(isubj,:)=meg_dssp{isubj}.laugh_sem.MRT.speak(1:2161);
meg_dssp_sem.laugh_left_listen(isubj,:)=meg_dssp{isubj}.laugh_sem.MLT.listen(1:2161);
meg_dssp_sem.laugh_right_listen(isubj,:)=meg_dssp{isubj}.laugh_sem.MRT.listen(1:2161);
meg_dssp_sem.disgust_left_speak(isubj,:)=meg_dssp{isubj}.disgust_sem.MLT.speak(1:2161);
meg_dssp_sem.disgust_right_speak(isubj,:)=meg_dssp{isubj}.disgust_sem.MRT.speak(1:2161);
meg_dssp_sem.disgust_left_listen(isubj,:)=meg_dssp{isubj}.disgust_sem.MLT.listen(1:2161);
meg_dssp_sem.disgust_right_listen(isubj,:)=meg_dssp{isubj}.disgust_sem.MRT.listen(1:2161);
end

cd(dir)
meg_dssp.meg_dssp_ave=meg_dssp_ave
meg_dssp.meg_dssp_sem=meg_dssp_sem

save meg_dssp meg_dssp

meg-emovox-sis-plotdata-dssp