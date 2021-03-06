function [fillhandle, msg] = vshade(ax, ypoints, left, right, color, edge, alpha)
%USAGE: [fillhandle, msg] = fill(xpoints, upper, lower, color, edge, add, transparency)
%This function will fill a region with a color between the two vectors provided
%using the Matlab fill command.
%
%fillhandle is the returned handle to the filled region in the plot.
%xpoints= The horizontal data points (ie frequencies). Note length(Upper)
%         must equal Length(lower)and must equal length(xpoints)!
%upper = the upper curve values (data can be less than lower)
%lower = the lower curve values (data can be more than upper)
%color = the color of the filled area 
%edge  = the color around the edge of the filled area
%add   = a flag to add to the current plot or make a new one.
%transparency is a value ranging from 1 for opaque to 0 for invisible for
%the filled color only.
%
%John A. Bockstege November 2006;
%Example:
%     a=rand(1,20);%Vector of random data
%     b=a+2*rand(1,20);%2nd vector of data points;
%     x=1:20;%horizontal vector
%     [ph,msg]=jbfill(x,a,b,rand(1,3),rand(1,3),0,rand(1,1))
%     grid on
%     legend('Datr')
if nargin<7;alpha=.5;end %default is to have a transparency of .5
if nargin<6;edge='k';end  %dfault edge color is black
if nargin<5;color='b';end %default color is blue

if length(left)==length(right) && length(right)==length(ypoints)
    msg='';
    filled=[left,fliplr(right)];
    ypoints=[ypoints,fliplr(ypoints)];
    fillhandle=fill(filled,ypoints,color, 'Parent', ax);%plot the data
    set(fillhandle,'EdgeColor',edge,'FaceAlpha',alpha,'EdgeAlpha',alpha);%set edge color
else
    msg='Error: Must use the same number of points in each vector';
end
