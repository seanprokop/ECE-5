clear all; close all; fclose all; delete(instrfind); clc; % Start Fresh
%% Settings
SECONDS_TO_PLOT = 10;
ARDUINO_SERIAL_PORT = '/dev/cu.usbmodem14401'; % Change this (Win: 'COM?', MAC: '/dev/cu.usbmodem?')

%% Initialize Serial Connection and variables
arduinoSerial = serial(ARDUINO_SERIAL_PORT,'baudrate',9600,'InputBufferSize',5120); % Create Serial Object a to connect to arduino (choose com port correctly)
fopen(arduinoSerial); % Open Serial communcation
pause(1) % pause 1 second
fgetl(arduinoSerial); % Took out first line
sample_50hz=0;time_50hz=0;sample_10hz=0;time_10hz=0;sample_5hz=0;time_5hz=0;sample_1hz=0;time_1hz=0; % Arrays to store time and sample
counter_50hz=0; counter_10hz=0; counter_5hz=0; counter_1hz=0; % Arrays to store index

%% Setup figure to plot
fig1 = figure();
set(fig1,'Units','normalized')
set(fig1,'Position',[0.1,0.1,0.8,0.8])
axis_50hz=subplot(411);plot_50hz=plot(time_50hz,sample_50hz,'-o','linewidth',2);title('Photoresistor Sampled at 50Hz'),xlabel('Time(s)'),ylabel('Voltage(v)');
axis_10hz=subplot(412);plot_10hz=plot(time_10hz,sample_10hz,'-o','linewidth',2);title('Photoresistor Sampled at 10Hz'),xlabel('Time(s)'),ylabel('Voltage(v)');
axis_5hz=subplot(413);plot_5hz=plot(time_5hz,sample_5hz,'-o','linewidth',2);title('Photoresistor Sampled at 5Hz'),xlabel('Time(s)'),ylabel('Voltage(v)');
axis_1hz=subplot(414);plot_1hz=plot(time_1hz,sample_10hz,'-o','linewidth',2);title('Photoresistor Sampled at 1Hz'),xlabel('Time(s)'),ylabel('Voltage(v)');

%% Main Loop
while ishghandle(fig1) % loop until the figure windows is closed
    %% Read data from Serial and record
    while arduinoSerial.BytesAvailable %Read until serial is empty
        htic1 = tic;
        while toc(htic1)<0.05 % Read for 0.05 seconds before checking if serial is empty
            %% Read a line in serial and scale the numbers 
            counter_50hz = counter_50hz + 1;
            [timestr,sensstr] = strtok(fgetl(arduinoSerial),' ');
            timeData=str2num(timestr) / 1000; sensorData=str2num(sensstr) * (5/1023);
                %% Record data into array of different frequencies
                time_50hz(counter_50hz) = timeData; sample_50hz(counter_50hz) = sensorData;
                if(~mod(counter_50hz-1,5)) % Once per 5 loops (50Hz / 5 = 10Hz), record data at 10Hz into sample_10Hz
                    counter_10hz = counter_10hz + 1;
                    time_10hz(counter_10hz) = timeData; sample_10hz(counter_10hz) = sensorData;
                end
                if(~mod(counter_50hz-1,10)) % Once per 10 loops (50Hz / 10 = 5Hz), record data at 5Hz into sample_5Hz
                    counter_5hz = counter_5hz + 1;
                    time_5hz(counter_5hz) = timeData; sample_5hz(counter_5hz) = sensorData;
                end
                if(~mod(counter_50hz-1,50)) % Once per 50 loops (50Hz / 50 = 1Hz), record data at 1Hz into sample_1Hz
                    counter_1hz = counter_1hz + 1;
                    time_1hz(counter_1hz) = timeData; sample_1hz(counter_1hz) = sensorData;
                end
            
        end
    end
    %% Update Plot
    updatedXlim = [time_50hz(max(1,counter_50hz-50*SECONDS_TO_PLOT)),time_50hz(counter_50hz)+0.001];
    set(plot_50hz,'XData',time_50hz,'YData',sample_50hz); xlim(axis_50hz,updatedXlim);
    set(plot_10hz,'XData',time_10hz,'YData',sample_10hz); xlim(axis_10hz,updatedXlim);
    set(plot_5hz,'XData',time_5hz,'YData',sample_5hz); xlim(axis_5hz,updatedXlim);
    set(plot_1hz,'XData',time_1hz,'YData',sample_1hz); xlim(axis_1hz,updatedXlim);
    pause(0.05) % Give MATLAB time to render plot
end

delete(arduinoSerial); % Closes Arduino Serial connection