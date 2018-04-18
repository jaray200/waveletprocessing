clear;

dataLocation = uigetdir('','Select UnAveraged Data');
fileList = getAllFiles(dataLocation);
for i = 1:size(fileList,1);
    fileName = char(fileList(i,1));
    [~,name,~] = fileparts(fileName);
    WestpointUnAveraged(i).name = name;
    WestpointUnAveraged(i).fs = 62.5e6;
    WestpointUnAveraged(i).raw = csvread(fileName,1,1);
end

dataLocation = uigetdir('','Select Averaged Data');
fileList = getAllFiles(dataLocation);
for i = 1:size(fileList,1);
    fileName = char(fileList(i,1));
    [~,name,~] = fileparts(fileName);
    WestpointAveraged(i).name = name;
    WestpointAveraged(i).fs = 62.5e6;
    data = csvread(fileName,1,1);
    WestpointAveraged(i).raw = data(1:625000);
end
