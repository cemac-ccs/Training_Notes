#!/bin/sh
export OMP_NUM_THREADS=4
export TAU_TRACE=1
export TAU_TRACE_FORMAT=otf2

mpirun -np 16 tau_exec -T ompt,v5,papi,mpi -ompt ./bt-mz.B.16

# Launch: vampir traces.otf2 & 

