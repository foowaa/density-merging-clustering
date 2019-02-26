clear all;
close all;
clc;
load('bolbs.mat');
% ��׼������һ������
X = standard_scalar(X);
% rbf����
dist = rbf(X);
% �õ�yy
% �ܶ�=r1*r2
[yy, p] = get_yy(dist,0.8,200);
% �õ�qm
qm=get_qm(yy,0.5);
% ����ͼ����ͨ����
plot_graph(qm);
% �õ���ͨ����
[clus_result,conn] = get_connectedComp(qm,yy);
% �õ��������ĵ�
center=get_center(clus_result, X);
% ������������
% load('center.mat');
plot_scatter_center(X,center);
% ����
labels=cluster_by_distance(center,X);
% % �������
plot_cluster(X,labels);
% ���� nmi
nmi = calc_nmi(y,labels);
fprintf('NMI: %.4f\n',nmi);
