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
    "GT_I9300.[#2175].dat" using 2:1 title 'S3' with linespoints, \
    "Nexus_5.[#2175].dat" using 2:1 title 'Nexus 5' with linespoints, \
    "Nexus_6.[].dat" using 2:1 title 'Nexus 6' with linespoints, \
    "PC_Pim.[#2175].dat" using 2:1 title 'Old PC' with linespoints, \
    "S6_Edge.[#2175].dat" using 2:1 title 'S6 Edge' with linespoints

unset output
