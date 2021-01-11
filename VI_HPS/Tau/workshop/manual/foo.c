#include <TAU.h> 

int foo(int x) {

  TAU_START("foo");

    TAU_START("bar");
  // do something
  //
    TAU_STOP("bar");
  TAU_STOP("foo");
}


call TAU_START('foo')
call TAU_STOP('foo')
