function [clus_result,conn] = get_connectedComp(qm,y)
G = graph(qm);
conn = conncomp(G,'OutputForm','cell');
clus_result = cell(length(conn),1);
for i=1:length(conn)
    s = conn{i};
    p = [];
    for j=1:length(s)
        p = cat(2,p,y{s(j)});
    end
    clus_result{i} = unique(p);
end
