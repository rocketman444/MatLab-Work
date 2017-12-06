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
j = plot([spacing*2  width+spacing*2 width+spacing*2  spacing*2  spacing*2], [0  0  hieght  hieght  0]);
k = plot([spacing*3  width+spacing*3 width+spacing*3  spacing*3  spacing*3], [0  0  hieght  hieght  0]);
l = plot([spacing*4  width+spacing*4 width+spacing*4  spacing*4  spacing*4], [0  0  hieght  hieght  0]);
m = plot([spacing*5  width+spacing*5 width+spacing*5  spacing*5  spacing*5], [0  0  hieght  hieght  0]);
axis([0  3  0  3])

axis equal


maxdominoes = 10;
increment = -.5;
startingincrement = increment;

theta1now = 90;
theta2previous = 90;
theta2now = 90;
theta3previous = 90;
theta3now = 90;
theta4previous = 90;
theta4now = 90;
theta5now = 90;
theta5previous = 90;
theta6now = 90;
theta6previous = 90;

while theta1now >= asind(width/spacing)
    if theta1now >= 0
        rotate(h, [0 0 1], increment,[width,0,0])
        
    end    
    
    if theta1now <= collision1
        theta2previous =     theta1now               + asind((spacing-width/sind(theta2previous))*sind(theta1now)/sqrt(hieght^2 + (spacing-width/sind(theta2previous))^2 -2*hieght*(spacing-width/sind(theta2previous))*cosd(theta1now)));
        theta2now = (theta1now+increment)  + asind((spacing-width/sind(theta2now))*sind((theta1now+increment))/sqrt(hieght^2 + (spacing-width/sind(theta2now))^2 -2*hieght*(spacing-width/sind(theta2now))*cosd((theta1now+increment))));
        theta2delta = theta2now - theta2previous;
        rotate(i, [0 0 1], theta2delta,[width+spacing*1,0,0])
    end
        
    if theta2previous <= collision1
        theta3previous =     theta2previous               + asind((spacing-width/sind(theta3previous))*sind(theta2previous)/sqrt(hieght^2 + (spacing-width/sind(theta3previous))^2 -2*hieght*(spacing-width/sind(theta3previous))*cosd(theta2previous)));
        theta3now = (theta2previous+theta2delta)  + asind((spacing-width/sind(theta3now))*sind((theta2previous+theta2delta))/sqrt(hieght^2 + (spacing-width/sind(theta3now))^2 -2*hieght*(spacing-width/sind(theta3now))*cosd((theta2previous+theta2delta))));
        theta3delta = theta3now - theta3previous;
        rotate(j, [0 0 1], theta3delta  ,[width+spacing*2,0,0])
    end
    
    if theta3previous <= collision1
        theta4previous =     theta3previous               + asind((spacing-width/sind(theta4previous))*sind(theta3previous)/sqrt(hieght^2 + (spacing-width/sind(theta4previous))^2 -2*hieght*(spacing-width/sind(theta4previous))*cosd(theta3previous)));
        theta4now = (theta3previous+theta3delta)  + asind((spacing-width/sind(theta4now))*sind((theta3previous+theta3delta))/sqrt(hieght^2 + (spacing-width/sind(theta4now))^2 -2*hieght*(spacing-width/sind(theta4now))*cosd((theta3previous+theta3delta))));
        theta4delta = theta4now - theta4previous;
        rotate(k, [0 0 1], theta4delta  ,[width+spacing*3,0,0])
    end
    
    if theta4previous <= collision1
        theta5previous =     theta4previous               + asind((spacing-width/sind(theta5previous))*sind(theta4previous)/sqrt(hieght^2 + (spacing-width/sind(theta5previous))^2 -2*hieght*(spacing-width/sind(theta5previous))*cosd(theta4previous)));
        theta5now = (theta4previous+theta4delta)  + asind((spacing-width/sind(theta5now))*sind((theta4previous+theta4delta))/sqrt(hieght^2 + (spacing-width/sind(theta5now))^2 -2*hieght*(spacing-width/sind(theta5now))*cosd((theta4previous+theta4delta))));
        theta5delta = theta5now - theta5previous;
        rotate(l, [0 0 1], theta5delta  ,[width+spacing*4,0,0])
    end
    
    if theta5previous <= collision1
        theta6previous =     theta5previous               + asind((spacing-width/sind(theta6previous))*sind(theta5previous)/sqrt(hieght^2 + (spacing-width/sind(theta6previous))^2 -2*hieght*(spacing-width/sind(theta6previous))*cosd(theta5previous)));
        theta6now = (theta5previous+theta5delta)  + asind((spacing-width/sind(theta6now))*sind((theta5previous+theta5delta))/sqrt(hieght^2 + (spacing-width/sind(theta6now))^2 -2*hieght*(spacing-width/sind(theta6now))*cosd((theta5previous+theta5delta))));
        theta6delta = theta6now - theta6previous;
        rotate(m, [0 0 1], theta6delta  ,[width+spacing*5,0,0])
    end
    
    theta1now = theta1now+increment;
    
    drawnow
    
    if theta1now <= collision1
        increment = startingincrement/decreasingconstant;
    end
    if theta1now <= collision1/pi
        increment = startingincrement/decreasingconstant/decreasingconstant;
    end
    if theta1now <= collision1/pi/pi
        increment = startingincrement/decreasingconstant/decreasingconstant/decreasingconstant;
    end
    if theta1now <= collision1/pi/pi/pi
        increment = startingincrement/decreasingconstant/decreasingconstant/decreasingconstant/decreasingconstant;
    end
    if theta1now <= collision1/pi/pi/pi/pi
        increment = startingincrement/decreasingconstant/decreasingconstant/decreasingconstant/decreasingconstant/decreasingconstant;
    end
end