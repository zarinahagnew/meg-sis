function meg = get_meg(dsname,itrial,chansetprefix,yes_denoise)
% function meg = get_meg(dsname,itrial,chansetprefix,yes_denoise)
% where dsname includes the '.ds', as in:
% 'SmithJohn_SPRA_20040921_01.ds'

if nargin < 4
  yes_denoise = 0;
end

meg = loadMEGchans(dsname,itrial,chansetprefix);

if yes_denoise
  idx.pre=find(meg.taxis.t<0);
  idx.post=find(meg.taxis.t>0);
end
nchan = meg.chan.n;
nsamp = meg.taxis.nsamp;
nd = meg.nd; % nd > 1 if itrial = 0 (signal to loadMEGchans() get all trials)
if itrial == 0
  for i = 1:nd
    fprintf('%d: ',i);
    chanmeans = mean(meg.dat.raw(:,:,i));
    fprintf('d');
    meg.dat.nodcoffset(:,:,i) = [eye(nsamp) -ones(nsamp,1)]*[meg.dat.raw(:,:,i);chanmeans];
    fprintf('l');
    for ich = 1:nchan
      fitcoffs = polyfit(meg.taxis.ms,meg.dat.nodcoffset(:,ich,i),1);
      ltrend = polyval(fitcoffs,meg.taxis.ms);
      meg.dat.nolintrend(:,ich,i) = meg.dat.nodcoffset(:,ich,i) - ltrend;
    end
    if yes_denoise
      meg.dat.denoised = seifa_denoise(meg.dat.nolintrend,idx);
    else
      meg.dat.denoised = meg.dat.nolintrend;
    end
    fprintf('\n');
  end
else
  chanmeans = mean(meg.dat.raw);
  meg.dat.nodcoffset = [eye(nsamp) -ones(nsamp,1)]*[meg.dat.raw;chanmeans];
  for ich = 1:nchan
    fitcoffs = polyfit(meg.taxis.ms,meg.dat.nodcoffset(:,ich),1);
    ltrend = polyval(fitcoffs,meg.taxis.ms);
    meg.dat.nolintrend(:,ich) = meg.dat.nodcoffset(:,ich) - ltrend;
  end
  if yes_denoise
    idx.pre=find(meg.taxis.t<0);
    idx.post=find(meg.taxis.t>0);
    meg.dat.denoised = seifa_denoise(meg.dat.nolintrend,idx);
  else
    meg.dat.denoised = meg.dat.nolintrend;
  end
end
