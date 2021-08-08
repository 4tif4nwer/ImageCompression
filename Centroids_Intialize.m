function centroids = Centroids_Intialize(X, K)
%Centroids_Initialize This function initializes K centroids that are to be used in K-Means on the dataset X

% Initialize the centroids to be random examples

%Randomly reorder the indicies of examples
rng shuffle;
randidx = randperm(size(X,1));
% Take the first K examples
centroids = X(randidx(1:K),:);


end

