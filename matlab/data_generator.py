import numpy as np
from sklearn import datasets
import scipy.io as scio
import matplotlib.pyplot as plt


def save_mat(path, data):
    scio.savemat(path, {"X": data[0], "y": data[1]})


def gen_data(n):
    np.random.seed(0)
    # 数据个数
    n_samples = 1600
    random_state = 170
    if n == 1:
        # 第一行 noisy_circles
        noisy_circles = datasets.make_circles(
            n_samples=n_samples, factor=0.5, noise=0.05)
        return noisy_circles
    # 第二行 noisy_moons
    elif n == 2:
        noisy_moons = datasets.make_moons(n_samples=n_samples, noise=0.05)
        return noisy_moons
    # 第五行 blobs
    elif n == 5:
        blobs = datasets.make_blobs(n_samples=n_samples, random_state=8)
        return blobs
    # 第六行 no_structure
    elif n == 6:
        no_structure = np.random.rand(n_samples, 2), None
        return no_structure
    # 第四行 aniso
    elif n == 4:
        X, y = datasets.make_blobs(
            n_samples=n_samples, random_state=random_state)
        transformation = [[0.6, -0.6], [-0.4, 0.8]]
        X_aniso = np.dot(X, transformation)
        aniso = (X_aniso, y)
        return aniso
    # 第三行 varied
    elif n == 3:
        varied = datasets.make_blobs(
            n_samples=n_samples, cluster_std=[1.0, 2.5, 0.5], random_state=random_state
        )
        return varied
    else:
        raise NotImplementedError


def plot_data(data):
    plt.scatter(data[0][:, 0], data[0][:, 1], marker='.')
    plt.show()


if __name__ == "__main__":
    data = gen_data(2)
    plot_data(data)
    save_mat('m.mat', data)
