function plot_cluster(X,labels)
% http://matlab.cheme.cmu.edu/2011/09/13/check-out-the-new-fall-colors/
colors_handle = @cmu.colors;
colors_list = {
    'alice blue'
    'alizarin crimson'
    'amaranth'
    'amber'
    'android green'
    'antique brass'
    'antique fuchsia'
    'apricot'
    'aquamarine'
    'arsenic'
};
num_clusters = max(labels)-min(labels)+1;
figure,
for i=1:num_clusters
    %type=strcat(colors(i),'.');
    scatter(X(labels==i,1),X(labels==i,2),'MarkerFaceColor',colors_handle(colors_list{i}));
    hold on
end
title('cluster result');