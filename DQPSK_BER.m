function theoryBer_dqpsk_noncoh = DQPSK_BER(SNR_dB)

if nargin == 0
    SNR_dB = -5:20;
end

M = 4;
k = log2(M);
Eb_N0_dB = SNR_dB-10*log10(k);

theoryBer_dqpsk_noncoh = zeros(1,length(SNR_dB)); % Pre-alloc
for snrIter = 1:length(SNR_dB)
    a = sqrt(2*10.^(Eb_N0_dB(snrIter)/10)*(1-sqrt(1/2)));
    b = sqrt(2*10.^(Eb_N0_dB(snrIter)/10)*(1+sqrt(1/2)));
    
    k_bessel = 0:10;
    temp = exp(-((a.^2+b.^2)/2)).*sum((a/b).^k_bessel.*besseli(k_bessel,a*b));
    theoryBer_dqpsk_noncoh(snrIter) = temp - 0.5*besseli(0,a*b)*exp(-((a.^2+b.^2)/2));
end


if nargin == 0
    figure
    semilogy(SNR_dB,theoryBer_dqpsk_noncoh,'-*')
    xlabel('SNR [dB]')
    ylabel('BER')
    grid
end