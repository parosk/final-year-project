function [ b_field_strength , average_intensity ] = BstrAndIntensity( step_size, b_1,b_2,tan_1,mes_X,mes_Y,col_Den,mes_fits_X,mes_fits_Y,fits_Data,ra_org,dec_org,pixel_pol,pixel_fits)
% to compare two b field length along one tengent line 

min_dis_1 = 100;
min_dis_2 = 100;
%dis_1;   %distance_1
%dis_2;   %distance_2


%r;a;b;c;d;
%n;

b_one_size = size(b_1);
b_one_size = b_one_size(1);

b_two_size = size(b_2);
b_two_size = b_two_size(1);

tan_one_size = size(tan_1);
tan_one_size = tan_one_size(1);

for i = 1:b_one_size
    for j = 1:tan_one_size 
        dis_1 = (tan_1(j,1) - b_1(i,1))*(tan_1(j,1) - b_1(i,1))+(tan_1(j,2) - b_1(i,2))*(tan_1(j,2) - b_1(i,2));
        dis_1 = sqrt(dis_1);
        
        if dis_1 <= min_dis_1
           min_dis_1 = dis_1;
           a = i;
           b = j;
        end
    end
end

for i = 1:b_two_size
    for j = 1:tan_one_size 
        dis_2 = (tan_1(j,1) - b_2(i,1))*(tan_1(j,1) - b_2(i,1))+(tan_1(j,2) - b_2(i,2))*(tan_1(j,2) - b_2(i,2));
        dis_2 = sqrt(dis_2);
        
        if dis_2 <= min_dis_2
           min_dis_2 = dis_2;
           c = i;
           d = j;
        end
    end
end

if b>d
    n = d;
    d = b;
    b = n;
end

r = double(d-b)*step_size;
inten = 0;


for i = b:d
   %The following command use column density evaluated at pol data position  %%%ALT
   %inten =  inten  + FindColDen( mes_X,mes_Y,col_Den,tan_1(i,1),tan_1(i,2));
   
   % The following command directly use fits data                            %%%ALT
   inten =  inten + FindFitsColDen(mes_fits_X,mes_fits_Y,fits_Data,tan_1(i,1),tan_1(i,2),ra_org,dec_org,pixel_pol,pixel_fits);
   
end


b_field_strength = 1/r;   % take b field strength as the inverse of normal distance between two b line 
average_intensity = inten/r;

end

