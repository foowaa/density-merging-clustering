function dist = rbf(x,gamma)
if (nargin<2)
    [~,n] = size(x);
    gamma = n;
end
% dist(x, x) = exp(-||x-y||^2/gamma)
% pdist������Matlab���ú���������������
euclidean = pdist(x);
euclidean_square = squareform(euclidean);
dist = exp(-euclidean_square.^2/gamma);