#!/bin/bash
/bin/rm -rf traces*
export OMP_NUM_THREADS=2
export TAU_TRACE=1
export TAU_TRACE_FORMAT=otf2
mpirun -np 16 tau_exec  -T mpi,pdt,papi,icpc,ompt,v5 -ompt ./CoMD-openmp-mpi --xproc 4 --yproc 4 --zproc 1 --nx 40 --ny 40 --nz 40


