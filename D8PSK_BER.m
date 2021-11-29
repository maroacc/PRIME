function Int = D8PSK_BER(SNR_dB)


M = 8;
k = log2(M);
N = 1e4;

SNR = 10.^(SNR_dB/10);
EbNo = SNR/k;

phi = linspace(-pi/2,pi/2,N);

Int = zeros(length(SNR_dB),1); % Pre-alloc
for iter = 1:length(SNR_dB)
    A = 1-(cos(pi/M)*cos(phi));
    B = -k*EbNo(iter);
    C = 1-(cos(pi/M)*cos(phi));
    
    I = exp(A.*B)./C;
    
    deltaPhi = phi(2)-phi(1);
    Int(iter) = sin(pi/M)/4/pi*sum(I(1:end-1))*deltaPhi;
end
% 
% close all
% semilogy(SNR_dB,Int,'*')
