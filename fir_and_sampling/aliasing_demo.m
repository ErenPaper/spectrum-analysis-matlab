% ALIASING_DEMO  Two cosines sampled at 100 Hz and 1000 Hz.
%   cos(20*pi*t) is a 10 Hz tone and cos(180*pi*t) is a 90 Hz tone. At
%   fs = 100 Hz the 90 Hz tone is undersampled and aliases onto 10 Hz
%   (|90 - 100| = 10), so both sampled sequences are identical. At
%   fs = 1000 Hz they are clearly different.

fs_low = 100;
fs_high = 1000;

k_low = 0:30;
k_high = 0:300;

y1 = cos(20  * pi * k_low  / fs_low);    % 10 Hz @ 100 Hz
y2 = cos(180 * pi * k_low  / fs_low);    % 90 Hz @ 100 Hz  (aliases to 10 Hz)
z1 = cos(20  * pi * k_high / fs_high);   % 10 Hz @ 1 kHz
z2 = cos(180 * pi * k_high / fs_high);   % 90 Hz @ 1 kHz

t_low = k_low / fs_low;
t_high = k_high / fs_high;

figure;
tiledlayout(6, 1);

nexttile; stem(t_low,  y1); title('y1: 10 Hz sampled at 100 Hz');  xlabel('t (s)');
nexttile; stem(t_low,  y2); title('y2: 90 Hz sampled at 100 Hz');  xlabel('t (s)');
nexttile; stem(t_high, z1); title('z1: 10 Hz sampled at 1 kHz');   xlabel('t (s)');
nexttile; stem(t_high, z2); title('z2: 90 Hz sampled at 1 kHz');   xlabel('t (s)');

nexttile;
plot(t_high, z1, 'r-', t_low, y1, 'b+');
title('z1 vs y1'); xlabel('t (s)'); legend('z1', 'y1');

nexttile;
plot(t_high, z2, 'r-', t_low, y2, 'b+');
title('z2 vs y2 (y2 is aliased)'); xlabel('t (s)'); legend('z2', 'y2');
