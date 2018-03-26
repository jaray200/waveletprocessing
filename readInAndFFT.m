function [freq, F] = readInAndFFt(Data, Fs)
    N = pow2(nextpow2(length(Data)));
    F = abs((fft(Data, N))/length(Data));
    freq = Fs/2*linspace(0,1,N/2+1);
    F = F(1:N/2+1);
end

