function [t,y] = genSine(frequency,amplitude, time, numOfSamplesPerPeriod)
    f = frequency; % Frequency of the sine wave
    a = amplitude; % Amplitude of the sine wave
    fs = numOfSamplesPerPeriod*f; % Sampling frequency
    dt = 1/fs;
    t = 0:dt:time; % Length of time for plotting.
    y = a*sin(2*pi*f*t);
end