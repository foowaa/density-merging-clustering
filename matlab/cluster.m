function labels = cluster(center, X)
% 计算每个点到clu_result 的距离，以此判定应该属于哪个 cluster
[m,~]=size(X);
dist_center = zeros(length(center),m,1);
for i=1:length(center)
    new = bsxfun(@minus,X,center(i,:));
    new_square = new.*new;
    new_norm = sqrt(sum(new_square,2));
    new_rbf = exp(-new_norm);
    dist_center(i,:,:) = new_rbf;
end

%labels = dist_center;
[~,I] = max(dist_center);
labels = I;