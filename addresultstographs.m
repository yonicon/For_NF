function [StringOut] = plotFreq(results)
hold on; 
plot(results.simout_RunData.Height_Bias.Data.*10^9,out.simout_RunData.Lockin_Frequency__Hz_.Data);
hold off;
end