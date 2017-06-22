%% SIS
cd /Users/zagnew/emovox_sis/R2774A_BURsar_w_megan

%% to get sensor names
channels=ctf_read_res4('R2447A_SPRA_20160404_averagedisgust_speakaligned.ds',0,0)
channels.sensor.index
channels.sensor.index.meg_left_temporal
channels.sensor.index.meg_right_temporal
channels.sensor.index.meg_temporal

dsname='R2447A_SPRA_20160404_02_singletrial.ds'
itrial=1
chansetprefix='MLT'
chansetprefix=channels.sensor.index.meg_left_temporal
meg_chan_idxes=channels.sensor.index.meg_left_temporal
% chan_names=get_ctf_chan_names(channels)
% ctf = ctf_read_res4(dsname,0,0);
% chan_names = get_ctf_chan_names(ctf);
% meg_chan_idxes = strmatch(chansetprefix,chan_names);
% ctf = ctf_read_meg4(dsname,ctf,meg_chan_idxes);
% get_meg('R2447A_SPRA_20160404_02_singletrial.ds', :, 'MLT')
% get_meg('R2447A_SPRA_20160404_02_singletrial.ds', :, 'MRT')

%% from get_meg
ctf = ctf_read_res4(dsname,0,0);
chan_names = get_ctf_chan_names(ctf);
%meg_chan_idxes = strmatch(chansetprefix,chan_names);
%meg_chan_idxes = strncmp(chansetprefix,chan_names);
ctf = ctf_read_meg4(dsname,ctf,meg_chan_idxes);

meg.dsname = dsname;
meg.itrial = itrial;
meg.fs = ctf.setup.sample_rate;
meg.nd = ctf.setup.number_trials;
meg.chan.idx = meg_chan_idxes;
meg.chan.prefix = chansetprefix;
meg.chan.name = chan_names(meg_chan_idxes);
meg.chan.n = length(meg_chan_idxes);

meg.taxis.t = ctf.setup.time_sec;
meg.taxis.ms = ctf.setup.time_msec;
meg.taxis.nsamp = length(ctf.setup.time_msec);
if itrial ~= 0
  meg.dat.raw = squeeze(ctf.data(:,:,itrial))*10^15; % data in femtoTesla (fT)
else
  meg.dat.raw = ctf.data(:,:,:)*10^15; % data in femtoTesla (fT)
end

nchan = meg.chan.n;
nsamp = meg.taxis.nsamp;
chanmeans = mean(meg.dat.raw);
meg.dat.nodcoffset = [eye(nsamp) -ones(nsamp,1)]*[meg.dat.raw;chanmeans];

%% get's heavy here

for ich = 1:nchan
  fitcoffs = polyfit(meg.taxis.ms,meg.dat.nodcoffset(:,ich),1);
  ltrend = polyval(fitcoffs,meg.taxis.ms);
  meg.dat.nolintrend(:,ich) = meg.dat.nodcoffset(:,ich) - ltrend;
end

if nargin < 6
  yes_denoise = 0;
end
if yes_denoise
  idx.pre=find(meg.taxis.t<0);
  idx.post=find(meg.taxis.t>0);
  meg.dat.denoised = seifa_denoise(meg.dat.nolintrend,idx);
else
  meg.dat.denoised = meg.dat.nolintrend;
end

filtord = floor(nsamp/3) - 20;
FIRbcoff = fir1(filtord,[hzlo hzhi]/((meg.fs)/2),'bandpass'); % bandpass 2 to 15 Hz
for ich = 1:nchan
  meg.dat.filtered(:,ich) = filtfilt(FIRbcoff,1,meg.dat.denoised(:,ich));
end

meg.dat.rms = abs(meg.dat.filtered); % this is the default way DataEditor does it
meg.ovrms = sqrt(mean((meg.dat.rms').^2))';
% sget_meg_and_rms('R2447A_SPRA_20160404_averagespeech_speakaligned.ds', 1,'MLT',2,40);

%% plot_SIS
%function plot_SIS_avg_SISALT(dataset_root, Region, suffix, speak_dsnum, listen_dsnum)

speak_dsnum='R2447A_SPRA_20160404_averagedisgust_speakaligned.ds'
listen_dsnum = 'R2447A_SPRA_20160404_averagedisgust_speakaligned.ds'
% 
% 
% if nargin<5
%     speak_dsnum = 1;
%     listen_dsnum = 2;
% end

% if nargin<5
%     speak_dsnum = 2;
%     listen_dsnum = 3;
% end

%for normal trials
% meg_speak  = get_meg_and_rms([dataset_root '_0' num2str(speak_dsnum) '_' suffix '_notch-av.ds'],1,Region,2,40);
% meg_listen = get_meg_and_rms([dataset_root '_0' num2str(listen_dsnum) '_' suffix '_notch-av.ds'],1,Region,2,40);

% meg_speak  = get_meg_and_rms([dataset_root '_0' num2str(speak_dsnum) '_' suffix '_notch-av.ds'],1,Region,2,40);
% meg_listen = get_meg_and_rms([dataset_root '_0' num2str(listen_dsnum) '_' suffix '-f_notch-av.ds'],1,Region,2,40);
meg_speak  = get_meg_and_rms('R2447A_SPRA_20160404_averagedisgust_speakaligned.ds',1,Region,2,40);
meg_listen = get_meg_and_rms('R2447A_SPRA_20160404_averagedisgust_speakaligned.ds',1,Region,2,40);
mstaxis = meg_speak.taxis.ms;
speak_rms = meg_speak.ovrms;
listen_rms = meg_listen.ovrms;
plot(mstaxis,speak_rms,'r',mstaxis,listen_rms,'b');




