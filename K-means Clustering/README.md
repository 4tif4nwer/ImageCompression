# Image Compression with K - Means Clustering

## Clustering
 
Clustering is an unsupervised learning problem where we are given a set of data points that have to be partitioned into a given number of groups or clusters.

## K - Means Clustering

K - means clustering aims to partition a set of $N$ vectors/obserations into $K$ clusters with each observation belonging to a cluster with the nearest centroid. Centroid of a cluster is the mean of all vectors/observations belonging to that cluster. Mathematically, let the given N observations be vectors $(x_1,x_2,...x_N)$ of dimension(features) $D$. Let $C_1, C_2, C_3...C_K $ be $K$ clusters.Let $\mu_1,\mu_2,...\mu_K$ be the mean of vectors contained in the clusters $C_1,C_2,...C_K$ respectively. The K - means clustering aims find

#####  \[ min\sum_{i=1}^{K}\sum_{x\in C_i}||x-\mu_i||^2 \]  

## The Standard Algorithm

This algorithm begins with initializing the $K$ centroids as randomly chosen points in the given data set. A certain number of iterations are then run in which, the points in the data set are labelled with the closest of the $K$ centroids and the centroids are updated with the mean of all data points with the same labelling. After the iterations, the centroid closest to a point in the data set marks the cluster in with it belongs.

## Image Compression
### Pixels of an Image

In a standard $24$-bit colour representation of an image, each pixel is represented by three $8$ bit unsigned integers(ranging from $0$ to $255$) that specify the red, green and blue(RGB) intensiy values. 

### Clustering of Pixels

Given an image with thousands of different colours, consider each pixel as a three dimensional vector of its RGB values. If these pixels are K-means clustered into say $16$ clusters using the above algorithm and changing the colour of each pixel to the colour represented by the centroid of the cluster to which it belongs, the number of colours in the image can be reduced to $16$. Doing so, reduces/compresses the file size by about $6$ times as now we have to store the RGB values of only these $16$ colours, and hence each pixel can be represented with only $4$ bit unsigned integers(ranging from $0$ to $15$).


## Demonstration

We are going to use the following $500\times500$ image for K-means clustering the pixels to 16 colours.

![Spa Original](Spa.png)

This image has a file size of 458 KB.

The [main](main.m) function cotains all the parameters for the Algorithm. We set the number of iterations(max_iters) to $10$ and number of clusters $K$ to $16$. Matrix $A$ stores the RGB value of all $500\times500$ pixels as a matrix of dimensions $500\times500\times3$. These parameters are passed to the [Interations](Iterations.m) function to run the algorithm.

The MATLAB [script](Script.mlx) is to call the [main](main.m) function.

On running the script for 16 clusters, we get the following output 

![Spa In 16 colours](Spa_in_16_colours.png)

This image has a file size of 127 KB (Success!). The image has only changed with the colour of a pixels.

In order to clearly visulize the effect of clustering, we will intensify the change from the original image by decreasing the number of colours to only $4$(i.e. change $K$ to $4$ in [main](main.m))

On running the script for 4 clusters, we get the following output 

![Spa In 4 colours](Spa_in_4_colours.png)