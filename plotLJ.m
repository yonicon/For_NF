Xstart=0.0e-9;    %Parameters. 
Xend=5e-9;
Xrange=Xend-Xstart;
NumPoint=3000;
Xstep=Xrange/NumPoint;
x=zeros(1,NumPoint);    
V=zeros(1,NumPoint);
F=zeros(1,NumPoint);
dF=zeros(1,NumPoint);
for i=0:(NumPoint-1)
    x(i+1)=Xstart+(i*Xstep);
    [V(i+1),F(i+1)]=sampledistanceLJ(x(i+1));  %get force and potential

    if i==0                %calculate get dF/dx - first derivative of F
         dF(i+1)=nan;
    else
         dF(i+1)=-(F(i+1)-F(i))/Xstep;
    end
end
for i=0:(NumPoint-1)
    if i==0                %calculate get ddF/dxdx - second derivative of F
    else
         ddF(i+1)=(dF(i+1)-dF(i))/Xstep;
    end
end
JoulePerEv=1.60218e-19;
EvPerJoule=1/JoulePerEv;

%plot(x,V);
DP_fig=figure;
subplot(4,1,1);
DP_Plot=plot(x.*1e9,V.*EvPerJoule);

set(DP_fig,'Name','Interaction Potential vs Separation');
set(get(gca,'Xaxis'),"Visible","off");
set(get(gca,'Xaxis'),'Limits',[0 1.5]);
set(get(gca,'Yaxis'),'Limits',[-1 1]);
%xlabel({'Separation distance','[nm]'});
ylabel({'Potential','[eV]'});
text(0.6,0.7,0,[{'\textbf{Lennard-Jones potential}'},{'$\epsilon=0.5eV$ {well depth}'},{'$\sigma=0.5nm$ {zero potential distance}'}],Interpreter='latex' ...
    ,FontSize=12);
text(0.55,0.3,0,'$V_{LJ}(r)=4 \epsilon[(\frac{ \sigma}{r})^{12}-(\frac{ \sigma}{r})^{6}] $',Interpreter='latex',FontSize=18);
%plot(x,F);
[val,index]=min(V);
% DF_fig=figure;
textboxVtoF='$F=-\frac{\mathrm{d}P}{\mathrm{d}r}\Downarrow$'
subplot(4,1,2);
DF_Plot=plot(x.*1e9,F.*1e9);

%set(DF_fig,'Name','Interaction Force vs. Separation');
set(get(gca,'Xaxis'),"Visible","off");
set(get(gca,'Xaxis'),'Limits',[0 1.5]);
set(get(gca,'Yaxis'),'Limits',[-1 1]);
%xlabel({'Separation distance','[nm]'});
ylabel({'Force','[nN]'});
                            %Draws annotations
xstart=x(index)*1e9;
capos=get(gca,"Position");
xlim=get(gca,"XLim");
ylim=get(gca,"YLim");
xend=xlim(2);
[px,py,width,height]=axescoord2normsize(xstart,ylim(1),xend,ylim(2));
                            %Draws annotation at axes positions

 htxtbx=annotation('rectangle',"Position", ...
 [px,py,width,height], ...
    "FaceColor",[1.00,1.00,0.00], ...
    "FaceAlpha",0.2,LineStyle="none");
[px,py,width,height]=axescoord2normsize(xlim(1),ylim(1),xstart,ylim(2));
                          
 htxtbx=annotation('rectangle',"Position", ...
 [px,py,width,height], ...
    "FaceColor",[00,1.00,1.00], ...
    "FaceAlpha",0.2,LineStyle="none");
%plot (x,dF/dx);
%DdF_fig=figure;
subplot(4,1,3);
DdF_Plot=plot(x.*1e9,dF);

%set(DdF_fig,'Name','Effective Delta K (dForce/dx) vs. Separation');
set(get(gca,'Xaxis'),"Visible","off");
set(get(gca,'Xaxis'),'Limits',[0 1.5]);
set(get(gca,'Yaxis'),'Limits',[-3 3]);
%xlabel({'Separation distance','[nm]'},'Interpreter','latex');
ylabel('${\Delta}K$=$\frac{dF}{dx}$ $[\frac{N}{m}]$','Interpreter','latex');
[mindf,mindfindex]=min(dF);
ylim=get(gca,"YLim");
[px,py,width,height]=axescoord2normsize(x(mindfindex)*10^9,ylim(1),xend,ylim(2));
htxtbx=annotation('rectangle',"Position", ...
 [px,py,width,height], ...
    "FaceColor",[0.00,1.00,0.00], ...
    "FaceAlpha",0.2,LineStyle="none");
%Plot(x,d^2f/dx^2)
%DddF_fig=figure;
annotFtoDk='$\Delta k=-\frac{\mathrm{d}F}{\mathrm{d}r}\Downarrow$';
subplot(4,1,4);
DddF_Plot=plot(x.*1e9,ddF);
[maximum,maxindex]=max(ddF);
text(DdF_Plot.Parent,x(maxindex)*10^9,dF(maxindex),'$\leftarrow \textrm{ Maximum slope}$',Interpreter='latex');
%set(DddF_fig,'Name','dDeltaK/dx vs. Separation');
set(get(gca,'Xaxis'),'Limits',[0 1.5])
set(get(gca,'Yaxis'),'Limits',[-0.2e11 0.4e11])
xlabel({'Separation distance','[nm]'},'Interpreter','latex');
ylabel('$\frac{d{^2}F}{dx{^2}}$ $[\frac{N}{m{^2}}]$','Interpreter','latex');




   