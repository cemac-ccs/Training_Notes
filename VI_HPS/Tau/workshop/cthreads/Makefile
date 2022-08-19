CC = tau_cc.sh
# Need to specify TAU_MAKEFILE environment variable. Or else uncomment the 
# following line on the laptop.
#CC = tau_cc.sh -tau_makefile=/home/sshende/apps/tau-2.22.1/x86_64/lib/Makefile.tau-icpc-papi-mpi-pthread-pdt

threaded: threaded.o
	$(CC) -o threaded threaded.o -lpthread
threaded.o: threaded.c
	$(CC) -c threaded.c
clean:
	/bin/rm -f threaded.o threaded profile.* *.elg *.trc *.edf *.pdb *.inst.c

