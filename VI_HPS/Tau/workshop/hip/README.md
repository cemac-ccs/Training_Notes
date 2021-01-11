# HIP-Examples
Examples for HIP.
This depot should be extracted into the root directory of an existing HIP depot.

We managed to push the following benchmarks with HIP upstreamed on github:

* mixbench: https://github.com/ekondis/mixbench
* GPU-Stream: https://github.com/UoB-HPC/GPU-STREAM

mixbench and GPU-Stream have been added as submodules for this repository, to fetch data for submodules:

    git submodule init

    git submodule update


TAU [http://tau.uoregon.edu]:
	To use with tau:
tau_exec -T serial,rocprofiler -rocm ./a.out
pprof -a

Please contact: sameer@cs.uoregon.edu for any questions. 
