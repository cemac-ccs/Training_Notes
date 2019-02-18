#include <iostream>
#include <math.h>

// CUDA Kernel function to add the elements of two arrays on the GPU
__global__
void add(int n, float *x, float *y)
{
  int index = blockIdx.x * blockDim.x + threadIdx.x;  // Current thread within grid
  int stride = gridDim.x * blockDim.x;                // Number of threads in the grid
  for (int i = index; i < n; i+= stride)
    y[i] = x[i] + y[i];
}

int main(void)
{
  int N = 1<<20; // 1M elements. 1 should be left shifted 20 times, ie 2^20

  // Allocate Unified Memory -- accessible from CPU or GPU

  float *x, *y;
  cudaMallocManaged(&x, N*sizeof(float));    // CUDA equivalent of defining a
  cudaMallocManaged(&y, N*sizeof(float));    // pointer of float type with size N

  // initialize x and y arrays on the host
  for (int i = 0; i < N; i++) {
    x[i] = 1.0f;
    y[i] = 2.0f;
  }

  // Run kernel on 1M elements across 256 GPU threads
  int blockSize = 256;                               // 256 threads per GPU block on P100
  int numBlocks = (N + blockSize - 1) / blockSize;   // round up the number of blocks

  add<<<numBlocks,blockSize>>>(N, x, y);


  // Wait for GPU to finish before accessing on host
  cudaDeviceSynchronize();

  // Check for errors (all values should be 3.0f)
  float maxError = 0.0f;
  for (int i = 0; i < N; i++)
    maxError = fmax(maxError, fabs(y[i]-3.0f));
  std::cout << "Max error: " << maxError << std::endl;

  // Free memory
  cudaFree(x);    // CUDA equivalent of delete[] x;
  cudaFree(y);

  return 0;
}
                      