function main()
%MAIN Function with parameters

input = sprintf('Spa.png');

A = double(imread(input));

A = A / 255;

K = 16;

output = sprintf('Spa_in_%d_colours.png',K);

max_iters = 10;

Iterations(A, max_iters,K,output);

end

