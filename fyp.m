%DEMO
% This script is to compute the relative intensity of B field at arbitary 
% position at the plane of sky in molecular cloud 
% Also to compare the Bfield and column density strength

% v1.1
% pre-run     :fypfits.m shared parameter : raw_Pol_Den
% followed by :fypplot.m shared parameter : num_of_bfield ,num_of_tan


% Naming rule : 
% Variable - non-capital letter ,saparated by "_"
% Variable(another way) - single Capital letter (except inbuild)
% Array    - start with Capital letter except first word,saparated by "_"
% Function - start with Capital letter , no saparation(except inbuild)

% Runnig note :
% %%%%CHANGE : variables are to be changed at each run
% %%%ALT     : Alternative way to run the script (usually choose between two) 

% This script is written by Paros Kwan King Hong(paroskwan@gmail.com)


%raw_Pol_Den = dlmread('dr21.txt');  %%%ALT manual source file 

no_of_data = size(raw_Pol_Den,1);       % no of data 



num_of_tan = 5;                         %%%%CHANGE % num of tan line draw   
num_of_bfield = 5;                      %%%%CHANGE % num of bfield line draw 
step_size = 0.05;                       %%%%CHANGE % step size for draw line 
R = max(raw_Pol_Den(:,1));
F = min(raw_Pol_Den(:,1));
J = R - 2;                              %%%%CHANGE  % plotted upper bound 
V = F + 2;                              %%%%CHANGE  % plotted lower bound 
M = R - F + 1;                          % # of RA point  
 
Q = max(raw_Pol_Den(:,2));
G = min(raw_Pol_Den(:,2));
K = Q - 2;                              %%%%CHANGE  % plotted  upper bound 
W = G + 2;                              %%%%CHANGE  % plotted lower bound 
N = Q - G + 1;                          % # of DEC point 

pol_Data = zeros(N,M);
col_Den  = zeros(N,M);

% compute polarization data array
for i = 1:no_of_data  
    pol_Data(1 + raw_Pol_Den(i,2) - G,1 + raw_Pol_Den(i,1) - F) = raw_Pol_Den(i,3);
    col_Den (1 + raw_Pol_Den(i,2) - G,1 + raw_Pol_Den(i,1) - F) = raw_Pol_Den(i,4);
end
%column density data array
for i = 1:N
    for j = 1:M 
        if pol_Data(i,j) > 90.0
            pol_Data(i,j) = 450.0 - pol_Data(i,j);
        else pol_Data(i,j) = 90.0 - pol_Data(i,j);
        end
    end
end

% compute stoke parameter Q and U
sp_Q = cos(2.0*pi*pol_Data/180);  
sp_U = sin(2.0*pi*pol_Data/180);

% compute B field direction
bfield_Data = 90 + pol_Data  ;   

[mes_X,mes_Y] = meshgrid(F:R,G:Q);    % meshgrid

% x , y coordinate of starting B-line connecting
b_Line_start = [0,1 ; 0,0.5 ; 0,0 ; 0,-0.5 ; 0,-1];     %%%%CHANGE 

% eval bfield line needed
for i = 1:num_of_bfield 
      magic_str = ['b_Line_',int2str(i),' = DrawBField( mes_X,mes_Y,J,V,K,W,sp_Q,sp_U,b_Line_start(i,1),b_Line_start(i,2),step_size);'];
      eval(magic_str);
end;

%to use one bfield line as referene, which will be equally spaced and act as starting point of tan line. 
b_ref_size = size(b_Line_3);          %%%%CHANGE  
b_ref_size = b_ref_size(1);

sap_of_tan = floor(b_ref_size/(num_of_tan+1));

for i = 1:num_of_tan % eval tan line needed
      magic_str = ['tan_Line_',int2str(i),' = DrawTan( mes_X,mes_Y,J,V,K,W,sp_Q,sp_U,b_Line_3(sap_of_tan*i,1),b_Line_3(sap_of_tan*i,2),step_size);'];
      eval(magic_str);
end;

b_Str_Intensity_Result =[];

for i = 1:(num_of_bfield - 1) 
     for j = 1:num_of_tan
         magic_str = ['[b_str,intensity] = BstrAndIntensity(step_size, b_Line_',int2str(i),',b_Line_',int2str(i+1),',tan_Line_',int2str(j),', mes_X,mes_Y,col_Den,mes_fits_X,mes_fits_Y,fits_Data,ra_org,dec_org,pixel_pol,pixel_fits); b_Str_Intensity_Result = [b_Str_Intensity_Result;[b_str,intensity]];'];
         eval(magic_str);                  %Important ALT in BstrAndIntensity funcition, go have a look before running

     end
end

