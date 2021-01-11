#Makefile for driver directory of SAMARC

#### Defns ##########
CXX           = mpicxx
CXXFLAGS      = -Wall -fno-implicit-templates  -fPIC
#CXXFLAGS      = -fPIC  
#CPPFLAGS      = -I/opt/mpich2-1.0.5/include
SAMINT_CXX     = mpicxx

CC            = mpicc
CC            = gcc
CFLAGS        = -fPIC

F90           = gfortran
FFLAGS        = -g -fPIC

PY_INCL       = /usr/tce/packages/python/python-2.7.16/include/python2.7
NUMPY_INC     = /usr/tce/packages/python/python-2.7.16/lib/python2.7/site-packages/numpy/core/include/

#### Codes ##########
CXX_OBJS  = SAMINT.o

F90_OBJS  = fortmthds.o

PY_OBJS   = pycintfc.o samint_wrap.o

#### Rules ##########
all:	$(CXX_OBJS) $(F90_OBJS) $(PY_OBJS) linkcheck.o
	$(CXX) -fPIC -shared $(PY_OBJS) $(CXX_OBJS) $(F90_OBJS) \
	-o _samint.so

pycintfc.o: pycintfc.C
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c pycintfc.C -I$(PY_INCL)  -I$(NUMPY_INC)

samint_wrap.o: samint_wrap.c
	$(SAMINT_CXX) $(CXXFLAGS) $(CPPFLAGS) -c samint_wrap.c -I$(PY_INCL) -I$(NUMPY_INC)

samint_wrap.c: swig/samint.i
	cd swig; $(MAKE) all
	cp sw.c samint_wrap.c

linkcheck.o: linkcheck.C
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c linkcheck.C 

fortmthds.o: fortmthds.f
	$(F90) $(FFLAGS) -c fortmthds.f

#### clean ##########
cleanc:
	$(RM) *.o 

clean:
	$(RM) samint.py samint_wrap.c _samint.so
	$(RM) *.o *.pyc *~
	cd swig; $(MAKE) $@
