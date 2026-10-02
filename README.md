# Spectrum Analysis & Filtering (MATLAB)

MATLAB scripts for spectral analysis and digital filtering: FFT magnitude
spectra, Welch PSD estimation, 2-D image spectra, windowed-sinc FIR design,
and sampling/aliasing experiments.

**Stack:** MATLAB · Signal Processing Toolbox · Image Processing Toolbox

> Based on ECE 340 (Signals and Systems), University of Alberta. Scripts are
> cleaned-up, parameterised versions of my lab work.

## Layout

### `audio_spectrum/`
- `audio_info.m` — sample rate, duration and bitrate of an audio file.
- `fft_magnitude.m` — one-sided FFT magnitude spectrum (linear and dB) with the
  frequency axis computed from the bin index (`f = m*Fs/N`).
- `welch_psd.m` — Welch PSD (`pwelch`) to find the signal's energy band and spot
  narrow tonal noise.
- `image_spectrum_2d.m` — block-averaged, Bartlett-windowed 2-D power spectrum
  of an image; periodic noise appears as isolated peaks.

### `fir_and_sampling/`
- `convolution_demo.m` — discrete convolution of two short sequences.
- `fir_lowpass_audio.m` — 51-tap Hamming-windowed sinc low-pass filter applied
  to audio by convolution.
- `aliasing_demo.m` — a 10 Hz and a 90 Hz cosine sampled at 100 Hz (the 90 Hz
  tone aliases onto 10 Hz) and at 1 kHz.
- `image_resize_aliasing.m` — image downsampling with and without anti-aliasing.

## Running
The scripts load their inputs from `data/`, which is empty because the original
media came from coursework. See [`data/README.md`](data/README.md) for what to
drop in, then run a script from inside its own folder (paths are relative).

## Notes
- The scripts were reorganised after the original labs and have not been re-run
  on a fresh MATLAB install. Expect to adjust file names for your own data.
- An early version of `fft_magnitude.m` computed dB with `20*log(...)`
  (natural log); it now uses `20*log10(...)`.
- `image_spectrum_2d.m` follows the block-averaging example from the course
  textbook.

## License
MIT. See [LICENSE](LICENSE).
