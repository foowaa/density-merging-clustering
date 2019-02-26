function labels = cluster_by_density(clus_result, X)
[siz, ~] = size(clus_result);
labels = (siz+1)*ones(1,length(X));
for i=1:siz
    labels(clus_result{i})=i;
end