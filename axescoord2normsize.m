function [normx,normy,normwidth,normheight] = axescoord2normsize(valx,valy,valx2,valy2)
capos=get(gca,"Position");
xlim=get(gca,"XLim");
ylim=get(gca,"YLim");
normx=capos(3)/(xlim(2)-xlim(1))*(valx-xlim(1))+capos(1);
normy=capos(4)/(ylim(2)-ylim(1))*(valy-ylim(1))+capos(2);
normx2=capos(3)/(xlim(2)-xlim(1))*(valx2-xlim(1))+capos(1);
normy2=capos(4)/(ylim(2)-ylim(1))*(valy2-ylim(1))+capos(2);
normwidth=normx2-normx;
normheight=normy2-normy;
end
