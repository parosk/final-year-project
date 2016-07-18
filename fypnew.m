raw_Pol_Den = dlmread('dr21mnew.txt');

no_of_data = size(raw_Pol_Den,1);  % no of data 

num_of_tan = 5;   % num of tan line draw
step_size = 0.05; % step size for draw line

R = max(abs(raw_Pol_Den(:,1)));  
J = R - 1;
M = 2*R +1;   % # of RA point  
 
Q = max(abs(raw_Pol_Den(:,2)));
K = Q - 1;
N = 2*Q +1;  % # of DEC point 

ra_co = raw_Pol_Den(:,1);
dec_co = raw_Pol_Den(:,2);
pol_Data = raw_Pol_Den(:,3);
col_Den = raw_Pol_Den(:,4);

for i = 1:no_of_data   % change EofN to circular angle
  if pol_Data(i,1) > 90.0
         pol_Data(i,1) = 450.0 - pol_Data(i,1);
  else pol_Data(i,1) = 90.0 - pol_Data(i,1);
  end
end

sp_Q = cos(2.0*pi*pol_Data/180); % compute stoke parameter Q and U 
sp_U = sin(2.0*pi*pol_Data/180);

bfield_Data = 90 + pol_Data  ;   % compute B field direction

F = griddedInterpolant(ra_co,dec_co,sp_Q);
