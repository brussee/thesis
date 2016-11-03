set terminal svg size 1900,1000 fname 'Arial' fsize 18
set output 'multichain_scale.svg'
set xrange [0:11000]
set yrange [0:26000]
#set xtic 120
#set ytic 1000
set title "Generation of multichain blocks"
set xlabel "Time (seconds)"
set ylabel "Number of created blocks"

plot \
     "Laptop-[#2599].dat" using 2:1 title 'Laptop' with linespoints, \
     "Nexus_10.[#2599].dat" using 2:1 title 'Nexus 10' with linespoints, \
     "Nexus_6.[#2599].dat" using 2:1 title 'Nexus 6' with linespoints, \
     "Nexus_5.[#2599].dat" using 2:1 title 'Nexus 5' with linespoints, \
     "GT_I9300.[#2599].dat" using 2:1 title 'S3' with linespoints, \
     "Galaxy_Nexus.[#2599].dat" using 2:1 title 'Galaxy Nexus' with linespoints, \
     \
     "Nexus_10.[#2599]-2.dat" using 2:1 title 'Nexus 10' with linespoints, \
     "Nexus_6.[#2599]-2.dat" using 2:1 title 'Nexus 6' with linespoints, \
     \
     "Nexus_10.[#2599]-3.dat" using 2:1 title 'Nexus 10' with linespoints, \
     "Nexus_6.[#2599]-3.dat" using 2:1 title 'Nexus 6' with linespoints, \
     "Nexus_5.[#2599]-2.dat" using 2:1 title 'Nexus 5' with linespoints, \
     "Galaxy_Nexus.[#2599]-2.dat" using 2:1 title 'Galaxy Nexus' with linespoints, \
     \
     "Laptop.[#2599]-2.dat" using 2:1 title 'Laptop' with linespoints, \
     "Nexus_10.[#2599]-4.dat" using 2:1 title 'Nexus 10' with linespoints, \
     "Nexus_6.[#2599]-4.dat" using 2:1 title 'Nexus 6' with linespoints, \
     "Nexus_5.[#2599]-3.dat" using 2:1 title 'Nexus 5' with linespoints, \
     "GT_I9300.[#2599]-2.dat" using 2:1 title 'S3' with linespoints, \
     "Galaxy_Nexus.[#2599]-3.dat" using 2:1 title 'Galaxy Nexus' with linespoints

unset output
