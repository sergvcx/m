function detector()
 uicontrol('Style', 'slider',...
        'Min',0,'Max',10,'Value',0,...
        'Position', [400 20 120 20],...
        'Callback', @delay);   
    
function delay(hObj,eventdata) 
    % Called to set zlim of surface in figure axes
    % when user moves the slider control
    shift = get(hObj,'Value');
   % zlim(ax,[-val val]);            
  

size=16;
t=1:size;
x= zeros(size);
%x(2)=100;
%x = sin (t/20).*sin (2*t/100);
%x(3)=100;
%x(4)=100;
for g=1:1:10
    %x(g+int32(shift))=10;
    x(g)=10;
end
%x= sin(t/20)+sin(t/15);
%x(5)=1;
%x(6)=1;
%x(7)=1;
%x(8)=1;
%x(9)=1;



%x(1)=0;
%x(16)=0;
subplot(4,2,1),plot(x);grid
Y = fft(x, size);
              
%subplot(2,1,1),   pl        
%subplot(4,2,3),   plot(t,Px);
ang = angle(Y);
for k=2:1:size
    while ang(k-1)>ang(k)
        ang(k)=ang(k)+2*pi;
    end
end

subplot(5,2,3),   plot(t,abs(Y));grid
subplot(5,2,5),   plot(t,ang);grid


%ax=atan2(imag(Y),real(Y));
%ax=angle(Y);
%subplot(5,2,7),   plot(t,ax);grid
rotate=Y;
for k=1:1:size
rotate(k) =exp(-i*shift/10*(size/2-t(k)));
end

Y=Y.*rotate;
%subplot(5,2,7),   plot(t,angle(Y));
%----------------------------------------------------
x1 = ifft(Y);
%x1= zeros(size);



%x1(3)=100;
%x1(4)=100;
%x1(5)=100;
%x1(6)=100;
%x1(7)=100;
%x1(8)=100;
%x1(9)=100;

%x1= sin(t/2+shift);
%x1(1)=0;
%x1(16)=0;


subplot(4,2,2),plot(real(x1));grid
Y1 = fft(x1, size);
%subplot(2,1,2), plot(t,real(Y1));

%subplot(4,2,4), plot(t,Px1);

ang1 = angle(Y1);
for k=2:1:size
    while ang1(k-1)>ang1(k)
        ang1(k)=ang1(k)+2*pi;
    end
end
subplot(5,2,4),   plot(t,abs(Y1));grid
subplot(5,2,6),   plot(t,ang1);grid

%ax1=atan2(imag(Y1),real(Y1));

%subplot(4,2,8),   plot(t,realimag(Y1));grid
% subplot(5,2,8),   plot(t,abs(atan2(imag(Y1),real(Y1))-atan2(imag(Y),real(Y)))); grid on
   
%a1=real(Y);
%b1=imag(Y);
%a2=real(Y1);
%b2=imag(Y1);
%angle=acos((a1.*b1+a2.*b2)./(sqrt(Px1).*sqrt(Px)));
%subplot(5,2,8),   plot(t,angle);grid
subplot(5,2,8),   plot(t,angle(rotate));grid
             % Pyy = Y.*conj(Y)/256;
            % f = 1000 * (0:127)/512;
            % figure(2), plot(f, Pyy(1:128)), grid
            
