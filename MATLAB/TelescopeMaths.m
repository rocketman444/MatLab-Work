% Telescope Video Tracker Calculations

% Bryce Chanes 2017

clc
clear
close all

a = 32.2 * 20; % feet/sec^2
t = linspace(0,10,10000); % second
r = 1000; % feet

theta = (180/pi)*atan2((.5*a*t.^2),r);

omega = (180/pi)*a*t*r ./ (r^2 + .25 * a^2 * t.^4);
max_omega = (180/pi)*(3^.75 / 2^1.5) * sqrt(a/r);
max_omega_time = sqrt(2)/(sqrt(sqrt(3)))*sqrt(r/a);
alpha = (180/pi)*( a * r^3 - .75 * r * a^3 * t.^4 ) ./ ( r^2 + .25 * a^2 * t.^4).^2;

figure('units','normalized','outerposition',[0 0 1 1])
subplot(3,1,1)
plot(t,theta)
ylabel('Angle (deg)')
xlabel('Time (seconds)')

subplot(3,1,2)
plot(t,omega)
ylabel('Angular Velocity (deg/sec)')
xlabel('Time (seconds)')
%line([max_omega_time,max_omega_time], [0,max_omega]);

subplot(3,1,3)
plot(t,alpha)
ylabel('Angular Acceleration (deg/sec/sec)')
xlabel('Time (seconds)')



%% Animation

pause(3)

figure('units','normalized','outerposition',[0 0 3/4 1])

increment = 100/1000;
frame = 1;
tic
while frame < length(t)
    line([0,r*cosd(theta(frame))],[0,r*sind(theta(frame))]);
    pause(increment)
    frame = frame + 1000*increment;
    axis([0 r 0 r]);
 
end

    
    
    toc
    
    
    
    
    