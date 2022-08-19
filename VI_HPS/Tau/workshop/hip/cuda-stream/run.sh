#!/bin/bash
/bin/rm -f profile.*
tau_exec -T serial,rocm,clang,rocprofiler -rocm ./stream
