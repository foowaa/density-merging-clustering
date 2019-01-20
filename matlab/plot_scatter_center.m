function plot_scatter_center(X,center)
figure
scatter(X(:,1),X(:,2),'g.')
hold on
scatter(center(:,1),center(:,2),'rx')