clear;
format longG;

% Define t0
t0 = toTimestamp('11-17 17:21:31.724');
timestamps = zeros(1, 12);

% Loop all phones
for i=1:12
    
    fileName = strcat('phone', string(i), '.dat');
    fileID = fopen(fileName);
    
    log = textscan(fileID,'%s %s %s %s %s %*[^\n]');
    fclose(fileID);
    
    dates = log{1};
    times = log{2};
    proc  = log{3};
    tag   = log{4};
    video = log{5};
    
    t = toTimestamp(strcat(dates, {' '}, times));
    timestamps(i) = t - t0;
    
end

[h,stats] = cdfplot(timestamps);

stats


function t = toTimestamp(input_string)
    t = posixtime(datetime(input_string, 'InputFormat', 'MM-yy HH:mm:ss.SSS'));
end