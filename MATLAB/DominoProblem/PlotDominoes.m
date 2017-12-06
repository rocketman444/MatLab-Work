function PlotDominoes(T,S,c)

h = animatedline;

axis([-1,c.h+1,0,c.h+1])


x = sqrt(.25*c.h^2 + .25*c.t^2)*cosd(S(:,1)+atand(c.t/c.h));
y = sqrt(.25*c.h^2 + .25*c.t^2)*sind(S(:,1)+atand(c.t/c.h));


% for k = 1:length(S)
%     addpoints(h,x(k),(y(k)-.000*k));
%     drawnow
% end

for k = 1:length(S)
    addpoints(h,x(k),(y(k)-.0001*k));
    drawnow
end

% plot(T(:),S(:,1))
%  plot(T(:),S(:,2))
end

