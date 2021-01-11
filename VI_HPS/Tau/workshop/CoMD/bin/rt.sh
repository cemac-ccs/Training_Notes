#!/bin/bash
mpirun -np 16 tau_exec  -T mpi,pdt,icpc,papi -ebs ./CoMD-mpi --xproc 4 --yproc 4 --zproc 1 --nx 40 --ny 40 --nz 40


