#!/bin/bash

curl -sfL http://www.hpcg-benchmark.org/downloads/hpcg-3.0.tar.gz | tar xzf - -C /scratch/ 
mkdir /scratch/hpcg-3.0/Linux_MPI
cd /scratch/hpcg-3.0/Linux_MPI
/scratch/hpcg-3.0/configure Linux_MPI
source /etc/profile
module load mpi
make -j2
