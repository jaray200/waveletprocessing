%Uncomment below if it is the first time loading
% clear;
%load('..\Data\Westpoint\WestpointUnAveraged.mat');
%load('..\Data\Westpoint\WestpointAveraged.mat');

fs = 62.5e6;
x = ((0:length(WestpointAveraged(1).raw)-1)./fs).*1000;


figure;
% subplot(3,1,1);
% plot(WestpointAveraged(2).raw);
% title({'Pier 10, West Bundle, Row 6, Column 3','Averaged'});
% xlabel('Time (msec)');
% ylabel('Voltage (mV)');
% axis([0 length(WestpointAveraged(1).raw) -400 400])
% subplot(3,1,2);
% plot(WestpointUnAveraged(2).raw);
% title('Not Averaged');
% xlabel('Time (msec)');
% ylabel('Voltage (mV)');
% axis([0 length(WestpointAveraged(1).raw) -400 400])
% subplot(3,1,3);
% plot(WestpointUnAveraged(2).hdb4);
% title({'Not Averaged Denoised using DWT','hdb4'})
% xlabel('Time (msec)');
% ylabel('Voltage (mV)');
% axis([0 length(WestpointAveraged(1).raw) -400 400])


plot(x,WestpointAveraged(3).raw);
title('Averaged');
xlabel('Time (msec)');
ylabel('Voltage (mV)');
%axis([0 x(length(x)) -400 400])

figure;
plot(x,WestpointUnAveraged(3).raw);
title('UnAveraged')
xlabel('Time (msec)');
ylabel('Voltage (mV)');
%axis([0 x(length(x)) -400 400])

figure;
plot(x,WestpointUnAveraged(1).sdb3);
title('Wavelet')
xlabel('Time (msec)');
ylabel('Voltage (mV)');
%axis([0 x(length(x)) -400 400])