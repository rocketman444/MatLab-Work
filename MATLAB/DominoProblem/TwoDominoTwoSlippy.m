clear
close all
clc

hieght = 2;
width = .5;
spacing = 1;
maxdominoes = 1;

mass = .3/16;
mu_static = .6;
mu_kinetic = .3;
gravity = 32.2;

increment = -.1;

collision = acosd((spacing-width)/hieght);

collision1 = acosd((spacing-width)/hieght);
collision2 = collision1 - asind(spacing*sind(collision1)/hieght);
chanesratio = collision1/collision2;

figure('units','normalized','outerposition',[0 0 1 1])
hold on
h = plot([0  width width  0  0], [0  0  hieght  hieght  0]);
axis([0  width+spacing*(maxdominoes+hieght) 0 hieght*2])
axis equal
clear
close all
clc

hieght = 2;
width = .25;
spacing = 1;

decreasingconstant = 1.5;

collision1 = acosd((spacing-width)/hieght);
collision2 = collision1 - asind(spacing*sind(collision1)/hieght);
chanesratio = collision1/collision2;
figure('units','normalized','outerposition',[0 0 1 1])
hold on
h = plot([0  width width  0  0], [0  0  hieght  hieght  0]);
i = plot([spacing*1  width+spacing*1 width+spacing*1  spacing*1  spacing*1], [0  0  hieght  hieght  0]);
% j = plot([spacing*2  width+spacing*2 width+spacing*2  spacing*2  spacing*2], [0  0  hieght  hieght  0]);


axis([0  3  0  3])

axis equal


maxdominoes = 10;
increment = -.15;
startingincrement = increment;

theta1now = 90;
theta2previous = 90;
theta2now = 90;
% theta3previous = 90;
% theta3now = 90;


while theta1now >= asind(width/spacing)
 
    % Only domino 1 is moving
    if theta1now >= 0 && theta1now >= collision1
        rotate(h, [0 0 1], increment,[width,0,0])       
    end    
    % Only domino 1 and 2 are moving
    if theta1now <= collision1
        theta2previous =     theta1now               + asind((spacing-width/sind(theta2previous))*sind(theta1now)/sqrt(hieght^2 + (spacing-width/sind(theta2previous))^2 -2*hieght*(spacing-width/sind(theta2previous))*cosd(theta1now)));
        theta2now = (theta1now+increment)  + asind((spacing-width/sind(theta2now))*sind((theta1now+increment))/sqrt(hieght^2 + (spacing-width/sind(theta2now))^2 -2*hieght*(spacing-width/sind(theta2now))*cosd((theta1now+increment))));
        theta2delta = theta2now - theta2previous;
        rotate(i, [0 0 1], theta2delta,[width+spacing*1,0,0])
    end
        
%     if theta2previous <= collision1
%         theta3previous =     theta2previous               + asind((spacing-width/sind(theta3previous))*sind(theta2previous)/sqrt(hieght^2 + (spacing-width/sind(theta3previous))^2 -2*hieght*(spacing-width/sind(theta3previous))*cosd(theta2previous)));
%         theta3now = (theta2previous+theta2delta)  + asind((spacing-width/sind(theta3now))*sind((theta2previous+theta2delta))/sqrt(hieght^2 + (spacing-width/sind(theta3now))^2 -2*hieght*(spacing-width/sind(theta3now))*cosd((theta2previous+theta2delta))));
%         theta3delta = theta3now - theta3previous;
%         rotate(j, [0 0 1], theta3delta  ,[width+spacing*2,0,0])
%     end
    
    theta1now = theta1now+increment;
    
    drawnow
end