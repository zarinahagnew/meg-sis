function meg = get_meg_and_rms(dsname,itrial,chansetprefix,hzlo,hzhi,yes_denoise)
% function meg = get_meg_and_rms(dsname,itrial,chansetprefix,hzlo,hzhi,yes_denoise)
% where dsname includes the '.ds', as in:
% 'SmithJohn_SPRA_20040921_01.ds'

meg = loadMEGchans(dsname,itrial,chansetprefix);
meg.dsname = dsname;

nchan = meg.chan.n;
nsamp = meg.taxis.nsamp;

chanmeans = mean(meg.dat.raw);
meg.dat.nodcoffset = [eye(nsamp) -ones(nsamp,1)]*[meg.dat.raw;chanmeans];


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
