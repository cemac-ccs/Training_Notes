#!/bin/bash
echo "Building and running without TAU:"
make
/bin/rm -f prof* *.o
echo "Running with TAU:"
tau_exec -T serial,clang,rocprofiler -rocm ./vectoradd_hip.exe
