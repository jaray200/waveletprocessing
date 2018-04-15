clear;

dataLocation = uigetdir('','Select Data Location');
fileList = getAllFiles(dataLocation);
load('LPFFiveMHz.mat');
%h = figure('units','normalized','outerposition',[0 0 1 1]);
for i = 1:size(fileList,1);
    fileName = char(fileList(i,1));
    [~,name,~] = fileparts(fileName);
    Westpoint(i).name = name;
    Westpoint(i).fs = 62.5e6;
    Westpoint(i).raw = csvread(fileName,1,1);
end
