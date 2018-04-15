load('wname.mat');
load('Westpoint.mat');

for i = 1:length(wname)
    for j = 1:length(Westpoint)
        softname = ['s' wname{i}];
        hardname = ['h' wname{i}];
        Westpoint(j).(softname) = waveletDenoise(Westpoint(j).raw,wname{i},'s');
        Westpoint(j).(hardname) = waveletDenoise(Westpoint(j).raw,wname{i},'h');
    end
end
                    