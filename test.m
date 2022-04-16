
%%
I = imread('image.jpeg');
J = rgb2gray(I);
[x,y]=size(J);
n=floor(x/16);
m=floor(y/16);
Subimages=n*m;
J=J(1:n*16,1:m*16);
X1=zeros(1,n);
Y1=zeros(1,m);
%%
for i=1:n
   X1(1,i)=16; 
end
for i=1:m
   Y1(1,i)=16; 
end
X1=uint8(X1);
Y1=uint8(Y1);

%%
% [16,16,16,16,16,16,16,16,16,16,16,16,16,16]
% H= mat2cell(J,[16,16,16,16,16,16,16,16,16,16,16,16,16,16],[16,16,16,16,16,16,16,16,16,16,16,16,16,16]);
H=mat2cell(J,X1,Y1);

%%
for i=1:length(H)
    L=H{i};
    disp('matrix')
    disp(L) 
end 