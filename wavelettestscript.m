clear;
data = csvread('Data/The Dalles/P22_Rod1_Bottom_Burst_1276000Hz_100Cycles_1Averages_10ms_10V_AC.csv',2,0);
fs = 62.5e6;
time = data(:,1); %in uSec
voltage = data(:,2); %in mV
[c4,info]=wfbt(voltage,{'symorth3',8,'full'});
plotwavelets(c4,info,fs,'dynrange',50);
% J = 10;
% [c,info] = fwt(voltage,'db8',J);
% plotwavelets(c,info,fs,'dynrange',90);