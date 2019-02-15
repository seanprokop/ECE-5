clear; close all; clc;

figure(1)
A=[255 0 255 0 255 0; 0 255 0 255 0 255];
A(3,:)=A(1,:);
A(4,:)=A(2,:);
A(5,:)=A(1,:);
A(6,:)=A(2,:);
imshow(uint8(A));
truesize(gcf, [100 100]);
set(gcf, 'Units', 'normalized', 'Position', [0.1,0.1,0.7,0.7]);

figure(2)
B1=[255*ones(6,3) zeros(6,2) 75*ones(6,1) 238*ones(6,1)];
B2=[zeros(6,1) 165*ones(6,1) 255*ones(6,2) zeros(6,2) 130*ones(6,1)];
B3=[zeros(6,4) 255*ones(6,1) 130*ones(6,1) 238*ones(6,1)];
B(:,:,1)=B1;
B(:,:,2)=B2;
B(:,:,3)=B3;
imshow(uint8(B))
truesize(gcf,[100 100])
set (gcf, 'Units', 'normalized', 'Position', [0.1,0.1,0.7,0.7]);
