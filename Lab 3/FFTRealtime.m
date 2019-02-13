clear all; close all; fclose all; delete(instrfind); clc; % Start Fresh
%% Settings
SECONDS_TO_PLOT = 10;
ARDUINO_SERIAL_PORT = '/dev/cu.usbmodem14401'; % Change this (Win: 'COM?', MAC: '/dev/cu.usbmodem?')
FFT_PLOT_DURATION = 5;
Fs = 50; % Sampling frequency is 50 Hz

%% Initialize Serial Connection and variables
arduinoSerial = serial(ARDUINO_SERIAL_PORT,'baudrate',9600,'InputBufferSize',5120); % Create Serial Object a to connect to arduino (choose com port correctly)
fopen(arduinoSerial); % Open Serial communcation
pause(1) % pause 1 second
fgetl(arduinoSerial); % Took out first line
timeArray = 0; sampleArray = 0; % Arrays to store time and sample
i = 0; % Initialize Counter
htic1 = tic; % Initialize timer

%% Setup Figure
fig1 = figure();
set(fig1, 'Units', 'normalized')
set(fig1, 'Position', [0.1,0.1,0.8,0.8])
timeDomainAxis = subplot(311); timeDomainPlot = plot(timeArray, sampleArray); title('Real Time Photoresistor Reading')
frequencyDomainAxis = subplot(312); frequencyDomainPlot = plot(0); title('20 second FFT'), xlim([0 5]) % Change xlim to zoom in
spectrogramPlot = subplot(313); title('Spectrogram'), xlabel('Time(s)'), ylabel('Frequency(Hz)')

%% Main Loop
while(ishghandle(fig1)) % loop until the figure windows is closed
    %% Read data from Serial and record
    while arduinoSerial.BytesAvailable %Read until serial is empty
        htic1 = tic;
        while toc(htic1)<0.05 % Read for 0.05 seconds before checking if serial is empty
            %% Read a line in serial and scale the numbers 
            [timestr,sensstr] = strtok(fgetl(arduinoSerial),' ');
            timeData=str2num(timestr) / 1000; sensorData=str2num(sensstr) * (5/1023);
            %% Record data into array
            i = i + 1; %Increase counter every time a sample is recorded
            timeArray(i) = timeData; sampleArray(i) = sensorData;
        end
    end

        %% Plot Time Domain
        set(timeDomainPlot,'XData',timeArray,'YData',sampleArray); xlim(timeDomainAxis,[0 timeArray(end)])
        
        %% Plot Frequency Domain for samples in recent 20s (change this in settings on top)
            %% FFT calculations
            Y = fft(sampleArray(max(1,(i-FFT_PLOT_DURATION*50)):i));
            L = length(sampleArray(max(1, (i-FFT_PLOT_DURATION*50)):i));
            P2 = abs(Y/L);
            P1 = P2(1:floor(L/2+1));
            P1(2:end-1) = 2*P1(2:end-1);
            f = Fs*(0:(L/2))/L;
        set(frequencyDomainPlot,'XData',f,'YData',P1);
        
        %% spectrogram realtime
        if(i > Fs * 5) % Only start if we have enough data (5s)
            spectrogram(sampleArray,Fs * 5,Fs * 2,i,Fs,'yaxis')
            set(spectrogramPlot, 'Ylim', [0 5]); % Zoom in
        end
    pause(0.05) % Give MATLAB time to render plot
end