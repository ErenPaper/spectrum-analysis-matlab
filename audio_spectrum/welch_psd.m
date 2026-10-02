% WELCH_PSD  Power spectral density of an audio signal using Welch's method.
%   Averaging windowed segments gives a much smoother estimate than a single
%   FFT, which makes the signal's energy band and any narrow tonal noise
%   (a sharp spike) easy to see. Requires the Signal Processing Toolbox.

AUDIO_FILE = fullfile('..', 'data', 'music_mono.wav');
N = 512;                   % segment length / FFT size

[x, Fs] = audioread(AUDIO_FILE);
[Pxx, F] = pwelch(x, N, [], N, Fs);

figure;
plot(F / 1000, 10 * log10(Pxx));
xlabel('Frequency (kHz)');
ylabel('Power spectral density (dB/Hz)');
title('Welch PSD estimate');
