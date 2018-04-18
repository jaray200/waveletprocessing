clear;

load('wname.mat');
load('..\Data\Westpoint\WestpointUnAveraged.mat');

for i = 1:length(wname)
    for j = 1:length(WestpointUnAveraged)
        softname = ['s' wname{i}];
        hardname = ['h' wname{i}];
        WestpointUnAveraged(j).(softname) = waveletDenoise(WestpointUnAveraged(j).raw,wname{i},'s');
        WestpointUnAveraged(j).(hardname) = waveletDenoise(WestpointUnAveraged(j).raw,wname{i},'h');
    end
end
                    