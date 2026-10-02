% FFT_MAGNITUDE  Magnitude spectrum of an audio signal via the FFT.
%   Plots the one-sided spectrum on a linear scale and in dB, with the
%   frequency axis scaled to kHz from the bin index: f_m = m*Fs/N.

AUDIO_FILE = fullfile('..', 'data', 'music_mono.wav');

[x, Fs] = audioread(AUDIO_FILE);
N = size(x, 1);
X = fft(x);

% One-sided spectrum (bins 0..N/2), scaled by 1/sqrt(N)
m = 0:(N/2);
f_khz = (m * Fs / N) / 1000;
Xs = X(1:N/2 + 1) / sqrt(N);

figure;
plot(f_khz, abs(Xs));
xlabel('Frequency (kHz)');
ylabel('Magnitude');
title('Magnitude spectrum');

figure;
plot(f_khz, 20 * log10(abs(Xs)));
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
title('Magnitude spectrum (dB)');
