function PlotDominoes2(T,S,c)

figure('units','normalized','outerposition',[0 0 1 1])
hold on
h = plot([0  c.t c.t  0  0], [0  0  c.h  c.h  0]);

axis([-1,c.h+1,0,c.h+1])


% x = sqrt(.25*c.h^2 + .25*c.t^2)*cosd(S(:,1)+atand(c.t/c.h));
% y = sqrt(.25*c.h^2 + .25*c.t^2)*sind(S(:,1)+atand(c.t/c.h));


for k = 1:length(S)-1

rotate(h, [0 0 1], S(k+1,1) - S(k,1), [c.t,0,0])
drawnow
%pause(T(k+1)-T(k))
end
rotate(h, [0 0 1], S(end,1) - S(end-1,1), [c.t,0,0])
drawnow

% pause(1)
% close all
% % plot(T(:),S(:,1))
% plot(T(:),S(:,2))
end

