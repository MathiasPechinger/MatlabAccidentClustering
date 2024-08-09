%% Init
addpath("scripts\")
addpath("scripts\clusterXYPoints\")
clear
close all
format long % avoids truncations for lat lon values

% initialize Variables
AllAccidentsCnt = 0;
BikeAccidentsCnt = 0;
BikeCarAccidentsCnt = 0;
BikeGkfzAccidentsCnt = 0;
BikeFussAccidentsCnt = 0;
BikeKradAccidentsCnt = 0;
BikeSonstigAccidentsCnt = 0;
BikeAccidentsFatalCnt = 0;
BikeAccidentsSeriousCnt = 0;
BikeAccidentsSlightCnt = 0;
accidentBikeAll.month(1:12) = 0;

% setup area of interest

% München
lat_min = 48.05267317702474;
lon_min = 11.419876019612772;
lat_max = 48.23674010626768; 
lon_max = 11.725951930654585;

% Augsburg
% lat_min = 48.33953867624611;
% lon_min = 10.83523134497987;
% lat_max = 48.403955330446095;
% lon_max = 10.93559379233116;

%% Filter & load

%2023
accidentData = readtable("accidentData\csv\Unfallorte2023_LinRef.csv");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    % all accidents in the specified area
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
%         accidentAll.ULICHTVERH(AllAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);

        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
%             accidentBikeAll.ULICHTVERH(BikeAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);
            
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
%             accidentBikeFatal.ULICHTVERH(BikeAccidentsFatalCnt) = accidentData.ULICHTVERH(accidentCnt);
        end

        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
%             accidentBikeSerious.ULICHTVERH(BikeAccidentsSeriousCnt) = accidentData.ULICHTVERH(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstGkfz(accidentCnt)
            BikeGkfzAccidentsCnt = BikeGkfzAccidentsCnt+1;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,1) = lat;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstSonstige(accidentCnt)
            BikeSonstigAccidentsCnt = BikeSonstigAccidentsCnt+1;
        end
    end
end

% 2022

accidentData = readtable("accidentData\csv\Unfallorte2022_LinRef.csv");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    % all accidents in the specified area
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
%         accidentAll.ULICHTVERH(AllAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);

        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
%             accidentBikeAll.ULICHTVERH(BikeAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);
            
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
%             accidentBikeFatal.ULICHTVERH(BikeAccidentsFatalCnt) = accidentData.ULICHTVERH(accidentCnt);
        end

        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
%             accidentBikeSerious.ULICHTVERH(BikeAccidentsSeriousCnt) = accidentData.ULICHTVERH(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstGkfz(accidentCnt)
            BikeGkfzAccidentsCnt = BikeGkfzAccidentsCnt+1;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,1) = lat;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstSonstige(accidentCnt)
            BikeSonstigAccidentsCnt = BikeSonstigAccidentsCnt+1;
        end
    end
end

%2021
accidentData = readtable("accidentData\csv\Unfallorte2021_LinRef.csv");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    % all accidents in the specified area
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
%         accidentAll.ULICHTVERH(AllAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);

        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
%             accidentBikeAll.ULICHTVERH(BikeAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);
            
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
%             accidentBikeFatal.ULICHTVERH(BikeAccidentsFatalCnt) = accidentData.ULICHTVERH(accidentCnt);
        end

        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
%             accidentBikeSerious.ULICHTVERH(BikeAccidentsSeriousCnt) = accidentData.ULICHTVERH(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstGkfz(accidentCnt)
            BikeGkfzAccidentsCnt = BikeGkfzAccidentsCnt+1;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,1) = lat;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstSonstige(accidentCnt)
            BikeSonstigAccidentsCnt = BikeSonstigAccidentsCnt+1;
        end
    end
end

% load dataset 1
accidentData = readtable("accidentData\csv\Unfallorte2020_LinRef.csv");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    % all accidents in the specified area
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
%         accidentAll.ULICHTVERH(AllAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);

        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
%             accidentBikeAll.ULICHTVERH(BikeAccidentsCnt) = accidentData.ULICHTVERH(accidentCnt);
            
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
%             accidentBikeFatal.ULICHTVERH(BikeAccidentsFatalCnt) = accidentData.ULICHTVERH(accidentCnt);
        end

        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
%             accidentBikeSerious.ULICHTVERH(BikeAccidentsSeriousCnt) = accidentData.ULICHTVERH(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstGkfz(accidentCnt)
            BikeGkfzAccidentsCnt = BikeGkfzAccidentsCnt+1;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,1) = lat;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstSonstige(accidentCnt)
            BikeSonstigAccidentsCnt = BikeSonstigAccidentsCnt+1;
        end
    end
end

% load dataset 2
accidentData = readtable("accidentData\csv\Unfallorte2019_LinRef.txt");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstGkfz(accidentCnt)
            BikeGkfzAccidentsCnt = BikeGkfzAccidentsCnt+1;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,1) = lat;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstSonstige(accidentCnt)
            BikeSonstigAccidentsCnt = BikeSonstigAccidentsCnt+1;
        end
    end
end

% load dataset 3
accidentData = readtable("accidentData\csv\Unfallorte2018_LinRef.txt");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstGkfz(accidentCnt)
            BikeGkfzAccidentsCnt = BikeGkfzAccidentsCnt+1;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,1) = lat;
            accidentLocationBikeGkfz(BikeGkfzAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstSonstig(accidentCnt)
            BikeSonstigAccidentsCnt = BikeSonstigAccidentsCnt+1;
        end
    end
end
% load dataset 4
accidentData = readtable("accidentData\csv\Unfallorte2017_LinRef.txt");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
    end
end
% load dataset 5
accidentData = readtable("accidentData\csv\Unfallorte_2016_LinRef.txt");

for accidentCnt = 1:size(accidentData.XGCSWGS84,1)
    [lat,lon] = wgs2double(accidentData.YGCSWGS84(accidentCnt),accidentData.XGCSWGS84(accidentCnt));
    if (lat > lat_min && lat <lat_max) && (lon > lon_min && lon < lon_max)
        AllAccidentsCnt = AllAccidentsCnt+1;
        accidentAll.lat(AllAccidentsCnt) = lat;
        accidentAll.lon(AllAccidentsCnt) = lon;
        accidentAll.uart(AllAccidentsCnt) = accidentData.UART(accidentCnt);
        if accidentData.IstRad(accidentCnt)
            BikeAccidentsCnt = BikeAccidentsCnt+1;
            accidentBikeAll.lat(BikeAccidentsCnt) = lat;
            accidentBikeAll.lon(BikeAccidentsCnt) = lon;
            accidentBikeAll.uart(BikeAccidentsCnt) = accidentData.UART(accidentCnt);
            % Month of accident
            accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) = accidentBikeAll.month(accidentData.UMONAT(accidentCnt)) +1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 1
            BikeAccidentsFatalCnt = BikeAccidentsFatalCnt+1;
            accidentBikeFatal.lat(BikeAccidentsFatalCnt) = lat;
            accidentBikeFatal.lon(BikeAccidentsFatalCnt) = lon;
            accidentBikeFatal.uart(BikeAccidentsFatalCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 2
            BikeAccidentsSeriousCnt = BikeAccidentsSeriousCnt+1;
            accidentBikeSerious.lat(BikeAccidentsSeriousCnt) = lat;
            accidentBikeSerious.lon(BikeAccidentsSeriousCnt) = lon;
            accidentBikeSerious.uart(BikeAccidentsSeriousCnt) = accidentData.UART(accidentCnt);
        end
        if accidentData.IstRad(accidentCnt) && accidentData.UKATEGORIE(accidentCnt) == 3
            BikeAccidentsSlightCnt = BikeAccidentsSlightCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstPKW(accidentCnt)
            BikeCarAccidentsCnt = BikeCarAccidentsCnt+1;
            accidentLocationBikeCar(BikeCarAccidentsCnt,1) = lat;
            accidentLocationBikeCar(BikeCarAccidentsCnt,2) = lon;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstFuss(accidentCnt)
            BikeFussAccidentsCnt = BikeFussAccidentsCnt+1;
        end
        if accidentData.IstRad(accidentCnt) && accidentData.IstKrad(accidentCnt)
            BikeKradAccidentsCnt = BikeKradAccidentsCnt+1;
        end
    end
end

%% Bike Acciendents over the year

month = 1:12;
plot(month, accidentBikeAll.month, 'b-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Month');
ylabel('Number of Accidents');
title('Monthly Bike Accidents');
xlim([1, 12])
grid on;


%% Pie Chart

very_light_blue = [100 149 237]/255;
light_blue = [0 191 255]/255;
dark_blue = [30 144 255]/255;
other_blue = [0 0 255]/255;
other_blue2 = [0 100 255]/255;

figure
allAccidents = BikeCarAccidentsCnt + ...
                BikeFussAccidentsCnt + ...
                BikeSonstigAccidentsCnt + ...
                BikeGkfzAccidentsCnt + ...
                BikeKradAccidentsCnt;

BikeCarAccidentsPercentage = BikeCarAccidentsCnt/allAccidents*100;
BikeFussAccidentsPercentage = BikeFussAccidentsCnt/allAccidents*100;
BikeKradAccidentsPercentage = BikeKradAccidentsCnt/allAccidents*100;
BikeGkfzAccidentsPercentage = BikeGkfzAccidentsCnt/allAccidents*100;
BikeOtherAccidentsPercentage = BikeSonstigAccidentsCnt/allAccidents*100;

pieData = [...
    BikeCarAccidentsCnt, ...
    BikeKradAccidentsCnt, ...
    BikeSonstigAccidentsCnt, ...
    BikeFussAccidentsCnt, ...
    BikeGkfzAccidentsCnt];

explode = [0 1 1 1 1];

labels = {strcat('Car ', num2str(ceil(BikeCarAccidentsPercentage)), '%'), ...
        strcat('Motorbike ', num2str(floor(BikeKradAccidentsPercentage)), '%'), ...
        strcat('Other ', num2str(ceil(BikeOtherAccidentsPercentage)), '%'), ...
        strcat('Pedestrian ', num2str(floor(BikeFussAccidentsPercentage)), '%'), ...
        strcat('Truck ', num2str(ceil(BikeGkfzAccidentsPercentage)), '%')};


pieChart = pie(pieData,explode,labels)
% pieChart = pie(pieData,explode)
% title('Participants for accidents with bikes')
FontSize_ = 14;
pieChart(1).FaceColor = very_light_blue;
pieChart(2).FontSize = FontSize_;
pieChart(3).FaceColor = light_blue;
pieChart(4).FontSize = FontSize_;
pieChart(5).FaceColor = dark_blue;
pieChart(6).FontSize = FontSize_;
pieChart(7).FaceColor = other_blue;
pieChart(8).FontSize = FontSize_;
pieChart(9).FaceColor = other_blue2;
pieChart(10).FontSize = FontSize_;


saveas(gcf,'Results/BikeAccidentParticipants.png')

%% All Bike Accidents
close all
f = figure
geoImg1 = geobubble(accidentBikeAll.lat,accidentBikeAll.lon);
geoImg1.BubbleColorList =[0.9290, 0.6940, 0.1250]
geobasemap topographic
set(gca, 'FontName', 'Serif','FontSize',22)
f.Position = [100 100 920 750];
geolimits([lat_min lat_max],[lon_min lon_max])
saveas(gcf,'Results/BikeAccidentAllMap.png')


%% All Bike Serious
close all
f = figure
geoImg2 = geobubble(accidentBikeSerious.lat,accidentBikeSerious.lon)
geoImg2.BubbleColorList = [0.8500, 0.3250, 0.0980]	;
geobasemap topographic
set(gca, 'FontName', 'Serif','FontSize',22)
f.Position = [100 100 920 750];
geolimits([lat_min lat_max],[lon_min lon_max])
saveas(gcf,'Results/BikeAccidentSeriousMap.png')

%% All Bike Fatal
close all
f = figure
geoImg3 = geobubble(accidentBikeFatal.lat,accidentBikeFatal.lon)
geoImg3.BubbleColorList = 	[0.6350, 0.0780, 0.1840]	;
geobasemap topographic
set(gca, 'FontName', 'Serif','FontSize',22)
f.Position = [100 100 920 750];
geolimits([lat_min lat_max],[lon_min lon_max])
saveas(gcf,'Results/BikeAccidentFatalMap.png')


%% cluster bike accidents
close all
XY = [accidentBikeAll.lon', accidentBikeAll.lat'];
maxdist = 0.06; %[km] max distance between points for the clustering

maxdist = maxdist/110.574;      % Latitude: 1 deg = 110.574 km
                                % Longitude: 1 deg = 111.320*cos(latitude) km
minClusterSize = 36;
method = 'geometric median';
[clustersCentroids,clustersGeoMedians,clustersXY] = clusterXYpoints(XY,maxdist,minClusterSize,method,'merge');

%% plot clusters

figure;
clusterCnt = size(clustersXY,1);
pH = ceil(clusterCnt/2+1);
pW = 2;

for iter = 1:clusterCnt
    subplot(pH,pW,iter);
    geobubble(clustersXY{iter}(:,2)',clustersXY{iter}(:,1)')
end

for iter = 1:clusterCnt
    figure
    geobubble(clustersXY{iter}(:,2)',clustersXY{iter}(:,1)')
    geobasemap topographic
    set(gca, 'FontName', 'Serif','FontSize',14)
    % geolimits([lat_min lat_max],[lon_min lon_max])
    % f.Position = [100 100 560 400];
    saveas(gcf,"Results/BikeAccidentClusters"+num2str(iter)+".png")
    pause(1)
end

figure;

geobubble(clustersCentroids(:,2)',clustersCentroids(:,1)')
geolimits([lat_min lat_max],[lon_min lon_max])


geobasemap topographic
set(gca, 'FontName', 'Serif','FontSize',14)
geolimits([lat_min lat_max],[lon_min lon_max])
% f.Position = [100 100 560 400];
saveas(gcf,'Results/BikeAccidentClusters.png')

