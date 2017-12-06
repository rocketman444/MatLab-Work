% Run the next line in the command prompt
% D:\Users\chane\Downloads\direwolf-1.4-win2\direwolf.exe >COM2
fclose(instrfind)
clc
clear
close all
format compact

s = serial('COM1');
fopen(s);

g=1;
c=2;
Lat(c)=0;
Lat(c-1)=0;
Long(c)=0;
Long(c-1)=0;
linereader =1;
while g == 1
    onepacket = fgets(s);
fprintf(onepacket)
    packet{linereader}=onepacket;
    
    for d = 1:length(onepacket)
        
        sentence = strsplit(onepacket);

        
        for e = 1:length(sentence)
            
            if sentence{e} == 'N' & ~isempty(str2num(sentence{e+1}))
                
                Lat(c) = str2num(sentence{e+1})+str2num(sentence{e+2})/60;
            end
            
            if sentence{e} == 'W' & ~isempty(str2num(sentence{e+1}))
                
                Long(c) = str2num(sentence{e+1})+str2num(sentence{e+2})/60;
            end
            
            if Long(c) ~= 0 && Long(c) ~= Long(c-1)
                fprintf('My Latitude is %6.4f and my longitude is %7.4f. \n',Lat(c),Long(c))
                fprintf('I have recorded %g readable packets \n',length(Lat))
                c=c+1;
                
                Long(c)=0;
                
            end
            
        end
    end
    linereader = linereader+1;
    mapplotter(Lat,Long)
    pause(1)
end


fclose(s);