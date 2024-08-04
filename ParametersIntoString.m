function [StringOut] = ParametersIntoString(results)
Parameters=results.simout_Parameters;
clkpriod=Parameters.Clock_period.Data(1);
dampcoeff=Parameters.Damping_Coeff.Data(1);
mass=Parameters.mass_m.Data(1);
q=Parameters.Quality_Factor.Data(1);

k=Parameters.Spring_Constant_K.Data(1);
f0=Parameters.undamped_resonance_frequence.Data(1);
clkstr=sprintf('$ f_{clk}= %0.5g\\; \\mathit{MHz}  $ Clock frequency\r\n',1/clkpriod/10^6);
dampstr=sprintf('$\\zeta= %0.5g$ Damping coefficient',dampcoeff);
massstr=sprintf('$m= %0.5g \\;\\mathit{\\mu g}$ Effective mass',mass*10^9);
qstr=sprintf('$Q= %0.5g$ Quality factor',q);
kstr=sprintf('$k= %0.5g \\;\\mathit{N/m}$ Spring constant',k);
f0str=sprintf('$f_r= %0.4f \\;\\mathit{Hz}$ Resonance frequency (undamped)',f0);

StringOut=[clkstr,f0str,qstr,dampstr,massstr,kstr];
newplot;
text(0.1,0.5,0,["\textbf{Simulation Parameters:}",clkstr,f0str,qstr,dampstr,massstr,kstr],Interpreter="latex");


