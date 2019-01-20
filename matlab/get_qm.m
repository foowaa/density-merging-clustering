function qm=get_qm(y, r3)
if nargin<2
    r3 = 0;
end
len = length(y);
qm = zeros(len,len);
for i=1:len
    for j=1:len
        m1 = unique(y{i});
        m2 = unique(y{j});
        intersect_m1_m2 = intersect(m1,m2);
        union_m1_m2 = union(m1,m2);
        s = length(intersect_m1_m2)/length(union_m1_m2);
        qm(i,j) = s;
    end
end
qm(qm<r3) = 0;