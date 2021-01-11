
CC=tau_cc.sh -tau_makefile=$(TAU)/Makefile.tau-icpc-papi-mpi-pdt -tau_options='-optVerbose -optMemDbg -optKeepFiles'

simple: simple.o
	@$(CC) simple.o -o simple
simple.o: simple.c
	@$(CC) -c simple.c
clean:
	/bin/rm -rf simple simple.o *.inst.* *.pdb  profile.* *.trc MULTI_* *.edf NPB*
	
	

