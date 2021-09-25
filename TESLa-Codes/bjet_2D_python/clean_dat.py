import numpy as np 

dat1 = np.loadtxt('bjet_int-data.txt')
dat2 = np.loadtxt('bjet-data.txt')

dat_new1 = np.array(dat1) * 1 
dat_new2 = np.array(dat2) * 1

dat_all1 = np.concatenate([dat1,dat2])
sorted_array = dat_all1[np.lexsort(dat_all1.T[::-1])]

rows = np.where(sorted_array[:,2] == sorted_array[:,3])

clean_bjet = (sorted_array[rows])



np.savetxt('bjet_2D_dble_clean-data.txt',clean_bjet, fmt = '%f')