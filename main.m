function main()

%MAIN Function with parameters

input = sprintf('Spa.png');

A = double(imread(input));

img_size = size(A);

X = reshape(A, img_size(1) * img_size(2), 3);
        
fprintf('Number of Colours in input image = %d\n',countcolours(X));                     
            

A = A / 255;

K = 4;  %Number of Clusters

output = sprintf('Spa_in_%d_colours.png',K);

max_iters = 10; %Number of Iterations

Iterations(A, max_iters,K,output);

A = double(imread(output));

img_size = size(A);

X = reshape(A, img_size(1) * img_size(2), 3);

fprintf('Number of Colours in output image = %d',countcolours(X));      



end

