function [yy, p] = get_yy(dist,r1,r2)
%dist: �������r1����ֵ��r2����ֵ
rho = r1*r2
[m,~] = size(dist);
%dist��ÿһ�д���r1��Ԫ�ظ���
len_y = sum(dist>r1,2);
%len_y���ֵ
% max_len_y = max(len_y);
% %����max_len_y��r2�������ʵ�Ľض���ֵ
% rr = floor(max_len_y/r2);
%���±�
p = find(len_y>r2);
%��ÿһ�д���r1��Ԫ�ش�Ϊcell
tmp = cell(m,1);
for i=1:m
    [~,col] = find(dist(i,:)>r1);
    tmp{i,1} = col;
end
%��cell���ҵ�p��Ӧ��Ԫ��
yy = tmp(p);