clear
close all
clc
format compact

%% Constants 
c.g = 32.2;     % Gravatational Acceleration  (ft/sec/sec)
c.m = .1;       % Mass (pounds)
c.l = 1.88;     % Hieght of dominos (inches)
c.t = .1;       % Thickness of dominos (inches)
c.d = .7;       % Distance betweens centers of dominoes (inches)

startingtheta = pi/2-.1;

options = odeset('Events',@fallen);
[T,S,te] = ode45(@(t,s) eom(t,s,c),linspace(0,22,10001),[startingtheta,0],options);

PlotDominoes(T,S,c)


max(T)
function ds = eom(~,s,c)

ds = zeros(2,1);
ds(1) = s(2);
ds(2) = -3*c.g*cos(s(1))/(2*c.l);
end


function [position,isterminal,direction] = fallen(T,S)
position = S(1); % The value that we want to be zero
isterminal = 1;  % Halt integration 
direction = 0;   % The zero can be approached from either direction
end

