% FIR_LOWPASS_AUDIO  Design a windowed-sinc low-pass FIR filter and apply it
%   to an audio file by convolution.
%
%   h[k] = wc * sinc(wc*(k - M/2)) .* hamming[k],   k = 0..M
%   where wc = 0.3 is the cutoff as a fraction of the Nyquist frequency
%   (about 6.6 kHz for 44.1 kHz audio) and M = 50 (51 taps).

AUDIO_IN = fullfile('..', 'data', 'music.wav');
AUDIO_OUT = fullfile('..', 'data', 'music_filtered.wav');

M = 50;                    % filter order (M + 1 taps)
wc = 0.3;                  % normalised cutoff

k = 0:M;
hamming_win = 0.54 - 0.46 * cos(2 * pi * k / M);
h = wc * sinc(wc * (k - M/2)) .* hamming_win;

figure;
stem(k, h);
xlabel('k'); ylabel('h[k]');
title('Hamming-windowed sinc low-pass filter (51 taps)');

[x, Fs] = audioread(AUDIO_IN);
y = conv(x(:, 1), h);      % filter the first channel

audiowrite(AUDIO_OUT, y / max(abs(y)), Fs);   % normalise to avoid clipping
fprintf('Wrote %s (%d samples @ %d Hz)\n', AUDIO_OUT, numel(y), Fs);
