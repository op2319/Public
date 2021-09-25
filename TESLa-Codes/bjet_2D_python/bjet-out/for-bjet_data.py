# Omkar Patil, TESLa 2021
# Under advisement from Micheal A. Meehan & Peter E. Hamlington 
# Department of Mechanical Engineering, University of Colorado, Boulder

import os
import glob
import numpy as np 
basedir = os.getcwd()

left_width_list = []
right_width_list = []
freq_left_list = [] # Puffing Frequency for Left Jet
freq_right_list = [] # Puffing  Frequency for Right Jet
spac_list = [] # Spacing Values 
phase_left_list = []
phase_right_list = []
phase_diff_list = []

# Left Width Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for x, left_width in enumerate(f): 
            if x == 1:
                left_width_list.append(left_width)  
left_width_list = [s.replace("\n", "") for s in left_width_list]

# Right Width Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for y, right_width in enumerate(f): 
            if y == 2:
                right_width_list.append(right_width)  
right_width_list = [s.replace("\n", "") for s in right_width_list]

# Left Puffing Frequency Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for z, freq_left in enumerate(f): 
            if z == 3:
                freq_left_list.append(freq_left)  
freq_left_list = [s.replace("\n", "") for s in freq_left_list]

# Right Puffing Frequency Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for i, freq_right in enumerate(f): 
            if i == 4:
                freq_right_list.append(freq_right)  
freq_right_list = [s.replace("\n", "") for s in freq_right_list]

# Spacing Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for j, spac in enumerate(f): 
            if j == 5:
                spac_list.append(spac)  
spac_list = [s.replace("\n", "") for s in spac_list]

# Left Phase Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for k, phase_left in enumerate(f): 
            if k == 6:
                phase_left_list.append(phase_left)  
phase_left_list = [s.replace("\n", "") for s in phase_left_list]

# Right Phase Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for m, phase_right in enumerate(f): 
            if m == 7:
                phase_right_list.append(phase_right)  
phase_right_list = [s.replace("\n", "") for s in phase_right_list]

#Phase Difference Values
for filepath in glob.glob(os.path.join(basedir, 'mf_w_*_w_*_s_*_op')):
    with open(filepath) as f:
        for n, phase_diff in enumerate(f): 
            if n == 8:
                phase_diff_list.append(phase_diff)  
phase_diff_list = [s.replace("\n", "") for s in phase_diff_list]

# Converting all Lists to NumPY Array for Easier Manipulation
num_left_width_list = np.array(left_width_list, dtype = "float64")
num_right_width_list = np.array(right_width_list, dtype = "float64")

num_spac_list = np.array(spac_list, dtype = "float64")
num_spac_list = num_spac_list * 1/100

num_freq_left_list = np.array(freq_left_list, dtype = "float64")
num_freq_right_list = np.array(freq_right_list, dtype = "float64")

num_phase_left_list = np.array(phase_left_list, dtype = "float64")
num_phase_right_list = np.array(phase_right_list, dtype = "float64")
phase_difference = np.array(phase_diff_list, dtype = "float64")

# Transposing Arrays for data.txt
trans_num_left_width_list = np.transpose(num_left_width_list)
trans_num_right_width_list = np.transpose(num_right_width_list)

trans_num_spac_list = np.transpose(num_spac_list)

trans_num_freq_left_list = np.transpose(num_freq_left_list)
trans_num_freq_right_list = np.transpose(num_freq_right_list)

trans_num_phase_left_list = np.transpose(num_phase_left_list)
trans_num_phase_right_list = np.transpose(num_phase_right_list)
trans_phase_difference = np.transpose(phase_difference)

# Concatenating Main Array for data.txt 
np_main_ALL = np.c_[trans_num_left_width_list, trans_num_spac_list, trans_num_freq_left_list, trans_num_freq_right_list, trans_num_phase_left_list, trans_num_phase_right_list, trans_phase_difference]
sorted_array = np_main_ALL[np.lexsort(np_main_ALL.T[::-1])]
# Saving Main Array to data.txt
np.savetxt("bjet-data.txt", sorted_array , fmt = '%f')



