# Paraver

* Allows post-mortem visual analysis
* Open source - http://tools.bsc.es
* Core tools from bsc
  * paraver is offline trace analysis
  * dimemas - message passing simulator
  * extrae - instrumentation


* Paraver allows you to visualise your code
* Good for comparative analysis
* Convert between timelines to colour-coded tables
* Can use this to see, for example, where MPI processes are under-utilised
* Useful duration is a measure of how long a section or instruction takes to run, or duration between consecutive instructions

* Case study -
  * Combination of instructions and instructions per core give variability in useful duration.
  * This is driven by L2 cache misses
  * Rebalancing the cache blocking improves the efficiency of the code

* Second case study was CESM, which required dynamic imbalance correction

* _"MPI is like a gas which expands to fill any available time between instructions"_

* Can simulate different network bandwidths to investigate asynchronous communication

### Efficiency Model

* When an unequal amount of time is spent in MPI between two cores, this problem is **not** MPI bound - despite what various tools may say.

* Load balancing can be done using traces

* Efficiency is a combination of the load balancing, micro-load balancing and transfer.

* Even in well scalable codes, the parallel efficiency may be poor (CESM is an example of this)

* Aim is to try to limit the amount of time in MPI

### Clustering

* Plotting Instruction per core against completed instructions.
* Results in blocks in 2D plot.
* Colour-coding these blocks and then re-projecting back onto graph of Completed instructions allows the different blocks in the code to be identified
* Clouds in the upper left quadrant are the main target for improvements.

### Methodology

* Do it scientifically - performance analysis to prove/disprove hypotheses
* Example case (lulesh) shows that the automatic mapping done by different mpi frameworks has a massive effect - mpt does sequential decomposition, unlike openmpi, which results in filled busses from the caches. Results in a long MPI_WAIT section in stages.


# Extrae

* Multi-platform with no need to recompile or relink (although debug flags)
* Average overhead is ~0.2-2us per event (dependent on callstack)
* Best way to use is through LD_PRELOAD
* See hands-on slides for instructions on use. Generated traces and used them for tutorial 3
