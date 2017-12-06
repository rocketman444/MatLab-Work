close all

figure(1)
h = plot([0.5  2.1  2.1  0.5  0.5], [0.5  0.5  1.5  1.5  0.5]);
axis equal
xlim([-1 4])
ylim([-2 2])
for k1 = 1:24
    rotate(h, [0 0 1], 0.3*k1)
    refreshdata
    drawnow
end