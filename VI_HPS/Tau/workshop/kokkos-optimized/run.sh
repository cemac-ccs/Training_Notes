#!/bin/bash


spack load hwloc@1.11.9
ldd ./lulesh.host
mpirun -np 8 ./lulesh.host -i 4
if [ $? = 0 ]; then
  echo "Running with TAU:" 
  mpirun -np 8 tau_exec -ebs ./lulesh.host -i 4 
  echo "To view performance data, please use:"
  echo "pprof -a | more "
fi
#

