function theoryBerDBPSK = DBPSK_BER(SNR_dB)

if nargin == 0
    SNR_dB = -5:20;
end

theoryBerDBPSK = (1/2)*exp(-(10.^(SNR_dB(1,:)/10)));

if nargin == 0
    figure
    semilogy(SNR_dB,theoryBerDBPSK,'-*')
    xlabel('SNR [dB]')
    ylabel('BER')
    grid
end