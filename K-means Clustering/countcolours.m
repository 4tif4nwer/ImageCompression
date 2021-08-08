function colcount = countcolours(X)

%COUNTCOLOURS counts the number of different colours in an image.

colcount = 0;
Allcols = zeros(256,256,256);




for i = 1:250000
    B = (X(i,:))';
    Allcols(B(1)+1,B(2)+1,B(3)+1)=1;
end

for i = 1:256
    for j = 1:256
        for k = 1:256
            if Allcols(i,j,k) == 1
                colcount = colcount+1;
            end
        end
    end
end
end

