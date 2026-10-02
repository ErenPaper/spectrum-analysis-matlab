% IMAGE_SPECTRUM_2D  Averaged 2-D power spectrum of an image.
%   Splits the (mean-removed) image into overlapping 32x32 blocks, applies a
%   2-D Bartlett window to each, and averages the zero-padded 256x256 FFTs.
%   Periodic noise in the image shows up as isolated peaks in the result.
%
%   The block-averaging approach follows the spectral-analysis example in
%   the course textbook; this version is cleaned up and parameterised.

IMAGE_FILE = fullfile('..', 'data', 'noisy_image.tif');

BLOCK = 32;                % block size
STEP = 16;                 % block stride (50% overlap)
NFFT = 256;                % zero-padded FFT size

I = double(imread(IMAGE_FILE));
I = I - mean(I(:));

% 2-D Bartlett window = outer product of two 1-D windows
w = bartlett(BLOCK);
W = w * w';

[rows, cols] = size(I);
P = zeros(NFFT, NFFT);
nBlocks = 0;
for i = 1:STEP:(rows - BLOCK + 1)
    for j = 1:STEP:(cols - BLOCK + 1)
        blk = I(i:i+BLOCK-1, j:j+BLOCK-1) .* W;
        P = P + fftshift(fft2(blk, NFFT, NFFT));
        nBlocks = nBlocks + 1;
    end
end
Pabs = (abs(P) / nBlocks) .^ 2;

freq = (-NFFT/2 : NFFT/2 - 1) * 2 / NFFT;   % normalised frequency (-1..1)
figure;
mesh(freq, freq, Pabs / max(Pabs(:)));
xlabel('Horizontal frequency');
ylabel('Vertical frequency');
zlabel('Normalised power');
title('Averaged 2-D power spectrum');
