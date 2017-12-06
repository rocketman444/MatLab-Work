clc
clear
format compact

fid = fopen('TestAPRSSTUFFLONGER.txt');
textred = textscan(fid,'%s','WhiteSpace','\n');
textred = textred{1};
%celldisp(textred);
a = 1;

packetize = 1;

%% Reading the packets

for b = 1:length(textred)
    
    if isempty(textred{b})
        packetize = 1 + packetize;
        a = 1;
        b = b+1;
    end
    
    packet{packetize}{a} = textred{b};
    a = a+1;
    
end

for c = 1:length(packet)
    
    for d = 1:length(packet{c})
    
        sentence = strsplit(packet{c}{d});
        
        if d == 1 & ~strcmp(sentence(1),'Digipeater')
            Name(c) = sentence(1);
        end
        
        if d == 2 & isempty(Name(c))
            
        
        for e = 1:length(sentence)
            
        if sentence{e} == 'N'
            
            Lat(c) = str2num(sentence{e+1})+str2num(sentence{e+2})/60;
        end
        
                if sentence{e} == 'W' & ~isempty(str2num(sentence{e+1}))
            
            Long(c) = str2num(sentence{e+1})+str2num(sentence{e+2})/60;
        end
        end
    end
end
            
        
        
    
    
    
    
    
    

fprintf('The number of packets read correctly were %d \n',length(packet))
