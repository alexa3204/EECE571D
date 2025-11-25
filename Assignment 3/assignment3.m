open('Assignment3_2_MMC.slx')
%sim('Assignment3_2_MMC.slx')

Rarm = 0; % no arm resistace 
Larm = 3e-3; % arm inductance
C_sm = 5e-3; % submodule capacitance 
V_sm = 2e3; % initial cap voltage per sm 

fc = 1650; % carrier frequency 
T = 1/fc; 

