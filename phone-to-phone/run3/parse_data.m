clear;
format longG;

 % Define t0
 t0 = [
     toTimestamp('11-17 18:32:42.649')
     toTimestamp('11-17 18:39:46.603')
     toTimestamp('11-17 18:41:26.862')
     toTimestamp('11-17 18:44:45.569')
     toTimestamp('11-17 18:46:07.729')
     toTimestamp('11-17 18:47:30.176')
     toTimestamp('11-17 19:05:39.607')
     toTimestamp('11-17 19:07:40.962')
     toTimestamp('11-17 19:46:04.699')
     toTimestamp('11-17 19:59:22.445')
     toTimestamp('11-17 20:02:52.957')
     toTimestamp('11-17 20:07:34.947')
     toTimestamp('11-17 20:08:58.750')
     toTimestamp('11-17 20:09:48.265')
     toTimestamp('11-17 20:10:44.126')
];
timestamps = zeros(15, 13);

% Loop all phones
for i=1:13
    
    fileName = strcat('phone', string(i), '.dat');
    fileID = fopen(fileName);
    
    log = textscan(fileID,'%s %s %*[^\n]');
    fclose(fileID);
    
    dates = log{1};
    times = log{2};
    
    t = toTimestamp(strcat(dates, {' '}, times));
    
    for j=1:15
        timestamps(j, i) = t(j) - t0(j);
    end
    
end

% Loop all runs
for j=1:15
    
    % Sort per run
    timestamps(j, :) = sort(timestamps(j, :));
    
end

boxplot(timestamps);


function t = toTimestamp(input_string)
    t = posixtime(datetime(input_string, 'InputFormat', 'MM-yy HH:mm:ss.SSS'));
end