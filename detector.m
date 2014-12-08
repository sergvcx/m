%uicontrol('style','slider',...
 %%      'Position', [400 20 120 20],...
   %     'Callback', @surfzlim); 
    %
%function surfzlim(source,callbackdata)
 %  val = 51 - source.Value;
  % zlim(ax,[-val val]);
%end
function detector()
 uicontrol('Style', 'slider',...
        'Min',1,'Max',50,'Value',41,...
        'Position', [400 20 120 20],...
        'Callback', @surfzlim);   
    
function surfzlim(hObj,eventdata) 
    % Called to set zlim of surface in figure axes
    % when user moves the slider control
    shift = 51 - get(hObj,'Value');
   % zlim(ax,[-val val]);            
  

size=512
t=0:size-1
x= zeros(size);
x(2)=100;
%x(3)=100;
%x(4)=100;
%x(5)=100;
%x(6)=100;
%x(7)=100;
%x(8)=100;
%x(9)=100;

x= sin(t/20);

%x(1)=0;
%x(16)=0;
subplot(4,2,1),plot(x);grid
Y = fft(x, size);
              
%subplot(2,1,1),   pl        
%subplot(4,2,3),   plot(t,Px);
subplot(5,2,3),   plot(t,real(Y));grid
subplot(5,2,5),   plot(t,imag(Y));grid

Y=Y.*exp(i*shift);
ax=atan2(imag(Y),real(Y));
subplot(5,2,7),   plot(t,ax);grid
%subplot(4,2,7),   plot(t,imag(Y));
%----------------------------------------------------
x1= zeros(size);



%x1(3)=100;
%x1(4)=100;
%x1(5)=100;
%x1(6)=100;
%x1(7)=100;
%x1(8)=100;
%x1(9)=100;

x1= sin(t/20+shift);
%x1(1)=0;
%x1(16)=0;

subplot(4,2,2),plot(x1);grid
Y1 = fft(x1, size);
%subplot(2,1,2), plot(t,real(Y1));
Px1 = Y1.*conj(Y1)/size;
%subplot(4,2,4), plot(t,Px1);

subplot(5,2,4),   plot(t,real(Y1));grid
subplot(5,2,6),   plot(t,imag(Y1));grid

ax1=atan2(imag(Y1),real(Y1));

%subplot(4,2,8),   plot(t,realimag(Y1));grid
% subplot(5,2,8),   plot(t,abs(atan2(imag(Y1),real(Y1))-atan2(imag(Y),real(Y)))); grid on
   
a1=real(Y);
b1=imag(Y);
a2=real(Y1);
b2=imag(Y1);
%angle=acos((a1.*b1+a2.*b2)./(sqrt(Px1).*sqrt(Px)));
%subplot(5,2,8),   plot(t,angle);grid
subplot(5,2,8),   plot(t,ax1);grid
             % Pyy = Y.*conj(Y)/256;
            % f = 1000 * (0:127)/512;
            % figure(2), plot(f, Pyy(1:128)), grid
            
