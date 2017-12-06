%% Feasibility Student for small suborbital sounding rockets

% This program was written by Bryce Chanes staring May 23rd to test the 
% feasibility of a potential large suborbital payload lifting system.

% It is by tweaking the parameters in this program that information can be
% gleaned about the final project. 

% Many assumptions are included in this program and information outputed by
% this program should only be used as a useful preliminary trade study.

% We will examine both single stage and two stage varients

% Questions or comments regarding this program should be directed toward
% Bryce @ 805-630-8088 or Bandman444@yahoo.com

% Last edited 5/23/17

close all
clear
clc
format compact

%% Single Stage Analysis
clc
clear
% Starting Variables

Isp = 220; % seconds (solid fuel motor ~220s)
g = 9.807; % m/s^2 gravitational constant at sea level
deltav = 2100; % m/s (100km ideal 1,400m/s 1.5FS added
m_payload = 50; %kg customer requirement

f_inert = .331; % ratio of inert mass to total mass
m_prop = m_payload*(exp(deltav/Isp/g)-1)*(1-f_inert)./(1-f_inert.*...
            exp(deltav/Isp/g)); % mass of propellant needed
m_inert = (f_inert/(1-f_inert))*m_prop; % mass of inert components
m_total = m_prop + m_inert + m_payload; % total mass


impulse = Isp*g*m_payload*(exp(deltav/Isp/g)-1)*(1-f_inert)./(1-f_inert.*...
            exp(deltav/Isp/g)) % Newton-seconds
        
% To plot f_inert versus mass use below ~~~~~~~~~~~~~~~~~~~~~~
% set(gcf, 'Position', get(0, 'Screensize'));
% plot(f_inert, m_prop*2.2, f_inert, m_inert*2.2, f_inert, m_total*2.2);
% xlabel('Inert Mass ratio')
% ylabel('Kilograms (kg)')
% grid on


%% Two Stage (two identical stages)

clear
clc

Isp = 220; % seconds (solid fuel motor ~220s)
g = 9.807; % m/s^2 gravitational constant at sea level
deltav = 2100; % m/s (100km ideal 1,400m/s 1.5FS added


f_inert = .331;
f_prop = 1 - f_inert;
m_payload = 50; %kg

m_i_1 = fzero(@(m_i_1) ((2*m_i_1 + m_payload)/((2*m_i_1 + m_payload)-(f_prop*m_i_1)))...
            *(((((2*m_i_1 + m_payload) - ((2*m_i_1 + m_payload) - 2*m_i_1))/2)+((2*m_i_1 + m_payload) - 2*m_i_1))/((((2*m_i_1 + m_payload) - ((2*m_i_1 + m_payload) - 2*m_i_1))/2)+...
            ((2*m_i_1 + m_payload) - 2*m_i_1)-(f_prop*(((2*m_i_1 + m_payload) - ((2*m_i_1 + m_payload) - 2*m_i_1))/2))))-exp(deltav/Isp/g) ,10);
m_prop_1 = f_prop*(((2*m_i_1 + m_payload) - m_payload)/2); % mass of propellant per stage
m_prop_2 = m_prop_1; % By definition
m_i_2 = m_prop_2 / f_prop;
m_o_1 = m_i_1 + m_i_2 + m_payload;
m_o_2 = m_i_2 + m_payload;



%% Two Stage (mass ratios are the same)
clc
clear

Isp = 220; % seconds (solid fuel motor ~220s)
g = 9.807; % m/s^2 gravitational constant at sea level
deltav = 2100; % m/s (100km ideal 1,400m/s 1.5FS added
f_inert = .331;
f_prop = 1 - f_inert;
m_payload = 50; % kg

m_i_2 = fzero( @(m_i_2) ((m_i_2 + m_payload)/((f_inert * m_i_2 + m_payload)))...
                - sqrt(exp(deltav/(Isp*g))) , 10);
m_o_2 = m_i_2 + m_payload;
m_prop_2 = m_i_2 * f_prop;
m_o_1 = fzero( @(m_o_1) (m_o_1/(m_o_1-((m_o_1 - m_o_2) * f_prop)))...
                - sqrt(exp(deltav/(Isp*g))) , 100);
m_i_1 = (m_o_1 - m_o_2);
m_prop_1 = ((m_o_1 - m_o_2) * f_prop);




