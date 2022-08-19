#!/bin/bash
export OMP_NUM_THREADS=4
mpirun -np 16 ./bt-mz.B.16

