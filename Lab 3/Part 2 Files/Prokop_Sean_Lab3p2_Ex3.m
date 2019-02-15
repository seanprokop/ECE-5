clear; close all; clc;
img=imread('dark.jpg');

equal=histeq(img,255);
imshow(equal)

figure(1)
subplot(2,1,1)
imshow(equal)
subplot(2,1,2)
imhist(equal)


C=imadjust(img,stretchlim(img),[]);

figure(2)
subplot(2,1,1)
imshow(C)
subplot(2,1,2)
imhist(C)