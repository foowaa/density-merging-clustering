function [firstKVector,firstKLambda]=firstKEigen(A,k)
% A��ͼ���ڽӾ���k��ʾǰkС
% ����firstKVector��ʾA�����һ��Laplacian��ǰkС����������
% ����firstKLambda��ʾA�����һ��Laplacian��ǰkС����ֵ
G=graph(A);
de=degree(G);
% �Ⱦ���
D=diag(de);
% ��һ��Ncut
L=D^.5*A*D^.5;
matrixSize=size(L);
[v,d] = eig(L);
v = [v ; diag(d)' ; diag(d)']' ;%������ֵ����Ϣ���뵽������ڰ�����ֵ����
v = sortrows(v,matrixSize+2) ;%��������
firstKLambda = v(1:k,matrixSize(1)+1) ;
firstKVector = v(1:k,1:matrixSize)';