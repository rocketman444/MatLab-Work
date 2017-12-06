function x = mapplotter(Lat, Long)

Lat(1) = 0;
Long(1) =0;


image(imread('3134-110112.png'))

hold on

modifierx = 476-476/2*(Long-110); 
modifiery = 844-844/3*(Lat - 31);

scatter(modifierx,modifiery,'filled','MarkerFaceColor',[0 0 0])
axis equal


end