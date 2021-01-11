CC=nvcc
all: matmult

matmult: matmult.o
	$(CC) -o $@ $<

matmult.o: matmult.cu
	$(CC) -g -c $< -o $@

clean: 
	rm -rf matmult matmult.o prof*

run:
	tau_exec -T cupti,serial -cupti ./matmult
