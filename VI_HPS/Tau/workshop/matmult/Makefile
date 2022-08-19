F90=mpif90
#F90=tau_f90.sh
FFLAGS=-g 
LIBS=

matmult: matmult.f90
	$(F90) $(FFLAGS) matmult.f90 -o matmult $(LIBS)
scorep: 
	tau_rewrite -T scorep ./matmult -o matmult.i 
	llsubmit run.ll

clean:
	/bin/rm -rf *.o matmult profile.* MULTI__* *.trc *.edf *.otf *.def* *events*  *.inst.* *.pdb *tau* *.i *.out *.err scorep* NPB* matmult.i *tau*
