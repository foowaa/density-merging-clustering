load('bolbs.mat');
% ��׼������һ������
X = standard_scalar(X);
% rbf����
dist = rbf(X);
[m,~] = size(dist);
max_dist = max(dist);
min_dist = min(dist);
median_dist = median(dist);
figure,plot(1:m,max_dist,'r',1:m,min_dist,'b',1:m,median_dist,'g');
