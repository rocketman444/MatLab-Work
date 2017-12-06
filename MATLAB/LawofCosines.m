clear
clc
close all


d = .7;
h = 1.88;
theta1 = linspace(90,0,1001);
theta2 = theta1 + asind(d*sind(theta1)./sqrt(h^2 + d^2 -2*h*d.*cosd(theta1)));



plot(theta1,theta2)

axis equal
grid on
xlabel('Theta1')
ylabel('Theta2')