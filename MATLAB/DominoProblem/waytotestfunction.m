clear
clc
close all
for spacing = linspace(-1.95,.95,95000);
    hieght = 1;
    width = .01;
    
    collision1 = acosd(spacing/hieght);
    collision2 = collision1 - asind(spacing*sind(collision1)/hieght);
    chanesratio(floor(spacing*100000)+1000000) = collision1/collision2;
   % collision1a(floor(spacing*100000)) = collision1;
    %collision2a(floor(spacing*100000)) = collision2;
end
figure(1)
plot(linspace(-.9995,.95,95000)+100000,chanesratio)



% figure(2)
% plot(linspace(0.00001,.95,95000),collision1a)
% figure(3)
% plot(linspace(0.00001,.95,95000),collision2a)