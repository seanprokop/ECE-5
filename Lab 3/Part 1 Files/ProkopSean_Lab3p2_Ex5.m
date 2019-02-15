clear; close all; clc;

%% take that yung pic
cam=webcam(1);
img=snapshot(cam);
imwrite(img,'myfirstimage.jpg');
delete(cam);

%% resize image 
img=imresize(img,[360 640]);
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

%% black and white
x=rgb2gray(img);
bnw=uint8(zeros(360,640,3));
bnw(:,:,1)=x;
bnw(:,:,2)=x;
bnw(:,:,3)=x;

%% lower red value
R1=R.*0.2;
lessRed=cat(3,R1,G,B);

%% make image pink
R2=R.*1.7;
B2=B.*1.4;
pink=cat(3,R2,G,B2);

%% emboss and sharpen
hemboss=[-2 -1 0; -1 1 1; 0 1 2];
hsharpen=[0 -1 0; -1 5 -1; 0 -1 0];
embossed=imfilter(img,hemboss);
emb_sharp=imfilter(embossed,hsharpen);

%% noise and filter with color enhancement
noisy=imnoise(img,'gaussian',0.4);
med1=medfilt2(noisy(:,:,1));
med2=medfilt2(noisy(:,:,2));
med3=medfilt2(noisy(:,:,3));
med=cat(3,med1,med2.*1.1,med3.*1.3);

%% color thingy
adjimg=decorrstretch(imadjust(img,[0.3 0.5],[]));

%% combine em all my dude
newimg=[img; bnw; lessRed; pink; emb_sharp; med; adjimg];
imshow(newimg)
