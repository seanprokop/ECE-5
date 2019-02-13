function plotFFT(data,maxSamplingFrequency, plottingAxis)
%Compute the Fourier Transform of X.
Y = fft(data);
L = length(data);
Fs = maxSamplingFrequency;
%Compute and plot the single sided PSD of X.
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(plottingAxis,f,P1)