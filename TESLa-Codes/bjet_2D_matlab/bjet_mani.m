clear all; close all; clc

dat1 = load('data.txt');
dat2 = load('data_new.txt');


% Sorting Rows in Numerical Order
dat_mani1 = sortrows(dat1); 
dat_mani2 = sortrows(dat2); 


% Combining Columns that needed wrapping with ones that did
dat_main = [dat_mani1; dat_mani2];
dat_main = sortrows(dat_main);

%  Writing to .txt and cleaning up 
writematrix(dat_main, 'data1.txt','Delimiter',' ');








