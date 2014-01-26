%% multiple decay constants
x = 0:0.01:20;
y1 = [200*exp(-0.05*x).*sin(x);
      300*exp(-0.04*x).*sin(x)];
y2 = [0.8*exp(-0.5*x).*sin(10*x);
      0.6*exp(-0.4*x).*sin(5*x)];
[AX,H1,H2] = plotyy(x,y1,x,y2);


set(get(AX(1),'Ylabel'),'String','Slow Decay') 
set(get(AX(2),'Ylabel'),'String','Fast Decay') 

xlabel('Time (\musec)') 
title('Multiple Decay Rates')

set(H1,'LineStyle','--')
set(H2,'LineStyle',':')


%% exp step decay
figure
X = linspace(0,2*pi,50)';
Y = (exp(0.3*X).*sin(3*X));
h = stem(X,Y);

%% plot
x=linspace(0,1,100);
y=-cos(2*pi*(4500000)*x)+sin(2*pi*(4500000)*x);
plot (x,y)
%% sinc function, filter response, i.e. fourier transform of the step function
%% Filter Definition
% Filter-related parameters
nSamp = 8; % Oversampling factor
Span = 10;        % Filter span in symbols
rolloff = 0.25;   % Roloff factor of filter
% Create a square-root raised cosine filter
rrcFilter = rcosdesign(rolloff,Span,nSamp);

% Plot the impulse response
impz(rrcFilter);
rrcFilterFactor=rrcFilter * 13;
stem(rrcFilterFactor);
hold on;

%% continuous time square waves

a=5;
f=5;
dc=50;
f=f*2*pi;
t=0:.001:1;
y=a*square(f*t,dc);
plot(t,y);
axis([0 1 -10 10]);
hold on;