#Makefile for driver directory of SAMARC

SWIG_LIB= /usr/share/swig/1.3.29

CP    = /bin/cp

CXX_OBJS  = samint_wrap.o
 
F77_OBJS  = 

all:    samint.i
	/usr/bin/swig -python -I../  -I$(SWIG_LIB) -I$(SWIG_LIB)/python samint.i
	$(CP) samint.py samint_wrap.c ../

clean:
	$(RM) *.o *.c *.py *~
