clear;
format longG;

% Define t0
startdate = '11-16';
starttime = '18:19:56.770';

t0 = posixtime(datetime(strcat(startdate, {' '}, starttime), 'InputFormat', 'MM-yy HH:mm:ss.SSS'));
timestamps = [];

% Loop all phones
for i=1:3
    
    fileName = strcat('phone', string(i), '.dat');
    fileID = fopen(fileName);
    
    %11-16 18:20:00.256 30270-30270/org.tribler.android V/AddedToChannel: VID_2016-11-16_18_19_44.mp4
    log = textscan(fileID,'%s %s %s %s %s %*[^\n]');
    fclose(fileID);
    
    dates = log{1};
    times = log{2};
    proc  = log{3};
    tag   = log{4};
    video = log{5};
    
    timestamps{i} = posixtime(datetime(strcat(dates, {' '}, times), 'InputFormat', 'MM-yy HH:mm:ss.SSS')) - t0;
    
end

timestamps = cell2mat(timestamps);

cdfplot(timestamps)

