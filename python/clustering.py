import pickle
from prettyprinter import pprint
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn import cluster, datasets, mixture
from sklearn.metrics.pairwise import rbf_kernel
import scipy.io as scio
import networkx as nx
import matplotlib.pyplot as plt


def array2List(ndarray):
    for i, _ in enumerate(ndarray):
        ndarray[i] = ndarray[i][0].tolist()


n_samples = 1500
random_state = 170
# blobs with varied variances
varied = datasets.make_blobs(n_samples=n_samples,
                             cluster_std=[1.0, 2.5, 0.5],
                             random_state=random_state)
X, y = varied
scio.savemat('bolbs.mat', {"X": X, "y": y})

X = StandardScaler().fit_transform(X)
dist = rbf_kernel(X, X)

rate = 0.8
yy = [list(np.where(dist[i, :] >= rate)) for i in range(dist.shape[0])]
array2List(yy)
len_y = len(yy)
r2 = 250
pp = []
for e1 in yy:
    if len(e1) > r2:
        pp.append((len(e1), e1))

qq = []
qm = np.ones((len(pp), len(pp)))
for i2, e2 in enumerate(pp):
    for i3, e3 in enumerate(pp):
        ss = set(e2[1]) & set(e3[1])
        ll = len(ss)/(e2[0]+e3[0]-len(ss))
        qq.append(ll)
        qm[i2, i3] = ll
q = np.array(qq)

r3 = 0
qm[qm < r3] = 0


graph = nx.from_numpy_matrix(qm, create_using=nx.DiGraph())

connected = []
for c in nx.weakly_connected_components(graph):
    connected.append(list(c))

res = []
for i in connected:
    s = set()
    for j in i:
        s = s | set(pp[j][1])
    res.append(list(s))

k = []
for e1 in res:
    x1 = np.zeros((2,))
    for e2 in e1:
        x1 += X[e2]
    x1 /= len(e1)
    k.append(x1)
l = np.array(k)

plt.scatter(X[:, 0], X[:, 1])
plt.scatter(l[:, 0], l[:, 1], marker='v')
plt.show()


dist_center = np.zeros((dist.shape[0], len(k)))
for i, e in enumerate(l):
    di = (np.sum((X-np.tile(e, (dist.shape[0], 1)))**2, 1))**0.5
    aff = np.exp(-di)
    dist_center[..., i] = aff

labels = np.argmax(dist_center, 1)
