clc;
close all;
%% Inputs for Lab - 5 (Comb Filters)
M = 2;
L = 3;
n = -5:5;
del = 2*pi/1000;
l = 3;
w = -pi:del:pi-del;

%% Q1-a ; Frequency Response of Filters
H = 0.5*(1 + exp(1j*w));
G = 0.5*(1 + exp(1j*w*l));

figure(1);
subplot(2,2,1);plot(w,abs(H));title('Magnitude resp of H');
subplot(2,2,2);plot((w/pi),angle(H));title('Phase resp of H');
subplot(2,2,3);plot(w,G);title('Magnitude resp of G');
subplot(2,2,4);plot((w/pi),angle(G));title('Phase resp of G');

%% Q1-a ; Impulse Response of the filters
h = [0.5 0.5];
temp = zeros(1,l-1);
g = [0.5 temp 0.5];

figure(2);
subplot(2,1,1);stem(h);title('Impusle Response h[n]');
subplot(2,1,2);stem(g);title('Impusle Response g[n]');

%% Q1-b ; Role of L in the response of G(z)? 
figure(3);
for i = 1:3
    G = 0.5*(1 + exp(1j*w*i));
    subplot(3,1,i);plot(w,G);title('L = i');
end
%% Frequency Response of New H
H1 = (1 - exp(1j*w*M))./(M*(1 - exp(1j*w)));
figure(4);
subplot(2,1,1);plot(w,abs(H1));title('Magnitude resp of H');
subplot(2,1,2);plot((w/pi),angle(H1));title('Phase resp of H');

%% Impulse Response of New H
syms z
A = (1 - z^(M*L));
B = (M*(1 - z^(L)));
[Q,R] = quorem(A,B);
QQ = sym2poly(Q); %instead of doing all this - impz(A./B)
figure(5);stem(QQ);title('New Impulse Response hnew[n]');

%% Q2-b ;Impulse Response(Low Pass Filter); K =0.75;
%syms z
%A1 = 0.75*(z - 1);
%B1 = (z - 0.5);
%[Q1,R1] = quorem(A1,B1);
%QQ1 = sym2poly(Q1);
a = 0.75*[1 -1];
b = [1 -0.5];
[h,t] = impz(a, b);
figure(6);stem(t,h);title('Impulse Response h[n] / Q2-b');

%% Q2-b ;Freq Response
A1 = 0.75*(1 - exp(1j*w))./(1 - (0.5*exp(1j*w)));
figure(7);
subplot(2,1,1);plot(w,abs(A1));title('Magnitude resp of H / Q2-b');
subplot(2,1,2);plot((w/pi),angle(A1));title('Phase resp of H / Q2-b');

%% Q2-b ;Impulse Response of z^2
a1 = 0.75*[1 0 -1];
b1 = [1 0 -0.5];
[h1,t1] = impz(a1, b1);
figure(8);stem(t1,h1);title('Impulse Response h[n] / Q2-b - z^2');

%% Q2-c ;Freq Response of z^2
A11 = 0.75*(1 - exp(1j*w*2))./(1 - (0.5*exp(1j*w*2)));
figure(9);
subplot(2,1,1);plot(w,abs(A11));title('Magnitude resp of H / Q2-b - z^2');
subplot(2,1,2);plot((w/pi),angle(A11));title('Phase resp of H / Q2-b - z^2');