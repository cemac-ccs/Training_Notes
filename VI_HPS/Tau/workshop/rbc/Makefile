TAUOPTS = -optVerbose -optKeepFiles -optMemDbg
#CXX= tau_cxx.sh -tau_makefile=$(TAU)/Makefile.tau-icpc-mpi-pdt $(TAUOPTS) $(TAU_CXX)
CXX= mpicxx
CXXFLAGS = -DMPICH_IGNORE_CXX_SEEK -O3 -g

simple: simple.o
	$(CXX) $< -o $@
simple.o: simple.cpp
	$(CXX) -c $< $(CXXFLAGS) 
clean:
	/bin/rm -rf simple simple.o *.inst.* *.pdb  profile.* *.trc MULTI_* *.edf NPB*
run: simple
	mpirun -np 4 tau_exec -memory_debug ./simple
	#TAU_MEMDBG_PROTECT_ABOVE=1 
	
	
	

