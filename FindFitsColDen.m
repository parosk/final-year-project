function [ avg_fits_col_den ] = FindFitsColDen( mes_fits_X,mes_fits_Y,fits_Data,pol_ra,pol_dec,ra_org,dec_org,pixel_pol,pixel_fits)

% To find the intensity at arbitrary position at Fits data mesh 
% 
% RA --> X ; DEC --> Y
eqv_pol_ra  = ra_org  - pol_ra * pixel_pol / pixel_fits;
eqv_pol_dec = dec_org + pol_dec * pixel_pol / pixel_fits;
    
avg_fits_col_den = interp2(mes_fits_X,mes_fits_Y,fits_Data,eqv_pol_ra,eqv_pol_dec);
 

end