function result = standard_scalar(x)
% https://github.com/steven2358/sklearn-matlab/blob/master/lib/preprocessing/StandardScaler.m
% Standardize features by removing the mean and scaling to unit variance
% 
% Centering and scaling happen independently on each feature by computing the relevant statistics on the samples in the training set. Mean and standard deviation are then stored to be used on later data using the transform method.
% 
% Standardization of a dataset is a common requirement for many machine learning estimators: they might behave badly if the individual feature do not more or less look like standard normally distributed data (e.g. Gaussian with 0 mean and unit variance).

mean_ = mean(x,1);
%matlab�Դ��ı�׼����ǻ��������ı�׼��, ����ĸ��(n-1)��numpy.std�ķ�ĸ��n, ��std_ = std(x,1);
std_ = std(x,1);
scale_ = 1./std_;
x_new = bsxfun(@minus,x,mean_);
result = bsxfun(@times,x_new,scale_);