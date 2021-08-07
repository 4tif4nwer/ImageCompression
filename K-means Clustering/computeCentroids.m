function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.


[m n] = size(X);


centroids = zeros(K, n);
centcount = zeros(K, 1);
for i = 1:m
    centroids(idx(i),:) = centroids(idx(i),:) + X(i,:);
    centcount(idx(i)) = centcount(idx(i)) + 1;
end

for i = 1:K
    centroids(i,:) = centroids(i,:)/centcount(i);
end



end

