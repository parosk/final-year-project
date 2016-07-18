% This script is to plot the cloud graph 

% v1.1
% pre-run:fyp.m shared parameter : num_of_bfield ,num_of_tan

% Naming rule : 
% Variable - non-capital letter ,saparated by "_"
% Variable(Constant) - single Capital letter (except inbuild)
% Array    - start with Capital letter except first word,saparated by "_"
% Function - start with Capital letter , no saparation(except inbuild)

% This script is written by Paros Kwan King Hong(paroskwan@gmail.com)

figure
contourf(mes_X,mes_Y,col_Den)
colormap(gray)
title('DR21 Data')                %%%%CHANGE
hold on


for i = 1:num_of_bfield 
      magic_str = ['quiver(b_Line_',int2str(i),'(:,1),b_Line_',int2str(i),'(:,2),b_Line_',int2str(i),'(:,3),b_Line_',int2str(i),'(:,4),0.05,''blue'')'];
      eval(magic_str);
end;

for i = 1:num_of_tan
      magic_str = ['quiver(tan_Line_',int2str(i),'(:,1),tan_Line_',int2str(i),'(:,2),tan_Line_',int2str(i),'(:,3),tan_Line_',int2str(i),'(:,4),0.05,''red'')'];
      eval(magic_str);
end;

hold off