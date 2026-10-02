% CONVOLUTION_DEMO  Discrete convolution of two short sequences.
%   x[k] = k for k = 0..4 and h[k] = 2 - k for k = 0..3, then y = x * h.

k_x = 0:4;
x = k_x;

k_h = 0:3;
h = 2 - k_h;

y = conv(x, h);
k_y = 0:(length(y) - 1);

figure;
subplot(3, 1, 1); stem(k_x, x); xlabel('k'); ylabel('x[k]'); title('x[k]');
subplot(3, 1, 2); stem(k_h, h); xlabel('k'); ylabel('h[k]'); title('h[k]');
subplot(3, 1, 3); stem(k_y, y); xlabel('k'); ylabel('y[k]'); title('Convolution of x[k] and h[k]');
