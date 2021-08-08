# Image Compression with K - Means Clustering

## Clustering
 
Clustering is an unsupervised learning problem where we are given a set of data points that have to be partitioned into a given number of groups or clusters.

## K - Means Clustering

K - means clustering aims to partition a set of <a href="https://www.codecogs.com/eqnedit.php?latex=N" target="_blank"><img src="https://latex.codecogs.com/gif.latex?N" title="N" /></a> vectors/obserations into <a href="https://www.codecogs.com/eqnedit.php?latex=K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?K" title="K" /></a> clusters with each observation belonging to a cluster with the nearest centroid. Centroid of a cluster is the mean of all vectors/observations belonging to that cluster. Mathematically, let the given <a href="https://www.codecogs.com/eqnedit.php?latex=N" target="_blank"><img src="https://latex.codecogs.com/gif.latex?N" title="N" /></a> observations be vectors <a href="https://www.codecogs.com/eqnedit.php?latex=(x_1,x_2,...x_N)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?(x_1,x_2,...x_N)" title="(x_1,x_2,...x_N)" /></a> of dimension(features) <a href="https://www.codecogs.com/eqnedit.php?latex=D" target="_blank"><img src="https://latex.codecogs.com/gif.latex?D" title="D" /></a>. Let <a href="https://www.codecogs.com/eqnedit.php?latex=C_1,&space;C_2,&space;C_3...C_K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?C_1,&space;C_2,&space;C_3...C_K" title="C_1, C_2, C_3...C_K" /></a> be <a href="https://www.codecogs.com/eqnedit.php?latex=K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?K" title="K" /></a> clusters and <a href="https://www.codecogs.com/eqnedit.php?latex=\mu_1,\mu_2,...\mu_K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\mu_1,\mu_2,...\mu_K" title="\mu_1,\mu_2,...\mu_K" /></a> be the mean of vectors contained in them respectively. The K - means clustering aims to minimize the sum Euclidean distances between the data points and the centroid of thier respective clusters. Hence, the objective is to find - 

#####  <p align="center"><a href="https://www.codecogs.com/eqnedit.php?latex=min\sum_{i=1}^{K}\sum_{x\in&space;C_i}||x-\mu_i||^2" target="_blank"><img src="https://latex.codecogs.com/gif.latex?min\sum_{i=1}^{K}\sum_{x\in&space;C_i}||x-\mu_i||^2" title="min\sum_{i=1}^{K}\sum_{x\in C_i}||x-\mu_i||^2" /></a>

## The Standard Algorithm

This algorithm begins with initializing the <a href="https://www.codecogs.com/eqnedit.php?latex=K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?K" title="K" /></a> centroids as randomly chosen points in the given data set itself. A certain number of iterations are then run in which, the points in the data set are labelled with the closest of the <a href="https://www.codecogs.com/eqnedit.php?latex=K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?K" title="K" /></a> centroids and the centroids are updated with the mean of all data points with the same labelling. After the iterations, the centroid closest to a point in the data set marks the cluster in with it belongs. A drawback of this algorithm is that it cannot guarantee to reach a global optimum at the end. Click [here](https://en.wikipedia.org/wiki/K-means_clustering) for more information on these algorithms.

## Image Compression
### Pixels of an Image

In a standard 24-bit colour representation of an image, each pixel is represented by three 8 bit unsigned integers(ranging from 0 to 255) that specify the red, green and blue (RGB) intensiy values. 

### Clustering of Pixels

Given an image with thousands of colours, consider each pixel as a three-dimensional vector of RGB values. If these pixels are K-means clustered into, say 16 clusters using the above algorithm and the colour of each pixel changed to the colour represented by the centroid of the cluster to which it belongs, the number of colours in the image can be reduced to 16. Doing so reduces/compresses the file size by up to 6 times as now we have to store the RGB values of only these 16 colours and each pixel can be represented with only 4 bit unsigned integers(ranging from 0 to 15).




## Demonstration

We are going to use the following <a href="https://www.codecogs.com/eqnedit.php?latex=500\times500" target="_blank"><img src="https://latex.codecogs.com/gif.latex?500\times500" title="500\times500" /></a> image for K-means clustering the pixels to 16 colours.

![Spa Original](Spa.png)

This image has a file size of 458 KB with pixels of 57678 different colours.

The [main](main.m) function cotains all the parameters for the Algorithm. We set the number of iterations(max_iters) to 10 and number of clusters <a href="https://www.codecogs.com/eqnedit.php?latex=K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?K" title="K" /></a> to 16. Matrix A stores the RGB value of all 500\times500 pixels as a matrix of dimensions <a href="https://www.codecogs.com/eqnedit.php?latex=500\times500\times3" target="_blank"><img src="https://latex.codecogs.com/gif.latex?500\times500\times3" title="500\times500\times3" /></a>. These parameters are passed to the [Interations](Iterations.m) function to run the algorithm.

The MATLAB [script](Script.mlx) is to call the [main](main.m) function.

On running the script for 16 clusters, we get the following output 

![Spa In 16 colours](Spa_in_16_colours.png)

This image has a file size of 142 KB (Success!). The image has only changed with the colour of some pixels.

In order to clearly visulize the effect of clustering, we will intensify the change from the original image by decreasing the number of colours to only 4(i.e. changing <a href="https://www.codecogs.com/eqnedit.php?latex=K" target="_blank"><img src="https://latex.codecogs.com/gif.latex?K" title="K" /></a> to 4 in [main](main.m))

On running the script for 4 clusters, we get the following output 

![Spa In 4 colours](Spa_in_4_colours.png)

This image has a file size of 37 KB (Success!).

Here it is clearly visible how the colour scheme has changed. If we create a [3D Scatter Plot](ClusterVisuals4.fig) of the pixels with the X,Y,Z coordinates representing the RGB intensities, the 4 Clusters can be seen.

![Clusters](ClusterVisuals4.png)
