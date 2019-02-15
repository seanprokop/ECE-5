close all; clear; clc;
img=imread('Penguin.jpg');
figure(1)
subplot(2,1,1)
imshow(img)
subplot(2,1,2)
imhist(img)

median=medfilt2(img);
figure(2)
subplot(2,1,1)
imshow(median)
subplot(2,1,2)
imhist(median)

h=fspecial('average');
mean=imfilter(median,h);
figure(3)
subplot(2,1,1)
imshow(mean)
subplot(2,1,2)
imhist(mean)