[SWD6: High Performance Python](http://bit.ly/swd6-hpp)

This course deals with making Python codes run faster.

Things that slow down code include:
* Crap code
* Bad memory allocation
* Dimensionality/embedded for loops/repeated calculations/inefficiency
* Better algorithms/vectorisation
* Good arrangement of If statements
* Out of date libraries

Tips:
* Numpy arrays do not need nested loops
* If you have imported compiled versions of code, python will look for the compiled version first.
* When interfacing different types of python use the exec command.
* Julia is good for deep learning type applications

Main process for improving code:
* Profile code - getting rid of bottlenecks will give the biggest speedup
* Improve algorithms based on profile
* Compilation processes (numba, cython)
* Possibly consider things like f2py for integrating legacy code
