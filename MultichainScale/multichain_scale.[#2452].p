set terminal svg size 1900,1000 fname 'Arial' fsize 18
set output 'multichain_scale.svg'
#set xrange [0:11000]
#set yrange [0:26000]
#set xtic 120
#set ytic 1000
set title "Generation of multichain blocks"
set xlabel "Time (seconds)"
set ylabel "Number of created blocks"

plot \
    "GT_I9300.[#2452].dat" using 1:2 title 'S3' with linespoints, \
    "GT_I9300.[#2452]-2.dat" using 1:2 title 'S3' with linespoints, \
    "Nexus_6.[#2452].dat" using 1:2 title 'Nexus 6' with linespoints, \
    "Nexus_6.[#2452]-2.dat" using 1:2 title 'Nexus 6' with linespoints

unset output
