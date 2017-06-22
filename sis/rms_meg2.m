function new_meg = rms_meg2(meg,hzlo,hzhi,datfield2use)
% function new_meg = rms_meg2(meg,hzlo,hzhi,datfield2use)

if ~isfield(meg.dat,datfield2use)
  error(sprintf('%s is not a datfield of the meg for %s', ...
		datfield2use,meg.dsname));
end

datrms.hzlo = hzlo;
datrms.hzhi = hzhi;

nchan = meg.chan.n;
nsamp = meg.taxis.nsamp;

filtord = floor(nsamp/3) - 20;
FIRbcoff = fir1(filtord,[hzlo hzhi]/((meg.fs)/2),'bandpass'); % bandpass 2 to 15 Hz
nd = meg.nd;
for i = 1:nd
  fprintf('%d: ',i);
  fprintf('f');
  for ich = 1:nchan
    datfiltered(:,ich) = filtfilt(FIRbcoff,1,squeeze(meg.dat.(datfield2use)(:,ich,i)));
  end
  fprintf('r');
  datrms.dat(:,:,i) = abs(datfiltered); % this is the default way DataEditor does it
  datrms.overall(:,i) = sqrt(mean((squeeze(datrms.dat(:,:,i))').^2))';
  fprintf('\n');
end

new_meg = meg;
if isfield(new_meg,'rms')
  new_meg.rms.(datfield2use) = datrms;
else
  rms.(datfield2use) = datrms;
  new_meg.rms = rms;
end
