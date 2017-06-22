%function plot_SIS_avg_SISALT(dataset_root, Region, speak_dsnum, listen_dsnum)
%function plot_SIS_avg_SISALT(dataset_root, Region) %, speak_dsnum, listen_dsnum)
%function plot_SIS_z(dataset_root, Region, speak_dsnum, listen_dsnum, hzlo, hzhi)

% plot_SIS_z('/data/research_meg10/zarinah/', 'MTL', 'R1766H_SPRA_20160120_speak-f_av', 'R1766H_SPRA_20160120_listen-f-av', 4,40)
%% notes
% this is not denoised
% i manually set nchan to loadMEGchans_1 trial1 for no reason
% hacked from plot_SIS_avg_SISALT/data/research_meg10/zarinah
% have created average datesets for all conditions
% sess_speak_alignedlaugh_av.mat
% sess_speak_alignedspeak_av.mat
clear all

addpath /home/zagnew/data_analysis_code/SIS_code/
cd /Users/zagnew/emovox_sis/R2527

% set_params_general
chansetprefix = 'MLT'

dataset_root='/Users/zagnew/emovox_sis/R2527/'
speak_pre_dsnum='R2527_SPRA_20161006_speech_badex_ave'
listen_dsnum='R2527_SPRA_20161006_listen_speech_badex_ave'
Region='MLT'
dsname=speak_pre_dsnum
itrial=1
hzlo=4
hzhi=40


%% edit here
speak_meg=loadMEGchans('/Users/zagnew/emovox_sis/R2527/R2527_SPRA_20161006_speech_badex_ave.ds', 1, Region)
listen_meg=loadMEGchans('/Users/zagnew/emovox_sis/R2527/R2527_SPRA_20161006_listen_speech_badex_ave.ds', 1, Region)

speak_meg=loadMEGchans('/data/research_meg10/zarinah/sis/meg_data/R2527_LH/R2527_SPRA_20161006_laugh_badex_ave.ds', 1, Region)
listen_meg=loadMEGchans('/data/research_meg10/zarinah/sis/meg_data/R2527_LH/R2527_SPRA_20161006_listen_laugh_badex_ave.ds', 1, Region)

speak_meg=loadMEGchans('/data/research_meg10/zarinah/sis/meg_data/R2527_LH/R2527_SPRA_20161006_laugh_badex_ave.ds', 1, Region)
listen_meg=loadMEGchans('/data/research_meg10/zarinah/sis/meg_data/R2527_LH/R2527_SPRA_20161006_listen_laugh_badex_ave.ds', 1, Region)



% stealing from get_meg_and_rms now
nchan=speak_meg.chan
nsamp=speak_meg.taxis.nsamp
chanmeans = mean(speak_meg.dat.raw);

%% filter data
filtord = floor(nsamp/3) - 20;
FIRbcoff = fir1(filtord,[hzlo hzhi]/((speak_meg.fs)/2),'bandpass'); % bandpass 2 to 15 Hz
for ich = 1:nchan.n
 % speak_meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(speak_meg.dat.filtered(:,ich)));   
speak_meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(speak_meg.dat.raw(:,ich)));
listen_meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(listen_meg.dat.raw(:,ich)));
end

%% calc absolute
speak_meg.rms = abs(speak_meg.dat.filtered); % this is the default way DataEditor does it
listen_meg.rms = abs(listen_meg.dat.filtered); % this is the default way DataEditor does it

speak_meg.ovrms = sqrt(mean(speak_meg.rms.^2,2));
listen_meg.ovrms = sqrt(mean(listen_meg.rms.^2,2));

%meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
%meg.ovrms = sqrt(mean((loadMEGchans_1trialmeg.dat.rms').^2,1))';

%% plot
figure
subplot(211)
plot(speak_meg.taxis.ms,speak_meg.ovrms,'r')
hold
plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
legend('Speak','Listen')
title('speak and listen meg ovrms')
goodplot


%plot(mstaxis_pre,speak_rmmegs_pre,'r',speak_axis_post,speak_rms_post,'g',listen_axis,listen_rms,'b');
figure
subplot(211)
plot(speak_meg.taxis.ms,speak_meg.ovrms,'r')
hold
plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
legend('Speak','Listen')
title('speak and listen meg ovrms')
goodplot

subplot(212)
plot(speak_meg.taxis.ms,speak_meg.ovrms,'r')
hold
plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
legend('Speak','Listen')
title('speak and listen rms')
goodplot

subplot(213)
plot(speak_meg.taxis.ms,speak_meg.rms,'r')

% % 
% % meg
% % 
% % 
% % 
% % plot(speak_meg.taxis.ms,mean(speak_meg.dat.raw))
% % 
% % 
% % if nargin < 6
% %   yes_denoise = 0;
% % end
% % if yes_denoise
% %   idx.pre=find(speak_meg.taxis.t<0);
% %   idx.post=find(speak_meg.taxis.t>0);
% %   meg.dat.denoised = seifa_denoise(speak_meg.dat.nolintrend,idx);
% % else
% %   meg.dat.denoised = meg.dat.nolintrend;
% % end
% % 
% % filtord = floor(nsamp/3) - 20;
% % FIRbcoff = fir1(filtord,[hzlo hzhi]/((meg.fs)/2),'bandpass'); % bandpass 2 to 15 Hz
% % for ich = 1:nchan
% %   meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(meg.dat.denoised(:,ich)));
% % end
% % 
% % meg.dat.rms = abs(speak_meg.dat.filtered); % this is the default way DataEditor does it
% % %meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
% % meg.ovrms = sqrt(mean(meg.dat.rms.^2,2));
% % 
% % speak_meg_data=abs(speak_meg.dat.raw);
% % speak_meg_data_ovrms=sqrt(mean(speak_meg.dat.rms.^2,2));
% % 
% % 
% % % calc absolute
% % speak_meg.rms = abs(speak_meg.dat.filtered); % this is the default way DataEditor does it
% % %meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
% % speak_meg.ovrms = sqrt(mean(speak_meg.rms.^2,2));
% % listen_meg.rms = abs(listen_meg.dat.filtered); % this is the default way DataEditor does it
% % %meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
% % speak_meg.ovrms = sqrt(mean(speak_meg.rms.^2,2));
% % listen_meg.ovrms = sqrt(mean(listen_meg.rms.^2,2));
% % 
% % %plot(mstaxis_pre,speak_rms_pre,'r',speak_axis_post,speak_rms_post,'g',listen_axis,listen_rms,'b');
% % figure
% % subplot(211)
% % plot(speak_meg.taxis.ms,speak_meg.ovrms,'r')
% % hold
% % plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
% % legend('Speak','Listen')
% % title('speak and listen meg ovrms')
% % goodplot
% % 
% % 
% % subplot(212)
% % plot(speak_meg.taxis.ms,speak_meg.rms,'r')
% % hold
% % plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
% % legend('Speak','Listen')
% % title('speak and listen rms')
% % goodplot
% % % 
% % % 
% % 
% % 
% % 
% % 
% % 
% % plot(speak_meg.taxis.ms,mean(speak_meg.dat.raw))
% % 
% % 
% % if nargin < 6
% %   yes_denoise = 0;
% % end
% % if yes_denoise
% %   idx.pre=find(speak_meg.taxis.t<0);
% %   idx.post=find(speak_meg.taxis.t>0);
% %   meg.dat.denoised = seifa_denoise(speak_meg.dat.nolintrend,idx);
% % else
% %   meg.dat.denoised = meg.dat.nolintrend;
% % end
% % 
% % filtord = floor(nsamp/3) - 20;
% % FIRbcoff = fir1(filtord,[hzlo hzhi]/((meg.fs)/2),'bandpass'); % bandpass 2 to 15 Hz
% % for ich = 1:nchan
% %   meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(meg.dat.denoised(:,ich)));
% % end
% % 
% % meg.dat.rms = abs(speak_meg.dat.filtered); % this is the default way DataEditor does it
% % %meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
% % meg.ovrms = sqrt(mean(meg.dat.rms.^2,2));
% % 
% % speak_meg_data=abs(speak_meg.dat.raw);
% % speak_meg_data_ovrms=sqrt(mean(speak_meg.dat.rms.^2,2));
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % plot_rms('/data/research_meg10/zarinah/meg')
% % % 
% % 
% % 
% % 
% % 
% % 
% % plot(speak_meg.taxis.ms,mean(speak_meg.dat.raw))
% % 
% % 
% % if nargin < 6
% %   yes_denoise = 0;
% % end
% % if yes_denoise
% %   idx.pre=find(speak_meg.taxis.t<0);
% %   idx.post=find(speak_meg.taxis.t>0);
% %   meg.dat.denoised = seifa_denoise(speak_meg.dat.nolintrend,idx);
% % else
% %   meg.dat.denoised = meg.dat.nolintrend;
% % end
% % 
% % filtord = floor(nsamp/3) - 20;
% % FIRbcoff = fir1(filtord,[hzlo hzhi]/((meg.fs)/2),'bandpass'); % bandpass 2 to 15 Hz
% % for ich = 1:nchan
% %   meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(meg.dat.denoised(:,ich)));
% % end
% % 
% % meg.dat.rms = abs(speak_meg.dat.filtered); % this is the default way DataEditor does it
% % %meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
% % meg.ovrms = sqrt(mean(meg.dat.rms.^2,2));
% % 
% % speak_meg_data=abs(speak_meg.dat.raw);
% % speak_meg_data_ovrms=sqrt(mean(speak_meg.dat.rms.^2,2));
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % plot_rms('/data/research_meg10/zarinah/meg')
% % 
% % 
% % 
% % 
% % 
% % str_input_pre='/data/research_meg10/zarinah/R1766H_SPRA_20160120_speak-f_av.ds'
% % str_input_listen='/data/research_meg10/zarinah/R1766H_SPRA_20160120_listen-f_av.ds'
% % 
% % test=get_meg_and_rms(str_input_pre,1,Region,4,40);
% % get_meg_and_rms(str_input_pre,1,Region,4,40);
% % meg_speak_pre  = get_meg_and_rms(dsname,1,Region,4,40); 
% % meg_speak_pre=get_meg_and_rms(dsname,itrial,chansetprefix,hzlo,hzhi) 
% % meg_listen=get_meg_and_rms(dsname_listen,itrial,chansetprefix,hzlo,hzhi,yes_denoise) 
% % 
% % 
% % mstaxis_pre = meg_speak_pre.taxis.ms;
% % speak_rms_pre = meg_speak_pre.ovrms;
% % 
% % listen_rms = meg_listen.ovrms;
% % listen_axis = linspace(mstaxis_pre(1),mstaxis_pre(length(mstaxis_pre)),length(listen_rms));
% % 
% % plot(mstaxis_pre,speak_rms_pre,'r',listen_axis,listen_rms,'b');
% % legend('Speak','Listen')
% % 
% % _and_rms(dsname,itrial,chansetprefix,hzlo,hzhi) 
% % meg_listen=get_meg_and_rms(dsname_listen,itrial,chansetprefix,hzlo,hzhi,yes_denoise) 
% % 
% % 
% % mstaxis_pre = meg_speak_pre.taxis.ms;
% % speak_rms_pre = meg_speak_pre.ovrms;
% % 
% % listen_rms = meg_listen.ovrms;
% % listen_axis = linspace(mstaxis_pre(1),mstaxis_pre(length(mstaxis_pre)),length(listen_rms));
% % 
% % plot(mstaxis_pre,speak_rms_pre,'r',listen_axis,listen_rms,'b');
% % legend('Speak','Listen')
% % 
% % 
% 
% % 
% % plot_rms('/data/research_meg10/zarinah/meg')
% % 
% % 
% % 
% % 
% % 
% % str_input_pre='/data/research_meg10/zarinah/R1766H_SPRA_20160120_speak-f_av.ds'
% % str_input_listen='/data/research_meg10/zarinah/R1766H_SPRA_20160120_listen-f_av.ds'
% % 
% % test=get_meg_and_rms(str_input_pre,1,Region,4,40);
% % get_meg_and_rms(str_input_pre,1,Region,4,40);
% % meg_speak_pre  = get_meg_and_rms(dsname,1,Region,4,40); 
% % meg_speak_pre=get_meg_and_rms(dsname,itrial,chansetprefix,hzlo,hzhi) 
% % meg_listen=get_meg_and_rms(dsname_listen,itrial,chansetprefix,hzlo,hzhi,yes_denoise) 
% % 
% % 
% % mstaxis_pre = meg_speak_pre.taxis.ms;
% % speak_rms_pre = meg_speak_pre.ovrms;
% % 
% % listen_rms = meg_listen.ovrms;
% % listen_axis = linspace(mstaxis_pre(1),mstaxis_pre(length(mstaxis_pre)),length(listen_rms));
% % 
% % plot(mstaxis_pre,speak_rms_pre,'r',listen_axis,listen_rms,'b');
% % legend('Speak','Listen')
% % 
% % 
% % 
% % 
% % figure
% subplot(211)
% plot(speak_meg.taxis.ms,speak_meg.ovrms,'r')
% hold
% plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
% legend('Speak','Listen')
% title('speak and listen meg ovrms')
% goodplot
% % 
% % str_input_pre='/data/research_meg10/zarinah/R1766H_SPRA_20160120_speak-f_av.ds'
% % str_input_listen='/data/research_meg10/zarinah/R1766H_SPRA_20160120_listen-f_av.ds'
% % 
% % test=get_meg_and_rms(str_input_pre,1,Region,4,40);
% % get_meg_and_rms(str_input_pre,1,Region,4,40);
% % meg_speak_pre  = get_meg_and_rms(dsname,1,Region,4,40); 
% % meg_speak_pre=get_meg
% listen_mfigure
% subplot(211)
% plot(speak_meg.taxis.ms,speak_meg.ovrms,'r')
% hold
% plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
% legend('Speak','Listen')
% title('speak and listen meg ovrms')
% goodploteg=loadMEGchans('R1766H_SPRA_20160120_listen-f_av.ds', 1, Region)
% speak_meg=loadMEGchans('R1766H_SPRA_20160120_speak-f_av.ds', 1, Region)
% 
% % stealing from get_meg_and_rms now
% nchan=speak_meg.chan
% nsamp=speak_meg.taxis.nsamp
% chanmeans = mean(speak_meg.dat.raw);
% 
% % size(speak_meg.dat.raw)
% %  4561       x  309
% 
% %filter data
% filtord = floor(nsamp/3) - 20;
% FIRbcoff = fir1(filtord,[hzlo hzhi]/((speak_meg.fs)/2),'bandpass'); % bandpass 2 to 15 Hz
% %for ich = 1:nchan
%   ich=1
%   % speak_meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(speak_meg.dat.filtered(:,ich)));   
%   speak_meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(speak_meg.dat.raw(:,ich)));
%   listen_meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,double(listen_meg.dat.raw(:,ich)));
% 
% %end
% 
% % calc absolute
% speak_meg.rms = abs(speak_meg.dat.filtered); % this is the default way DataEditor does it
% %meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
% speak_meg.ovrms = sqrt(mean(speak_meg.rms.^2,2));
% listen_meg.rms = abs(listen_meg.dat.filtered); % this is the default way DataEditor does it
% %meg.ovrms = sqrt(mean((meg.dat.rms').^2,1))';
% speak_meg.ovrms = sqrt(mean(speak_meg.rms.^2,2));
% listen_meg.ovrms = sqrt(mean(listen_meg.rms.^2,2));
% 
% %plot(mstaxis_pre,speak_rms_pre,'r',speak_axis_post,speak_rms_post,'g',listen_axis,listen_rms,'b');
% figure
% %subplot(211)
% plot(speak_meg.taxis.ms,speak_meg.ovrms,'r', 'LineWidth', 3)
% hold
% plot(listen_meg.taxis.ms,listen_meg.ovrms,'k', 'LineWidth', 3)
% legend('Speak','Listen')
% title('speak and listen meg ovrms')
% goodplot
% axis([-500 3500 0 10e16])
% 
% 
% subplot(212)
% plot(speak_meg.taxis.ms,speak_meg.rms,'r')
% hold
% plot(listen_meg.taxis.ms,listen_meg.ovrms,'b')
% legend('Speak','Listen')
% title('speak and listen rms')
% axis([-500 3500 0 10e15])
% goodplot
