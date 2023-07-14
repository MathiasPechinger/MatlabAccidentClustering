function [lat_out, lon_out] = wgs2double(lat,lon)  
    lat = cell2mat(lat);
    lat = strrep(lat, ',', '.');
    lat_out = str2double(lat);
    
    lon = cell2mat(lon);
    lon = strrep(lon, ',', '.');
    lon_out = str2double(lon);
end

