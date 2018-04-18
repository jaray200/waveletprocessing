%Uncomment below if it is the first time loading
% clear;
%load('..\Data\Westpoint\WestpointUnAveraged.mat');
%load('..\Data\Westpoint\WestpointAveraged.mat');

fs = 62.5e6;
x = ((0:length(WestpointAveraged(1).raw)-1)./fs).*1000;


figure;
subplot(4,1,1);
plot(x,WestpointAveraged(2).raw);
title({'Hard vs. Soft Thresholding','db4','Hard'})
xlabel('Time (msec)');
ylabel('Voltage (mV)');
axis([x(1.597e5) x(1.781e5) -200 200])
subplot(4,1,2);
plot(x,WestpointUnAveraged(2).raw);
title({'Hard vs. Soft Thresholding','db4','Hard'})
xlabel('Time (msec)');
ylabel('Voltage (mV)');
axis([x(1.597e5) x(1.781e5) -200 200])
subplot(4,1,3);
plot(x,WestpointUnAveraged(2).hdb4);
title({'Hard vs. Soft Thresholding','db4','Hard'})
xlabel('Time (msec)');
ylabel('Voltage (mV)');
axis([x(1.597e5) x(1.781e5) -200 200])
subplot(4,1,4);
plot(x,WestpointUnAveraged(2).sdb4);
title('Soft')
xlabel('Time (msec)');
ylabel('Voltage (mV)');
axis([x(1.597e5) x(1.781e5) -200 200])