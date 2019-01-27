clear all;
close all;
clc;
load('bolbs.mat');
% 标准化，归一化数据
X = standard_scalar(X);
% rbf距离
dist = rbf(X);
% 得到yy
% 密度=r1*r2
[yy, p] = get_yy(dist,0.95,250);
% 得到qm
qm=get_qm(yy);
% 画出图的连通性质
plot_graph(qm);
% 得到连通分量
[clus_result,conn] = get_connectedComp(qm,yy);
% 得到聚类中心点
center=get_center(clus_result, X);
% 画出聚类中心
% load('center.mat');
plot_scatter_center(X,center);
% 聚类
labels=cluster(center,X);
% % 画出结果
plot_cluster(X,labels);
% 计算 nmi
nmi = calc_nmi(y,labels);
fprintf('NMI: %.4f\n',nmi);
