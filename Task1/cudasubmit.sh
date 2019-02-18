#$ -cwd -V
#$ -l h_rt=00:10:00
#$ -l coproc_p100=1

module load cuda

time ./add_cuda_5.x   # Cuda parallelisation with blocking over full grid

time ./add_cuda_4.x   # Cuda parallelisation with blocking over multiple blocks

time ./add_cuda_3.x   # Cuda parallelisation with blocking for a single block

time ./add_cuda_2.x   # Primitive cuda parallelisation with <<<1,256>>>

time ./add_cuda.x     # CUDA computation with 1 GPU thread

time ./add.x            # Serial code
