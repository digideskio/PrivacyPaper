set terminal epslatex 10 color size 8cm, 6cm
set output "weeks_zoom.tex"
set size 1,1

set noborder

set xzeroaxis
set lmargin 4
set rmargin 2
#set ylabel "Number of Requests"
set xlabel "Friday"

unset key
WSECS=86400

#set xtics ("" 0, "Mon" 0.5, "" 1, "Tue" 1.5, "" 2, "Wed" 2.5, "" 3, "Thu" 3.5, "" 4, "Fri" 4.5, "" 5, "Sat" 5.5, "" 6, "Sun" 6.5)
set xtics ("00:00" 4  , "03:00" 4.125, "06:00" 4.25, "09:00" 4.375, \
					 "12:00" 4.5, "15:00" 4.625, "18:00" 4.75, "21:00" 4.875, \
			     "24:00" 5)

set yrange [0:1]

plot [4.25:4.75] \
			"../data/weeks/week_17.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_17.txt")) s cumul,\
			"../data/weeks/week_18.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_18.txt")) s cumul,\
			"../data/weeks/week_19.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_19.txt")) s cumul,\
			"../data/weeks/week_20.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_20.txt")) s cumul,\
			"../data/weeks/week_21.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_21.txt")) s cumul,\
			"../data/weeks/week_22.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_22.txt")) s cumul,\
			"../data/weeks/week_23.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_23.txt")) s cumul,\
			"../data/weeks/week_24.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_24.txt")) s cumul,\
			"../data/weeks/week_25.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_25.txt")) s cumul,\
			"../data/weeks/week_26.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_26.txt")) s cumul,\
			"../data/weeks/week_27.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_27.txt")) s cumul,\
			"../data/weeks/week_28.txt" u ($1/WSECS):(1/system("wc -l ../data/weeks/week_28.txt")) s cumul
