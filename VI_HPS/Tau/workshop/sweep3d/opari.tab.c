#include "pomp_lib.h"


#include "./driver.chk.f.opari.inc"
#include "./read_input.chk.f.opari.inc"
#include "./decomp.chk.f.opari.inc"
#include "./inner_auto.chk.f.opari.inc"
#include "./inner.chk.f.opari.inc"
#include "./initialize.chk.f.opari.inc"
#include "./source.chk.f.opari.inc"
#include "./sweep.chk.f.opari.inc"
#include "./flux_err.chk.f.opari.inc"
#include "./octant.chk.f.opari.inc"
#include "./mpi_stuff.chk.f.opari.inc"
#include "./mpi_stuff.chk.pomp.chk.f.opari.inc"

int POMP_MAX_ID = 1;

struct ompregdescr* pomp_rd_table[1] = {
  0,
};
