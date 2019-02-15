clear; close all; clc;
img=imread('test.jpg');
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);
a=zeros(size(img,1), size(img,2));
red=cat(3,R,a,a);
green=cat(3,a,G,a);
blue=cat(3,a,a,B);
new_G=0.2.*G;
new_G1=cat(3,a,0.2.*G,a);

figure(1)
new_img=cat(3,R,new_G,B);
subplot(1,2,1)
imshow(new_img)
subplot(1,2,2)
imshow(new_G1)

figure(2)
subplot(1,2,1)
imshow(img)
subplot(1,2,2)
imshow(new_img)

figure(3)
teeth=imread('stained_teeth.jpg');
R=teeth(:,:,1);
G=teeth(:,:,2);
B=teeth(:,:,3);
B_new=1.4.*B;
teeth_new=cat(3,R,G,B_new);
subplot(1,2,1)
imshow(teeth)
subplot(1,2,2)
imshow(teeth_new)

figure(4)
B_new1=2.*B;
B_new2=1.25.*B;
teeth_new1=cat(3,R,G,B_new1);
teeth_new2=cat(3,R,G,B_new2);
subplot(1,2,1)
imshow(teeth_new1)
subplot(1,2,2)
imshow(teeth_new2)