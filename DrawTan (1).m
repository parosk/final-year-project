function [tan_Line_Num] = DrawTan( mes_X,mes_Y,J,V,K,W,sp_Q,sp_U,x,y,step_size)

% Input one array and return the connected Bfield line in that array
% RA --> X ; DEC --> Y

xn = 0;  % position and change in position
yn = 0;
dx = 0;
dy = 0;

if ( x<V || x>J || y<W || y>K )
    tan_Line_Num = [0,0,0,0];
else
    tan_Line_Num = [];
    xn = x;
    yn = y;
    
    while (x<J && x>V && y<K && y>W)
       dx = step_size*cos(FindTanLine( mes_X,mes_Y,sp_Q,sp_U,x,y ));
       dy = step_size*sin(FindTanLine( mes_X,mes_Y,sp_Q,sp_U,x,y ));
       
       tan_Line_Num = [tan_Line_Num ; x,y,dx,dy];
       
       x = x + dx ;
       y = y + dy ;
       
    end
    
    x = xn;
    y = yn;
    
    while (x<J && x>V && y<K && y>W)
       dx = step_size*cos(FindTanLine( mes_X,mes_Y,sp_Q,sp_U,x,y ));
       dy = step_size*sin(FindTanLine( mes_X,mes_Y,sp_Q,sp_U,x,y ));
       
       tan_Line_Num =  [x,y,-dx,-dy;tan_Line_Num];
       
       x = x - dx ;
       y = y - dy ;
       
    end
    
       
end
end