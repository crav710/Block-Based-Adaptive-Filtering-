function [min, avg, max,count] = func(i,j,I)


sx=i-1;
sy=j-1;
min=1000000;
max=0;
avg=0;
diff=2;
count=0;

for x=sx:sx+diff
    for y=sy:sy+diff
        if I(x,y)==1
            count=count+1;
        end
        if (I(x,y)<min) 
         min=I(x,y);
        end
        if (I(x,y)>max)
         max=I(x,y);
        end 
        avg=avg+I(x,y);
    end
end
avg=avg-max-min;
avg=avg/7;

end

