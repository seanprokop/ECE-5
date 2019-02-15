clear; clc; close all;
A1=[255*ones(6,3) zeros(6,2) 75*ones(6,1) 238*ones(6,1)];
A2=[zeros(6,1) 165*ones(6,1) 255*ones(6,2) zeros(6,2) 130*ones(6,1)];
A3=[zeros(6,4) 255*ones(6,1) 130*ones(6,1) 238*ones(6,1)];
A(:,:,1)=A1;
A(:,:,2)=A2;
A(:,:,3)=A3;
imshow(uint8(A))
truesize(gcf,[100 100])
set (gcf, 'Units', 'normalized', 'Position', [0.1,0.1,0.7,0.7]);
