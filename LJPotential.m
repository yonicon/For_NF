%% Simulation of Lennard-Jones potential and resulting force values
function [Potential,Force] = LJPotential(distance,WellDepth,ZeroPotentialDistance)
% returns [Joules,N] 
JoulePerEv=1.60218e-19;
welldepthJ=WellDepth*JoulePerEv;     %0.5Ev
% ZeroPotentialDistance=0.5e-9; %0.5nm
minimumpotentialdistance=ZeroPotentialDistance*2^(1/6);
Potential=4*welldepthJ*((zeropotentialdistance/distance)^12-(potentialdistance/distance)^6);
Force=48*welldepthJ*(((zeropotentialdistance^12)/(distance^13))-(0.5*(ZeroPotentialDistance^6)/(distance^7)));
 