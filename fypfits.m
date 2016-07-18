% This script is a pre script of fyp ,which used to compress the fits file
% And find the intensity at position with polarimetry data 

% v1.1
% followed by :fyp.m :fypfits.m shared parameter : raw_Pol_Den

% Naming rule : 
% Variable - non-capital letter ,saparated by "_"
% Variable(Constant) - single Capital letter (except inbuild)
% Array    - start with Capital letter except first word,saparated by "_"
% Function - start with Capital letter , no saparation(except inbuild)

% Runnig note :
% %%%%CHANGE : variables are to be changed at each run
% %%%ALT     : Alternative way to run the script (usually choose between two) 

% This script is written by Paros Kwan King Hong(paroskwan@gmail.com)

fits_File = 'DR21.fits';             %%%%CHANGE %input fits file 
raw_Fits_Data = fitsread(fits_File); 

pol_File = 'dr21.txt';               %%%%CHANGE %input pol data
raw_Pol_Data = dlmread(pol_File);     


% the origin position of polarization data in the fits grid 
ra_org = 52;                         %%%%CHANGE
dec_org = 54;                        %%%%CHANGE

pixel_fits = 7.5;                    %%%%CHANGE  %in arc second 
pixel_pol = 18;                      %%%%CHANGE  %in arc second 




%fits_Data = raw_Fits_Data           %%%ALT1  to manual input compressed fits file
                                     
fits_Data = 0;                       %%%ALT2  to compress the fit file
no_of_channel = size(raw_Fits_Data,3);
min_channel = 1;                     %%%%CHANGE %choose the min channel used
max_channel = no_of_channel ;        %%%%CHANGE %choose the max channel used
for i = min_channel1:max_channel              
    fits_Data = fits_Data + raw_Fits_Data(:,:,i);
end


% to write the resultant intensity map in fits format
pre = 'sum_';     
fits_File = strcat(pre,fits_File);
fitswrite(fits_Data,fits_File);    





% to find the intensity at the position of polarimetry data 
no_of_data = size(raw_Pol_Data,1);      % no of data 
fits_ra_size = size(fits_Data,2);
fits_dec_size = size(fits_Data,1);

[mes_fits_X ,mes_fits_Y] = meshgrid(1:fits_ra_size,1:fits_dec_size);

den_Data = [];

for i = 1:no_of_data
    meqv_pol_ra  = ra_org  - raw_Pol_Data(i,1) * pixel_pol / pixel_fits;  % naming issue
    meqv_pol_dec = dec_org + raw_Pol_Data(i,2) * pixel_pol / pixel_fits;
    den_Data = [den_Data,interp2(mes_fits_X,mes_fits_Y,fits_Data,meqv_pol_ra,meqv_pol_dec)];
end

raw_Pol_Den = [raw_Pol_Data,den_Data']; % result used in fyp.m




