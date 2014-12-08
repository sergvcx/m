 t = 0:0.001:0.6;
             x = sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t);
             y = x + 2 * randn(size(t));
             plot(y(1:50)), grid
			 
			  Y = fft(y, 512);
              Pyy = Y.*conj(Y)/512;
              f = 1000 * (0:255)/512;
              figure(2), plot(f, Pyy(1:256)), grid