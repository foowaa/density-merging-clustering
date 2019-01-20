from sklearn.metrics.cluster import normalized_mutual_info_score
import scipy.io as scio
import numpy as np
path = 'lab.mat'
lab = scio.loadmat(path)
nmi = normalized_mutual_info_score(np.squeeze(lab['y']),np.squeeze(lab['labels']))
print(nmi)