clc
clear
format compact

fid = fopen('TestAPRSSTUFFshort.txt');
textred = textscan(fid,'%s');
textred = textred{1};
%celldisp(textred);
q = 1;


    for k = 1:length(textred)        
        
        if strcmp(textred{k},'N')
            LatLongAlt(1,q) = str2num(textred{k+1}) + str2num(textred{k+2})/60;
        end
        
        if strcmp(textred{k},'W')
            LatLongAlt(2,q) = str2num(textred{k+1}) + str2num(textred{k+2})/60;
        end
        
        if strcmp(textred{k},'alt')
            LatLongAlt(3,q) = str2num(textred{k+1});
            q = q +1;
     
        end
        
    end
    %fprintf('The number of packets read correctly were %d \n',length(packet))
    %length(LatLongAlt)
    %textred