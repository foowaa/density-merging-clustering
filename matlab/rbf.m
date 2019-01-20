function dist = rbf(x,gamma)
if (nargin<2)
    [~,n] = size(x);
    gamma = n;
end
% dist(x, x) = exp(-||x-y||^2/gamma)
% pdistº¯ÊýÊÇMatlabÄÚÖÃº¯Êý£¬¼ÆËã¾àÀë¾ØÕó
euclidean = pdist(x);
euclidean_square = squareform(euclidean);
dist = exp(-euclidean_square.^2/gamma);