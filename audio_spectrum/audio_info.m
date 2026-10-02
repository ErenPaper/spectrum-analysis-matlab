% AUDIO_INFO  Basic properties of a mono audio file.
%   Set AUDIO_FILE to a mono .wav in data/ (see data/README.md).

AUDIO_FILE = fullfile('..', 'data', 'music_mono.wav');

[x, Fs] = audioread(AUDIO_FILE);

duration_s = size(x, 1) / Fs;
bitrate = Fs * 8;          % bits/s at 8 bits per sample

fprintf('Sample rate : %d Hz\n', Fs);
fprintf('Duration    : %.2f s\n', duration_s);
fprintf('Bitrate     : %d bit/s (8-bit samples)\n', bitrate);
