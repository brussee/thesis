clear;
format longG;

% Define torrent sizes
sizes = [
    25931067
    34111536
    19886271
    29609041
    21775350
    15859836
    16813734
    34505842
] / 1024 / 1024;

fileName = strcat('torrent_creation.dat');
fileID = fopen(fileName);

log = textscan(fileID,'%s %s %*[^\n]');
fclose(fileID);

dates = log{1};
times = log{2};

t = toTimestamp(strcat(dates, {' '}, times));

created = zeros(8, 1);
added = zeros(8, 1);

for j=0:7
    created(j+1) = ( t(j*3+2) - t(j*3+1) ) / sizes(j+1);
    added(j+1) = ( t(j*3+3) - t(j*3+2) ) / sizes(j+1);
end

boxplot([created, added], 'Labels',{'Create torrent','Add torrent'});


function t = toTimestamp(input_string)
    t = posixtime(datetime(input_string, 'InputFormat', 'MM-yy HH:mm:ss.SSS'));
end