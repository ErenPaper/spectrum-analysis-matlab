% IMAGE_RESIZE_ALIASING  Downsampling an image with and without
%   anti-aliasing.
%
%   Nearest-neighbour downsampling discards samples without band-limiting
%   first, so fine detail (e.g. fabric stripes) aliases into false
%   patterns. Low-pass filtering before resizing removes the aliasing at the
%   cost of some sharpness. Requires the Image Processing Toolbox.

IMAGE_FILE = fullfile('..', 'data', 'detailed_image.jpg');
scales = [0.9 0.7 0.5];

I = imread(IMAGE_FILE);

% 3x3 box filter applied before resizing
box = fspecial('average', [3 3]);
I_lpf = imfilter(I, box, 'conv');

figure; imshow(I); title('Original');

for s = scales
    figure;
    tiledlayout(1, 3);
    nexttile; imshow(imresize(I, s, 'nearest'));
    title(sprintf('Nearest, %.0f%%', s * 100));
    nexttile; imshow(imresize(I_lpf, s, 'nearest'));
    title(sprintf('3x3 box LPF then nearest, %.0f%%', s * 100));
    nexttile; imshow(imresize(I, s, 'Antialiasing', true));
    title(sprintf('Built-in antialiasing, %.0f%%', s * 100));
end
