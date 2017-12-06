%%-----------main code-----------------
% Setting the global variables
global r lambda mu sig D
% Define values
r = 0.06;
lambda = 0.01;
mu = 0.18;
sig = 0.09;
D = 0.18;
% Define boundary points
g01 = 0;
g02 = 100;
% Define tspan
w0 = 0.001;  
wf = 10;   
gf = [g01 g02];
gwspan = [w0 wf]; % reverse the order of tspan for "Final vlaue problem"
options = odeset('Events',@yzero);
[wg,g,te] = ode45(@dg,gwspan,gf,options);
%%--------------ODE------------------------
function gdot = dg(w,g)
% Define parameters values
global r lambda mu sig;
gdot = zeros(2,1);
gdot(1) = g(2);
gdot(2) = (2/sig^2)*(r*g(1)-((r-lambda)*w+mu)*g(2));
end
%%----------------Event function ----------------------------
function [value,isterminal,direction] = yzero(~,y)
% Locate the time when the value is zero
% increasing direction and don't stop integration.
value = y(1);   % detect value at zero
isterminal = 0; % don't stop the integration 
direction = 1;  % positive direction only
end