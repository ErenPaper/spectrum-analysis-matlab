# Input data

The scripts read their inputs from this folder. The media files are **not**
included in the repo (they came from coursework and are not mine to
redistribute), so supply your own:

| File | Used by | What to use |
|---|---|---|
| `music_mono.wav` | `audio_spectrum/audio_info.m`, `fft_magnitude.m`, `welch_psd.m` | any mono WAV; a clip with a narrow tonal hum makes the Welch PSD more interesting |
| `noisy_image.tif` | `audio_spectrum/image_spectrum_2d.m` | a grayscale image at least 32x32; add a sinusoidal pattern to see periodic-noise peaks |
| `music.wav` | `fir_and_sampling/fir_lowpass_audio.m` | any WAV (first channel is filtered) |
| `detailed_image.jpg` | `fir_and_sampling/image_resize_aliasing.m` | an image with fine stripes or texture, which shows aliasing best |
