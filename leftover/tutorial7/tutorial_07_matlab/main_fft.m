% Numerical Programming I (for CSE), WT 2012/13
% tutorial 7
%
% -- Fourier transformation --
%
% author: schraufstetter, BG

clc
clear all
close all

% choose parameters
n=2^9;       % number of nodes
w1=40;       % frequency of sinus
w2=125;      % frequency of cosinus
t_end=1;     % end parameter, where periodicity occurs
delta = 2;   % noise multiplicator
plotn = 100; % number of plotted nodes (from 0)

% set function
xfunc = inline('sin(2*pi*f1*t) + cos(2*pi*f2*t) ', 't','f1','f2');
t=linspace(0,t_end,n+1); 
t=t(1:n); % Important: Remove last node again!

% Evaluate function at nodes
x = xfunc(t,w1,w2); % without noise
y = xfunc(t,w1,w2) + delta*randn([size(t),1]); % with noise

% plot function
plot(1000*t(1:plotn),y(1:plotn),'b', 1000*t(1:plotn),x(1:plotn),'r')
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (milliseconds)')
legend('\delta = 2', '\delta = 0')

% fast Fourier transform of noisey function
Y = fft(y,n);

% measurement of the power of the frequencies
YYn = Y.* conj(Y) / n;

% plot result of DFT
figure
f = linspace(0,n/t_end/2,n/2+1);
stem(f,YYn(1:n/2+1))
title('Frequency content of y')
xlabel('frequency (Hz)')
       
% filter frequencies
Z=0;
idx = find(YYn > 0.2* max(YYn))
Z(idx)=Y(idx);


% measurement of the power of the frequencies
ZZn = Z.* conj(Z) / n;

% plot filtered frequencies
figure
f = linspace(0,n/t_end/2,n/2+1);
stem(f,ZZn(1:n/2+1))
title('Frequency content of filtered y')
xlabel('frequency (Hz)')

% inverse Fourier transform
X2 = ifft(Z,n)';

error = sum(abs(x(:)-X2(:)))/n

% plot result if IDFT
figure
plot(1000*t(1:plotn),X2(1:plotn),'b', 1000*t(1:plotn),x(1:plotn),'r')
title('Signal')
xlabel('time (milliseconds)')
legend('ifft(filtered Y)', 'x with \delta = 0')

