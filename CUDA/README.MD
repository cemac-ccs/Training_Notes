# CUDA Training Course - 2019/02/18

(Course Slides can be found at https://goo.gl/NMGpWk)


## Part 1 - GPU Architectures

* In reducing voltage to reduce power usage, you start to come up against a problem of blurring - cannot tell the difference between  a one and a zero.
* Hybrid systems used, where CPUs do management and co-processors do computation.
* A GPU has a highly different architecture than a CPU. Nvidea and AMD create tailored architectures for HPC
* The intel pushed alternative, the Xeon Phi, has stopped being supported by Intel.
* Nvidea is the standard chip - the Tesla GPU has same architecture as GeForce
* AMD Fire pro used a bit less - evolved from Radeon

### Accelerated systems

* CPUs and accelerator GPUs are used together, with GPUs doing most of the computation and CPUs doing  the overhead (like MPI master). Comms are done through the PCI/e bus.
* You can have multiple CPUs connected through shared memory environments, but GPUs do not share memory.
* Ideally you would only have one CPU per GPU.
* Smallest amount of GPU you can request from arc3 is 6 cores and 32GB of memory.
* ARC3 has 6 nodes with 2X12 core CPUs, 128GB memory, 4XP100 GPUs and 2 nodes with 2X12 core CPUs, 128gb memory and 2X K80 GPUs
* The node requests for cuda code uses #$ -l coproc_p100=1/2/3/4 where the numbers are related to the number of "quarter nodes"
* CUDA is proprietary, and has advantage over OpenCL generic alternative similar to Ifort against gfortran
* NVLink is an alternative to PCI/e interconnectivity which connects multiple GPUs, but it is expensive and not available on arc3. Interconnectivity does not represent a significant bottleneck so not particularly needed. JADE in Oxford has this. 

## Part 2 - Intro to CUDA programming

* GPUs are _not_ task parallel.
* Even PyCUDA uses C for the CUDA bits - you can't get away from C
* Effectively writing two separate chunks of code, one for the CPU and one for the GPU (called the GPU Kernel)
* CUDA uses _stream_ computing
  * Data decomposed into stream of elements
  * Single kernel (computational function) operates on each element
* CUDA has new vector types `dim2, dim3, dim4` for _n_ dimensional data.
* Location in threads or grids of processors (low level control) held as `dim3` variable.
* **The nvcc compiler requires the `.cu` file extension to understand the CUDA commands** 

A worked example is [here](https://docs.google.com/document/d/1xhdO4oUoXed0ohp-9PlcrINXLj68S44Dio3MW1ZdzXw/edit), and the associated files are in this repository in the Task1 folder

* There are a series of CUDA libraries available [here](https://developer.nvidia.com/tools-ecosystem) on the nvidia website, such as CUDA versions of FFTW and BLAS. There are also containerised applications that can be run through singularity on the HPCs.

* **nvcc** does not work well with _all_ compilers. The list is in the documentation _somewhere_ and is difficult to find.

## Part 3 - CUDA memory management

* Kernel calls are non-blocking. This means that to best use the available resources you must implement blocking manually.
* You can use cudaThreadSynchronise() from the host to block until GPU kernels have completed
* syncthreads() can be used inside the kernel to synchronise between threads within the same block.
* You cannot synchronise between threads in the same block, but a kernel exit will necessarily guarantee synchronisation
* Memory management in cuda is based mainly on remembering that **the shared memory for GPU threads is different than the memory usedf by the host**


