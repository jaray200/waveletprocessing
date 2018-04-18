%Uncomment below if it is the first time loading
% clear;
%load('..\Data\Westpoint\WestpointUnAveraged.mat');
%load('..\Data\Westpoint\WestpointAveraged.mat');

fs = 62.5e6;
x = ((0:length(WestpointAveraged(1).raw)-1)./fs).*1000;


figure;
plot(x,WestpointAveraged(2).raw);

hold on;
plot(x,WestpointUnAveraged(2).sdb4);
ylabel('Voltage (mV)');
xlabel('Time (msec)');
title({'Averaging Vs. DWT of Defect','Soft Thresholding Using db4 Wavelet'});
legend('Averaged 100 Times', 'DWT');
