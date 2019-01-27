function plot_cluster(X,labels)
colors=['r','b','g','m','c'];
num_clusters = max(labels)-min(labels)+1;
figure,
for i=1:num_clusters
    type=strcat(colors(i),'.');
    scatter(X(labels==i,1),X(labels==i,2),type);
    hold on
end
title('cluster result');