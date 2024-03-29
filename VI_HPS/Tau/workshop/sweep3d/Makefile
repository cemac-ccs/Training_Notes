SHELL=/bin/sh

#FC = mpif90
FC = tau_f90.sh

# UNCOMMENT THE ABOVE LINE TO USE TAU
# setenv TAU_MAKEFILE <...>

CPP=/usr/bin/cpp
OPTIMIZE = -O3
FFLAGS = $(OPTIMIZE) 

#CC=mpicc
CC = tau_cc.sh

# UNCOMMENT THE ABOVE LINE TO USE TAU

CFLAGS = $(OPTIMIZE)
.SUFFIXES:
.SUFFIXES: .cpp .f .c .o
.f.o:
	$(FC) $(FFLAGS) -c $<
.c.o:
	$(CC) $(CFLAGS) -c $<

OBJS = driver.o read_input.o decomp.o inner_auto.o timers.o \
        inner.o initialize.o source.o sweep.o flux_err.o octant.o

SINGLE_MSGOBJ = single_stuff.o

TIMER =

PVM_EXE = sweep3d.pvm
PVM_MSGOBJ = pvm_stuff.o
PVM_HOME = /usr/lanl/pvm3
PVM_FFLAGS = $(FFLAGS) -I$(PVM_HOME)/include
PVM_LDFLAGS = -L$(PVM_HOME)/lib/RS6K -lfpvm3 -lpvm3 -lgpvm3

MPI_EXE = sweep3d.mpi
MPI_MSGOBJ = mpi_stuff.o
#MPI_HOME = /usr/mpich/mpich-1.2.6-pgi602/
#MPI_FFLAGS = $(FFLAGS) -I$(MPI_HOME)/include
MPI_FFLAGS = $(FFLAGS) 
#MPI_LDFLAGS = -L$(MPI_HOME)/lib -lmpi

all: mpi

default:
	@echo '1) Make timers.c appropriate for your system.'
	@echo '2) Check the following macros in this makefile:'
	@echo '	FC, CPP, CC, OPTIMIZE, & FFLAGS'
	@echo '	PVM_HOME & MPI_HOME'
	@echo '3) Use:'
	@echo '	% make single	(for single processor version)'
	@echo '	% make pvm	(for PVM version)'
	@echo '	% make mpi	(for MPI version)'

single SINGLE: sweep3d.single

pvm PVM: sweep3d.pvm

mpi MPI: sweep3d.mpi

sweep3d.single: $(OBJS) $(SINGLE_MSGOBJ) $(TIMER)
	$(FC) $(FFLAGS) -o $@ $(OBJS) $(SINGLE_MSGOBJ) $(TIMER) $(LDFLAGS)

sweep3d.pvm: $(OBJS) $(PVM_MSGOBJ) $(TIMER)
	$(FC) $(PVM_FFLAGS) -o $@ $(OBJS) $(PVM_MSGOBJ) $(TIMER) $(PVM_LDFLAGS)

sweep3d.mpi: $(OBJS) $(MPI_MSGOBJ) $(TIMER)
	$(FC) $(MPI_FFLAGS) -o $@ $(OBJS) $(MPI_MSGOBJ) $(TIMER) $(MPI_LDFLAGS)

single_stuff.o: single_stuff.f msg_stuff.h
single_stuff.f: msg_stuff.cpp
	$(CPP) -P msg_stuff.cpp single_stuff.f

pvm_stuff.o: pvm_stuff.f msg_stuff.h
	$(FC) $(PVM_FFLAGS) -c pvm_stuff.f
pvm_stuff.f: msg_stuff.cpp
	$(CPP) -P -DPVM msg_stuff.cpp pvm_stuff.f

mpi_stuff.o: mpi_stuff.f msg_stuff.h
	$(FC) $(MPI_FFLAGS) -c mpi_stuff.f
mpi_stuff.f: msg_stuff.cpp
	$(CPP) -P -DMPI msg_stuff.cpp mpi_stuff.f

clean:
	-rm -f $(OBJS) *_stuff.f *_stuff.o

FRC:
