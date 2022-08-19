#!/bin/bash
/bin/rm -rf profile* MULT*
module load tau
tau_exec -T rocm,rocprofiler,serial -rocm ./gpu-stream-hip
