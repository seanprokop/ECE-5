clear
close all
clc

f=1000;
a=0.5;
fs=3*f;
dt=1/fs;
t=0:dt:0.005;

y=a*sin(2*pi*f*t);
figure(1)
subplot(3,1,1)
plot(t,y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sine wave f=1000Hz, fs=3000Hz')

fs=5*f;
dt=1/fs;
t=0:dt:0.005;
y=a*sin(2*pi*f*t);
subplot(3,1,2)
plot(t,y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sine wave f=1000Hz, fs=5000Hz')

fs=10*f;
dt=1/fs;
t=0:dt:0.005;
y=a*sin(2*pi*f*t);
subplot(3,1,3)
plot(t,y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sine wave f=1000Hz, fs=10000Hz')

%z=a*cos(2*pi*f*t);
%hold on
%plot(t,z)
%legend('Sine','Cosine')