function [b] = generateBandPass(type,centerFrequency, bandwidth, stopbandAddition, fs)

switch type
    case 'kaiser'
        f =[centerFrequency-(bandwidth/2)-stopbandAddition ...
            centerFrequency-(bandwidth/2) ...
            centerFrequency+(bandwidth/2) ...
            centerFrequency+(bandwidth/2)+stopbandAddition];
        a = [0 1 0];
        dev = [0.01 1 0.01];
        [n,Wn,beta,ftype] = kaiserord(f,a,dev,fs);
        n = n + rem(n,2);
        b = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

    case 'hamming'
        disp('hamming');
    case 'hanning'
        disp('hanning');
    case 'tukey'
        disp('tukey');
    case 'blackman'
        disp('blackman');
    otherwise
        error(['Filter Type not accepted.'...
            newline 'Accepted types are:'...
            newline 'kaiser'...
            newline 'hamming'...
            newline 'hanning'...
            newline 'tukey'...
            newline 'blackman']);
end