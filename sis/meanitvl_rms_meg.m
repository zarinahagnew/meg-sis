function new_meg = meanitvl_rms_meg(meg,ms_itvl_lo,ms_itvl_hi,datfield2use)
% function new_meg = meanitvl_rms_meg(meg,ms_itvl_lo,ms_itvl_hi,datfield2use)

if ~isfield(meg.dat,datfield2use)
  error(sprintf('%s is not a datfield of the meg for %s', ...
		datfield2use,meg.dsname));
end

nchan = meg.chan.n;
nsamp = meg.taxis.nsamp;
nd = meg.nd;

[duh,ilo] = min(abs(meg.taxis.ms - ms_itvl_lo));
[duh,ihi] = min(abs(meg.taxis.ms - ms_itvl_hi));
itvl_idx = ilo:ihi;

if ~isfield(meg.rms,datfield2use)
  error(sprintf('%s is not a datfield of the meg.rms for %s', ...
		datfield2use,meg.dsname));
end

datrms = meg.rms.(datfield2use);
meanitvl.ms_itvl_lo = ms_itvl_lo;
meanitvl.ms_itvl_hi = ms_itvl_hi;
for i = 1:nd
  fprintf('.');
  meanitvl.val(i) = mean(datrms.overall(itvl_idx,i));
  meanitvl.sem(i) = std(datrms.overall(itvl_idx,i))/sqrt(length(itvl_idx));
end
fprintf('\n');

new_meg = meg;
new_meg.rms.(datfield2use).meanitvl = meanitvl;

