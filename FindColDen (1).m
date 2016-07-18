function [ avg_col_den ] = FindColDen( mes_X,mes_Y,col_Den,x,y )

% To find the intensity at arbitrary position
% The original grid data is at same as polarimetery data
% RA --> X ; DEC --> Y

avg_col_den = interp2(mes_X,mes_Y,col_Den,x,y);
 

end
