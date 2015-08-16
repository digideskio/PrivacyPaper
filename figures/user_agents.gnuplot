set terminal epslatex 10 color size 8cm, 6cm
set output "user_agents.tex"
set size 1,1

set noborder

set xzeroaxis
set lmargin 4
set rmargin 2
#set ylabel "Number of Requests"
set xlabel "User Agent ID"

unset key
set datafile separator "|"

plot [0.5:8.5] \
			"../data/user_agents.txt" u 1:2 w boxes

