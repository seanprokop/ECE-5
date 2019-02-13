clear all; close all; fclose all; delete(instrfind); clc; % Start Fresh
PLOTTING_LENGTH = 10; % Change this to adjust max seconds to show on plot
Fs = 50; % Arduino Sampling Frequency

%% Connect to Arduino through Serial
ARDUINO_SERIAL_PORT = '/dev/cu.usbmodem14401'; % Change this (Win: 'COM?', MAC: '/dev/cu.usbmodem?') 
arduinoSerial = serial(ARDUINO_SERIAL_PORT,'baudrate',9600,'InputBufferSize',5120); % Create Serial Object a to connect to arduino (choose com port correctly)
fopen(arduinoSerial); % Open Serial communcation
pause(1) % Wait data on Serial
fgetl(arduinoSerial); % Take out broken first line in serial
%% Initialize Plotting axis
fig1 = figure();
set(fig1,'Units','normalized')
set(fig1,'Position',[0.1,0.1,0.8,0.8])
ii = 0; % Initialize counter

%% Main Loop
while ishghandle(fig1)
    while arduinoSerial.BytesAvailable %Read until serial is empty
        htic1 = tic;
        while toc(htic1)<0.05 %Read for 0.05 seconds before checking if serial is empty
            %% Read a line in serial and put data into arrays
            ii = ii + 1;
            [timestr,sensstr] = strtok(fgetl(arduinoSerial),' ');
            time(ii) = str2num(timestr) / 1000;
            sens(ii) = str2num(sensstr);
        end
    end
    %% Update plot
    cla() % Clear previous plot
    plot(time,sens,'-o','linewidth',2), xlabel('Time [s]'), ylabel('Photoresistor Reading [V]'), title('Photoresistor Sampled at 50kHz')
    xlim([time(max(1,ii-Fs*PLOTTING_LENGTH)),time(ii)+0.001]) % Adjust x-axis range to show max 10 seconds of data (can be changed on top)
    pause(0.05) % Give MATLAB time to render plot
end
delete(arduinoSerial) % Close serial connection