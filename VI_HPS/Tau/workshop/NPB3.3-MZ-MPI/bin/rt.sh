#!/bin/sh
export OMP_NUM_THREADS=4
mpirun -np 16 tau_exec -T ompt,v5,papi,mpi -ompt ./bt-mz.B.16

