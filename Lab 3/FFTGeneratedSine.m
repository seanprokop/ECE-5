clear; close all; clc; %clear previous data, command window, and all open plots
%% Generate sine waves (make sampling frequency consistent!)
[t1,y1] = genSine(1000,1,2/1000,50); %Generate Sine Wave at 1kHz
[t2,y2] = genSine(2000,0.7,2/1000,25);  %Generate Sine Wave at 2kHz
[t3,y3] = genSine(5000,0.3,2/1000,10);  %Generate Sine Wave at 5kHz

%% Combining the two signals
minLength = min([length(y1),length(y2),length(y3)]);
y = y1(1:minLength) + y2(1:minLength) + y3(1:minLength); % Trim the longer signals to match signal length

%% Plot
fig1 = figure();
set(fig1, 'Units', 'normalized')
set(fig1, 'Position', [0.1,0.1,0.8,0.8])
hold on;
    %% 1kHz Sine Time Domain
    subplot(421)
    plot(t1,y1)
    title('1kHz Sine Time Domain'), ylim([-1,1])
    %% 1kHz Sine Frequency Domain
    fft1 = subplot(422);
    plotFFT(y1, 50000, fft1)
    title('1kHz Sine Frequency Domain'), ylim([0,1])
    %% 2kHz Sine Time Domain
    subplot(423)
    plot(t2,y2)
    title('2kHz Sine Wave Time Domain'), ylim([-1,1])
    %% 2kHz Sine Frequency Domain
    fft2 = subplot(424);
    plotFFT(y2, 50000, fft2)
    title('2kHz Sine Frequency Domain'), ylim([0,1])
    %% 5kHz Sine Time Domain
    subplot(425)
    plot(t3,y3)
    title('5kHz Sine Wave Time Domain'), ylim([-1,1])
    %% 5kHz Sine Frequency Domain
    fft3 = subplot(426);
    plotFFT(y3, 50000, fft3)
    title('5kHz Sine Frequency Domain'), ylim([0,1])
    %% Combined Sine Time Domain
    subplot(427)
    plot(y)
    title('Combined Wave')
    %% Combined Sine Frequency Domain
    fft4 = subplot(428);
    plotFFT(y, 50000, fft4)
    title('Combined Sine Wave')