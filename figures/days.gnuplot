set terminal epslatex 10 color size 8cm, 6cm
set output "days.tex"
set size 1,1

set noborder

set xzeroaxis
set lmargin 4
set rmargin 2
#set ylabel "Number of Requests"
set xlabel "Weekday"

unset key

plot  \
			"../data/days_sum.txt" u 1:xtic(3) w boxes

