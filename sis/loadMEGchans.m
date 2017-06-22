function meg = loadMEGchans(dsname,itrial,chansetprefix,exclude_badchans)
% function meg = loadMEGchans(dsname,itrial,chansetprefix,[exclude_badchans])
% where dsname includes the '.ds', as in:
% 'WilkinsonBill_SPRA_20040921_01.ds'
% optional input arg 'exclude_badchans' (default 1), can be set to 0 to
% turn off the exclusion of bad channels

if nargin < 4
  exclude_badchans = 1;
end

ctf = ctf_read_res4(dsname,0,0);
chan_names = get_ctf_chan_names(ctf);
meg_badchan_idxes = [];
if exclude_badchans
  badchanfile = sprintf('%s/BadChannels',dsname);
  fd = fopen(badchanfile,'r');
  while 1
    badchan_name = fgetl(fd);
    if ~ischar(badchan_name), break, end
    meg_badchan_idxes = [meg_badchan_idxes strmatch(badchan_name,chan_names)];
  end
  fclose(fd);
end

% if blah

pre_meg_chan_idxes = strmatch(chansetprefix,chan_names);

%% ZED add a thing in here to alow for chan number with number instead of by label

meg_chan_idxes = setdiff(pre_meg_chan_idxes,meg_badchan_idxes);
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
ctfdata = double(ctf.data);
if itrial ~= 0
  meg.dat.raw = squeeze(ctfdata(:,:,itrial))*10^15; % data in femtoTesla (fT)
else
  meg.dat.raw = ctfdata(:,:,:)*10^15; % data in femtoTesla (fT)
end
