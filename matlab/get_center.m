function center=get_center(clus_result, X)
[~,col]=size(X);
center = zeros(length(clus_result),col);
for i=1:length(clus_result)
    s = clus_result{i};
    tmp = zeros(length(s),col);
    for j=1:length(s)
        tmp(j,:) = X(s(j),:);
    center(i,:) = mean(tmp);
    end
end