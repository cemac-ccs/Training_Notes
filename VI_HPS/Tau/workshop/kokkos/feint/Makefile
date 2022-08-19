#KOKKOS_PATH = /projects/tau/apps/kokkos-2.04
KOKKOS_PATH = /projects/tau/apps/kokkos-2.7.00
KOKKOS_SRC_PATH =  ..
vpath %.cpp ../fixture ${KOKKOS_SRC_PATH}/example/feint

EXAMPLE_HEADERS = $(wildcard $(KOKKOS_SRC_PATH)/example/common/*.hpp ../fixture/*.hpp ${KOKKOS_SRC_PATH}/example/feint/*.hpp)

default: build_all
	echo "End Build"

ifneq (,$(findstring Cuda,$(KOKKOS_DEVICES)))
  CXX = $(KOKKOS_PATH)/bin/nvcc_wrapper
else
  CXX = icpc
endif

CXXFLAGS = -O3 -g
LINK ?= $(CXX)
LDFLAGS ?= 

include $(KOKKOS_PATH)/Makefile.kokkos        

KOKKOS_CXXFLAGS +=	\
	-I${KOKKOS_SRC_PATH}/common	\
	-I${KOKKOS_SRC_PATH}/fixture	\
	-I${KOKKOS_SRC_PATH}/feint

EXE_EXAMPLE_FEINT = KokkosExample_Feint
OBJ_EXAMPLE_FEINT = BoxElemPart.o main.o

ifeq ($(KOKKOS_INTERNAL_USE_CUDA), 1)
  OBJ_EXAMPLE_FEINT += feint_cuda.o
endif

ifeq ($(KOKKOS_INTERNAL_USE_PTHREADS), 1)
  OBJ_EXAMPLE_FEINT += feint_threads.o
endif

ifeq ($(KOKKOS_INTERNAL_USE_OPENMP), 1)
  OBJ_EXAMPLE_FEINT += feint_openmp.o
endif

TARGETS = $(EXE_EXAMPLE_FEINT)

#TEST_TARGETS =

$(EXE_EXAMPLE_FEINT) : $(OBJ_EXAMPLE_FEINT) $(KOKKOS_LINK_DEPENDS)
	$(LINK) $(KOKKOS_LDFLAGS) $(LDFLAGS) $(EXTRA_PATH) $(OBJ_EXAMPLE_FEINT) $(KOKKOS_LIBS) $(LIB) -o $(EXE_EXAMPLE_FEINT)

build_all : $(TARGETS)

test : build_all

clean: kokkos-clean
	rm -f *.o $(TARGETS)

# Compilation rules

%.o:%.cpp $(KOKKOS_CPP_DEPENDS) $(EXAMPLE_HEADERS)
	$(CXX) $(KOKKOS_CPPFLAGS) $(KOKKOS_CXXFLAGS) $(CXXFLAGS) $(EXTRA_INC) -c $<
