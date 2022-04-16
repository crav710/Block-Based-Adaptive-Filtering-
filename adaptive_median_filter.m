
I = imread('pattern_noisy_002.tif');
J=padarray(I,[4,4]);
[x,y] = size(J);

%%
min1=zeros(x,y);
max1=zeros(x,y);
avg1=zeros(x,y);
noisy=zeros(x,y);
Td=250;
z=0;
for i=5:x-4
    for j=5:y-4
        X=J(i-1:i-1+2,j-1:j-1+2);
        stdv=std(double(X(:)));
        Td=2.5*stdv;
        [min, avg, max,count]=func(i,j,J);
        min1(i,j)=min;
        max1(i,j)=max;
        avg1(i,j)=avg;
        Noise = (J(i,j)-avg>=Td)&((abs(max-J(i,j))>=Td)|(abs(J(i,j)-min))>=Td);
        z=z+Noise;
        if Noise==0
            noisy(i,j)=0;   
        else
            noisy(i,j)=1;
        end
        
    end
end
% disp(sum(noisy));
disp (z)
%%
window=zeros(x,y);
for i=5:x-4
    for j=5:y-4
         
        [max,min,avg,count]=func(i,j,noisy);
        window(i,j)=count;
        
    end
    
end
%%

for i=5:x-4
    for j=5:y-4
        if window(i,j)<1
            window(i,j)=3;
        elseif window(i,j)<3 && window(i,j)>=1
            window(i,j)=3;
        elseif window(i,j)<5 && window(i,j)>=3
            window(i,j)=5;
        elseif window(i,j)<7 && window(i,j)>=5 
            window(i,j)=7;
        else 
            window(i,j)=9;
        end
        
    end
end


%%

for i=5:x-4
    for j=5:y-4
      %  if noisy(i,j)==1
            len=window(i,j);
            len=floor(len/2);
            temp_I=J(i-len:i+len,j-len:j+len);
            med=median(temp_I(:));
            J(i,j)=med;
       % end
    end
end

%%

h = figure;
set( h, 'Name', [ mfilename, '_plot' ] );
subplot( 1, 2, 1 );
imshow( I, [  ] );
subplot( 1, 2, 2 );
imshow( J(5:x-4,5:y-4), [  ] );

%%

