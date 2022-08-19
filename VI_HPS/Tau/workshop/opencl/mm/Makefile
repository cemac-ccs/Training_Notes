
TAU_OPENCL_INC=/opt/rocm-3.6.0/opencl/include
TAU_OPENCL_LIB=-L$(TAU_OPENCL_INC)/../lib/x86_64 -L$(TAU_OPENCL_INC)/../lib -lOpenCL
CXX=g++

all: matmult

matmult: matmult.o
	$(CXX) $(TAU_OPENCL_LIB) -g -o $@ $<

matmult.o: matmult.cpp
	$(CXX) -I$(TAU_OPENCL_INC) -g -c $< -o $@

clean: 
	rm -rf matmult matmult.o *core*

run:
	tau_exec -T serial,cupti -opencl ./matmult
