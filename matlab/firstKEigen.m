function [firstKVector,firstKLambda]=firstKEigen(A,k)
% https://www.ctolib.com/topics/75070.html
% A是图的邻接矩阵，k表示前k小
% 返回firstKVector表示A矩阵归一化Laplacian的前k小特征向量；
% 返回firstKLambda表示A矩阵归一化Laplacian的前k小特征值
G=graph(A);
de=degree(G);
% 度矩阵
D=diag(de);
% 归一化Ncut
L=D^.5*A*D^.5;
matrixSize=size(L);
[v,d] = eig(L);
v = [v ; diag(d)' ; diag(d)']' ;%将特征值的信息加入到矩阵便于按特征值排序
v = sortrows(v,matrixSize+2) ;%升序排列
firstKLambda = v(1:k,matrixSize(1)+1) ;
firstKVector = v(1:k,1:matrixSize)';