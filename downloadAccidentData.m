urlList = string([]);  % Create an empty string array
saveList = string([]);  

urlList(1) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2016_EPSG25832_CSV.zip';
urlList(2) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2017_EPSG25832_CSV.zip';
urlList(3) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2018_EPSG25832_CSV.zip';
urlList(4) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2019_EPSG25832_CSV.zip';
urlList(5) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2020_EPSG25832_CSV.zip';
urlList(6) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2021_EPSG25832_CSV.zip';
urlList(7) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2022_EPSG25832_CSV.zip';
urlList(8) = 'https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2023_EPSG25832_CSV.zip';

saveList(1) = 'accidentData/data2016.zip';
saveList(2) = 'accidentData/data2017.zip';
saveList(3) = 'accidentData/data2018.zip';
saveList(4) = 'accidentData/data2019.zip';
saveList(5) = 'accidentData/data2020.zip';
saveList(6) = 'accidentData/data2021.zip';
saveList(7) = 'accidentData/data2022.zip';
saveList(8) = 'accidentData/data2023.zip';


%% download section
for urlIter = 1:size(urlList,2)
    % download
    try
        urlwrite(urlList(urlIter), saveList(urlIter));
        disp('Download completed successfully.');
    catch exception
        disp(['Download failed. ' exception.message]);
    end
    % unzip
    try
        unzip(saveList(urlIter), 'accidentData/');
        disp('Unzip completed successfully.');
    catch exception
        disp(['Unzip failed. ' exception.message]);
    end
end
