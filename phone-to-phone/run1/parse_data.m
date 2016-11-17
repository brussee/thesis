clear;
format longG;

% Define t0
t0 = posixtime(datetime('11-16 18:19:56.770', 'InputFormat', 'MM-yy HH:mm:ss.SSS'));
timestamps = [];

% Loop all phones
for i=1:3
    
    fileName = strcat('phone', string(i), '.dat');
    fileID = fopen(fileName);
    
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

