set terminal png
set output "PopDiff.png"
set title "Graph of Population Difference"
set ylabel "Population Difference"
set xlabel "Time (au)"
plot "normpop.out" u 1:13 t "Population Difference" w l, "" u 1:2 t "Norm" w l
