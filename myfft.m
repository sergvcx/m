t=0:255
x= zeros(256);
x(10)=100;
x(11)=100;
x(12)=100;
x(13)=100;
x(14)=100;
x(15)=100;
             
			  Y = fft(x, 256);
              
   %subplot(2,1,1),   plot(t,real(Y));
   Px = Y.*conj(Y)/256;
   subplot(2,1,1),   plot(t,Px);
   
              
              
x1= zeros(256);

x1(13)=100;
x1(14)=100;
x1(15)=100;
x1(16)=100;
x1(17)=100;
x1(18)=100;
             
Y1 = fft(x1, 256);
%subplot(2,1,2), plot(t,real(Y1));
Px1 = Y1.*conj(Y1)/256;
subplot(2,1,2), plot(t,Px1);
              
             % Pyy = Y.*conj(Y)/256;
            % f = 1000 * (0:127)/512;
            % figure(2), plot(f, Pyy(1:128)), grid