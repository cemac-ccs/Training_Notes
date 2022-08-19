#!/bin/bash
export OMP_NUM_THREADS=2
mpirun -np 16 tau_exec  -T mpi,pdt,papi,icpc,ompt,v5 -ompt -ebs ./CoMD-openmp-mpi --xproc 4 --yproc 4 --zproc 1 --nx 40 --ny 40 --nz 40


