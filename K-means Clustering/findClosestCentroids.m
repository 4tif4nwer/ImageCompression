function idx = findClosestCentroids(X, centroids)
    
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example


K = size(centroids, 1);

idx = zeros(size(X,1), 1);
B = zeros(1,2);



for i = 1:length(idx)
    minj = zeros(K,1);
    for j = 1:K
        B =X(i,:)-centroids(j,:);
        B = B.*B;
        minj(j) = sum(B,'all');
    end
    [~,idx(i)] = min(minj);
end


end

