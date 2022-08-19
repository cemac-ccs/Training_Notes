# With TAU
TAUOP='-optTrackIO -optVerbose'

CC=tau_cc.sh -tau_options=$(TAUOP)  -tau_makefile=$(TAU)/Makefile.tau-icpc-mpi-pdt

foo: foo.c
	$(CC) foo.c -o foo

run: $(TAU_LIB_DIR)/libtau$(TAU_CONFIG) foo
	mpiexec ./foo
	pprof 

$(TAU_LIB_DIR)/libtau$(TAU_CONFIG): clean

clean: 
	/bin/rm -rf foo.o foo out*.dat profile.* *.trc *.edf MULTI__* NPB*
