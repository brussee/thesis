set terminal svg size 1920,1080 fname 'Arial' fsize 14
set output 'startup_time.svg'
set xtic auto
set ytic auto
set title "Startup time"
set xlabel "Run"
set ylabel "Time (seconds)"

plot "nexus6-startup-cleaninstall.dat" using 1:4 title 'Nexus 6' with linespoints, \
     "samsungS3-startup-cleaninstall.dat" using 1:4 title 'S3' with linespoints

unset output
