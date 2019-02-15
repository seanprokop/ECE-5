close all;
clear;
clc;

[t1,y1]=genSine(0.5, 2, 5, 10);
[t2,y2]=genSine(2, 2, 5, 10);
[t3,y3]=genSine(2, 2, 5, 5);

figure(1)
subplot(3,1,1)
plot(t1,y1)
xlabel('Time (s)');
ylabel('Amplitude');
title('0.5Hz sine wave at 10 samples/period')

subplot(3,1,2)
plot(t2,y2)
xlabel('Time (s)');
ylabel('Amplitude');
title('2Hz sine wave at 10 samples/period')

subplot(3,1,3)
plot(t3,y3)
xlabel('Time (s)')
ylabel('Amplitude')
title('2Hz sine wave at 5 samples/period')