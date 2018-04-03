clear;
data = csvread('Data/The Dalles/P22_Rod1_Bottom_Burst_1276000Hz_100Cycles_400Averages_10ms_10V_AC.csv',2,0);
fs = 62.5e6;
time = data(:,1); %in uSec
voltage = data(15000:end,2); %in mV
%%%%%%%%%Wavelet Packet Filter Bank Tree
[c,info] = wpfbt(voltage-mean(voltage),{'sym10',8,'full'});
figure
plotwavelets(c,info,fs,'dynrange',90);
%%%%%%%%%

%%%%%%%%%use this if using full wfbt
[c4,info]=wfbt(voltage-mean(voltage),{'sym10',8,'full'});
figure;
plotwavelets(c4,info,fs,'dynrange',90);
% wt = {'symorth3',8};
%fhat = iwfbt(c4,wt,length(voltage));
%%%%%%%%%
% % % % c = fwt(voltage-mean(voltage),'db4',8);
% % % % for i = 1:length(c)
% % % %     if abs(c(i)) < 2500
% % % %         c(i) = 0;
% % % %     end
% % % % end
% % % % fhat = ifwt(c,'db4',8,length(voltage));
% test = [];
% for i = 1:length(c4)
%     test = [test; c4{i}];
% end
% J = 8;
% [c,info] = fwt(voltage-mean(voltage),'symorth3',J);
% plotwavelets(c,info,fs,'dynrange',90);