function visualize(X,idx,centroids)


%VISUALIZE 3D scatter plots of pixels and their clustering

f = figure;
hold on;
subplot(1,2,1);
scatter3(X(:,1),X(:,2),X(:,3),0.5,X);
subplot(1,2,2);
scatter3(X(:,1),X(:,2),X(:,3),0.5,centroids(idx,:));
hold off;


end

