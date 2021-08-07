function Iterations(A,max_iters,K)

%ITERATIONS run the k means algorithm



img_size = size(A);


X = reshape(A, img_size(1) * img_size(2), 3);

[m n] = size(X);

centroids = Centroids_Intialize(X, K);

idx = zeros(m, 1);



for i=1:max_iters
    
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);

    
    idx = findClosestCentroids(X, centroids);
    X_recovered = centroids(idx,:);

    % Reshape the recovered image into proper dimensions
    X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);
    

    
    
    % Given the memberships, compute new centroids
    centroids = computeCentroids(X, idx, K);


end

% Display compressed image
    
    
    filename = sprintf('Result.png') ;

    imwrite(X_recovered,filename,'png');

    g = figure;
    
    imagesc(X_recovered);
    axis square;

    %visulize Clustering in 3D
    visualize(X,idx,centroids);



end

