set terminal epslatex 10 color size 8cm, 6cm
set output "day_distrib.tex"
set size 1,1

set noborder

set xzeroaxis
set lmargin 4
set rmargin 2
#set ylabel "Number of Requests"
set xlabel "Time of day"

unset key

plot  \
			"../data/days_sorted.txt" u ($1/3600.):(1/system("wc -l ../data/days_sorted.txt")) s cumul

