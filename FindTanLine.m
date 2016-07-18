function [ angle ] = FindTanLine( mes_X,mes_Y,sp_Q,sp_U,x,y )

% To find the direction of tangent line at arbitrary position
% The angle output is at radian unit,polar coordinate 
% RA --> X ; DEC --> Y

avg_Q = interp2(mes_X,mes_Y,sp_Q,x,y);
avg_U = interp2(mes_X,mes_Y,sp_U,x,y);

angle = atan2(avg_U,avg_Q);

if angle*90/pi<0
    angle = (angle/2+2*pi/2);
	 
 else angle = angle/2;
end
end
