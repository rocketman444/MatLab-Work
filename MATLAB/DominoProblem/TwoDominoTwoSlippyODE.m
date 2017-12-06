clear
close all
clc
format compact

%% Constants 
c.g = 32.2;     % Gravitational Acceleration  (ft/sec/sec)
c.m = .1;       % Mass (pounds)
c.h = 1;        % Hieght of dominos (inches)
c.t = .1;       % Thickness of dominos (inches)
c.d = .7;       % Distance betweens centers of dominoes (inches)
c.i1 = 1;       %(1/12)*c.m*(c.h^2 + c.t^2) + c.m*.5*sqrt(c.h^2 + c.t^2);
c.P = 0;

startingtheta = 90-1;

options = odeset('Events',@fallen);
[T,S,te] = ode45(@(t,s) eom(t,s,c),linspace(0,100,10001),[startingtheta,0],options);

PlotDominoes(T,S,c)


te
function ds = eom(~,s,c)

ds = zeros(2,1);
ds(1) = s(2);
ds(2) = (c.m*c.g*cosd(s(1)-atand(c.t/c.h))*c.t/2-c.P*c.h)/c.i1;
end


function [position,isterminal,direction] = fallen(T,S)
position = S(1); % The value that we want to be zero
isterminal = 1;  % Halt integration 
direction = 0;   % The zero can be approached from either direction
end