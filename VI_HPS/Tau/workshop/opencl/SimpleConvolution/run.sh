#!/bin/bash
export PATH=/opt/tau/tau_latest/x86_64/bin:$PATH
tau_exec -T serial,rocprofiler,rocm,hip,clang,pthread -opencl ./SimpleConvolution
