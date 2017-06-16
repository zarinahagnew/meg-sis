function plot_SIS_avg_SISALT(dataset_root, Region, suffix, speak_dsnum, listen_dsnum)

if nargin<5
    speak_dsnum = 1;
    listen_dsnum = 2;
end

% if nargin<5
%     speak_dsnum = 2;
%     listen_dsnum = 3;
% end

%for normal trials
% meg_speak  = get_meg_and_rms([dataset_root '_0' num2str(speak_dsnum) '_' suffix '_notch-av.ds'],1,Region,2,40);
% meg_listen = get_meg_and_rms([dataset_root '_0' num2str(listen_dsnum) '_' suffix '_notch-av.ds'],1,Region,2,40);

meg_speak  = get_meg_and_rms([dataset_root '_0' num2str(speak_dsnum) '_' suffix '_notch-av.ds'],1,Region,2,40);
meg_listen = get_meg_and_rms([dataset_root '_0' num2str(listen_dsnum) '_' suffix '-f_notch-av.ds'],1,Region,2,40);


mstaxis = meg_speak.taxis.ms;
speak_rms = meg_speak.ovrms;
listen_rms = meg_listen.ovrms;
plot(mstaxis,speak_rms,'r',mstaxis,listen_rms,'b');
