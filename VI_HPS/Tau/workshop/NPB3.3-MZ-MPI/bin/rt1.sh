#!/bin/sh
export OMP_NUM_THREADS=4

export TAU_CALLPATH=1
export TAU_CALLPATH_DEPTH=100

mpirun -np 16 tau_exec -T ompt,v5,papi,mpi -ompt -ebs ./bt-mz.B.16


