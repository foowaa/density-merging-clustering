function save_labels(labels,y, fn)
if nargin<3
    fn='lab.mat';
end
save(fn,'labels','y')