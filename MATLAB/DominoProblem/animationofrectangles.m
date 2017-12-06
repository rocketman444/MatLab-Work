clear
close
clc
hieght = 1;
width = .01;
spacing = .7;

collision = acosd(spacing/hieght);
figure(1)
hold on
h = plot([0  width width  0  0], [0  0  hieght  hieght  0]);
i = plot([spacing*1  width+spacing*1 width+spacing*1  spacing*1  spacing*1], [0  0  hieght  hieght  0]);
j = plot([spacing*2  width+spacing*2 width+spacing*2  spacing*2  spacing*2], [0  0  hieght  hieght  0]);
k = plot([spacing*3  width+spacing*3 width+spacing*3  spacing*3  spacing*3], [0  0  hieght  hieght  0]);
axis([0  3  0  3])

axis equal

increment = .05;
thetanow{1} = 90;

thetanow{2} = 90;
theta3now = 90;

while thetanow{1} >= 0 % && k1 > collision % collision condition
if thetanow{1} >= 0
    rotate(h, [0 0 1], -increment,[width,0,0])
   
end
for q = 10

    
    if thetanow{1} <= collision
    thetaprevious{2} = (thetanow{1}-increment) + asind(spacing*sind((thetanow{1}-increment))/sqrt(hieght^2 + spacing^2 -2*hieght*spacing*cosd((thetanow{1}-increment))));
    thetanow{2} = thetanow{1} + asind(spacing*sind(thetanow{1})/sqrt(hieght^2 + spacing^2 -2*hieght*spacing*cosd(thetanow{1})));
    theta2delta = thetaprevious{2} - thetanow{2};
    rotate(i, [0 0 1], theta2delta,[width+spacing*1,0,0])

    end
end
if thetanow{2} <= collision
    theta3previous = (theta2+theta2delta) + asind(spacing*sind((theta2+theta2delta))/sqrt(hieght^2 + spacing^2 -2*hieght*spacing*cosd((theta2+theta2delta))));
    theta3now = theta2 + asind(spacing*sind(theta2)/sqrt(hieght^2 + spacing^2 -2*hieght*spacing*cosd(theta2)));
    theta3delta = theta3previous - theta3now;
    rotate(j, [0 0 1], theta3delta  ,[width+spacing*2,0,0])
end

if theta3now <= collision
    theta3 = theta3now;
    theta4previous = (theta3+theta3delta) + asind(spacing*sind((theta3+theta3delta))/sqrt(hieght^2 + spacing^2 -2*hieght*spacing*cosd((theta3+theta3delta))));
    theta4now = theta3 + asind(spacing*sind(theta3)/sqrt(hieght^2 + spacing^2 -2*hieght*spacing*cosd(theta3)));
    theta4delta = theta4previous - theta4now;
    rotate(k, [0 0 1], theta4delta  ,[width+spacing*3,0,0])
end


thetanow{1} = thetanow{1}-increment;
drawnow
end
















% 
% while k1 < 10000
% if k1 <= fallduration
%     rotate(h, [0 0 1], initialrate+modifierrate*k1,[width,0,0])
%     refreshdata
%     drawnow
% end
% if k1 > startdelay*1 && k1 <= startdelay*1+fallduration
%     rotate(i, [0 0 1],initialrate+modifierrate*(k1-startdelay*1),[width+spacing*1,0,0])
%     refreshdata
%     drawnow
% 
% end
% if k1 > startdelay*2 && k1 <= startdelay*2+fallduration
%     rotate(j, [0 0 1],initialrate+modifierrate*(k1-(startdelay*2)),[width+spacing*2,0,0])
%     refreshdata
%     drawnow
% 
% end
% if k1 > startdelay*3 && k1 <= startdelay*3+fallduration
%     rotate(k, [0 0 1],initialrate+modifierrate*(k1-startdelay*3),[width+spacing*3,0,0])
%     refreshdata
%     drawnow
% 
% end
% k1 = k1+1;
% end