clear;
dataLocation = uigetdir('','Select Data Location');
imagesavelocation = uigetdir('','Select Where To Save Plots');
fileList = getAllFiles(dataLocation);
b = BPFilter;
h = figure('units','normalized','outerposition',[0 0 1 1]);
for i = 1:size(fileList,1);
    fileName = char(fileList(i,1));
    [pathstr,name,ext] = fileparts(fileName);
   % pier = pathstr(end-5:end);
    %rod = name(1:5);
    %details = name(7:end);
    data = csvread(fileName,2,0);
    fileextension = '.png';
    %fullname = strcat(regexprep(pier,'[^\w'']',''),'_',name);
    %fullnameraw = strcat(imagesavelocation,fullname,'_raw',fileextension);
    fullnametimeraw= strcat(imagesavelocation,'/',name,'_raw',fileextension);
    fullnamefrequencyraw= strcat(imagesavelocation,'/',name,'_raw_spectrogram',fileextension);
    fullnametimefiltered= strcat(imagesavelocation,'/',name,'_filtered',fileextension);
    fullnamefrequencyfiltered= strcat(imagesavelocation,'/',name,'_filtered_spectrogram',fileextension);
    rawdata = data(:,2);
    filteredData = filtfilt(b,1,rawdata);
    
    subplot(2,1,1)
    plot(data(:,1),rawdata);
    t = title({strcat(name,'_raw')});
    set(t, 'Interpreter', 'none');
    xlabel('Time (uSec)');
    ylabel('Voltage (V)');
    %saveas(h,fullnametimeraw);
    
    subplot(2,1,2)
    spectrogram(rawdata,2048,1800,4096*10,62.5e6,'yaxis');
    t = title({strcat(name,'_raw')});
    set(t, 'Interpreter', 'none');
    xlabel('Time (uSec)');
    ylabel('Frequency (MHz)');
    ylim([.5 2.1]);
    saveas(h,fullnametimeraw);
    
    subplot(2,1,1)
    plot(data(:,1),filteredData);
    t = title({strcat(name,'_filtered')});
    set(t, 'Interpreter', 'none');
    xlabel('Time (uSec)');
    ylabel('Voltage (V)');
    %saveas(h,fullnametimefiltered);
    
    subplot(2,1,2)
    spectrogram(filteredData,2048,1800,4096*10,62.5e6,'yaxis');
    t = title({strcat(name,'_filtered')});
    set(t, 'Interpreter', 'none');
    xlabel('Time (uSec)');
    ylabel('Frequency (MHz)');
    ylim([.5 2.1]);
    saveas(h,fullnametimefiltered);
end
    