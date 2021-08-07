function main()
%MAIN Function with parameters

A = double(imread('Spa.png'));
A = A / 255;

img_size = size(A);



K = 4;

max_iters = 10;




Iterations(A, max_iters,K);

end

