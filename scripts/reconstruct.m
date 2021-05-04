% function to plot sampled and reconstruction signals of sinusoids
function [error] = reconstruct(f, Fs)
% original analog signal
t = -(20/Fs):0.00001:(20/Fs);
x_a = sin(2*pi*f*t);
% discrtete signal
Ts = 1/Fs;
n = -20:20;
nTs = n*Ts;
x_n = sin(2*pi*f*nTs);
% analog signal reconstruction
y_a = x_n*sinc(Fs*(ones(length(n),1)*t-nTs'*ones(1,length(t))));
% error 
error = max(abs(y_a-x_a));

%plotting
subplot (2,1,1)
plot(t*1000, x_a);
hold on 
stem(nTs*1000, x_n);
title('Discrete-time signal','fontsize',15);
ylabel('x(n)','fontsize',13);
xlabel('time in ms','fontsize',13);
grid;

hold off

subplot(2,1,2);
plot(t, y_a, 'r');
hold on
plot(t, x_a, 'b');
title('Original and Reconstructed signal','fontsize',15);
xlabel('time in ms','fontsize',13);
ylabel('x_a(t) and y_a(t)','fontsize',13);
grid;
end