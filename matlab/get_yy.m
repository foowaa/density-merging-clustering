function [yy, p] = get_yy(dist,r1,r2)
%dist: 距离矩阵；r1：阈值；r2：阈值
fprintf('rho: %.4f\n', r1*r2);
[m,~] = size(dist);
%dist的每一行大于r1的元素个数
len_y = sum(dist>r1,2);
%len_y最大值
% max_len_y = max(len_y);
% %根据max_len_y和r2，求出真实的截断阈值
% rr = floor(max_len_y/r2);
%找下标
p = find(len_y>r2);
%将每一行大于r1的元素存为cell
tmp = cell(m,1);
for i=1:m
    [~,col] = find(dist(i,:)>r1);
    tmp{i,1} = col;
end
%在cell中找到p对应的元素
yy = tmp(p);