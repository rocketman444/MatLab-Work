clear
close all
clc

hieght = 2;
width = .5;
spacing = 1;
maxdominoes = 1;

mass = .3/16;
mu_static = .6;
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

%%Preload info
master = cell(1,maxdominoes+1);
for q=1:maxdominoes
    plotty{q} = plot([spacing*q  width+spacing*q width+spacing*q  spacing*q  spacing*q], [0  0  hieght  hieght  0]);
    master{q}(1) = 90;
    master{q}(2) = 90;
end
master{q+1}(1) = 90;
master{q+1}(2) = 90;
master{1}(3) = increment;
% master = cell(1,maxdominoes+1);

% What I am proposing is the following structure

% master is a 1 dimensional cell

% The location in the cell is which domino to look at e.i. master{1} is the
% first domino, while master{7} contains the matric of values for the 7th
% domino. When accessed the cell location will contain another 1 matrix.
%
% The first column will be the thetaprevious term
% The second column will be the thetanow term
% The third column will be the thetadelta term
a = 1;

while master{1}(1) >= asind(width/spacing)
    if master{1}(1) >= 0
        rotate(h, [0 0 1], master{1}(3),[width,0,0])
        master{1}(1) = master{1}(1) + master{1}(3);


                    for n = 1:maxdominoes

            if  master{n}(1) <= collision
                master{n+1}(1) =  master{n+1}(2);
                master{n+1}(2) = (master{n}(1) + master{n}(3))    + asind((spacing-width/sind(master{n+1}(2)))*sind((master{n}(1)+master{n}(3)))/sqrt(hieght^2 + (spacing-width/sind(master{n+1}(2)))^2 -2*hieght*(spacing-width/sind(master{n+1}(2)))*cosd((master{n}(1)+master{n}(3)))));
                master{n+1}(3) =  master{n+1}(2) - master{n+1}(1);
                rotate(plotty{n}, [0 0 1], master{n+1}(3)  ,[width+spacing*n,0,0])
                  %drawnow
                
                
                
            end
                    end
                            frictionforce(a) = mu_static*mass*gravity*.5*sqrt(hieght^2 + width^2)*cosd(master{1}(1)+atand(width/hieght));
            a=a +1;
        end
end
mu_static*mass*gravity
close all
plot(frictionforce)