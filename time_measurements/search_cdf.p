set terminal svg size 1920,1080 fname 'Arial' fsize 14
set output 'search_cdf.svg'
set xtic auto
set ytic auto
set title "Search CDF"
set xlabel "Time (seconds)"
set ylabel "Results"

plot "nexus6-search-cleaninstall.dat" using 1:2 title 'Nexus 6' with linespoints

unset output
