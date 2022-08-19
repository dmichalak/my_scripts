#!/bin/bash

module load dynamo/1.15.32

source dynamo_activate_linux_shipped_MCR.sh /usr/local/apps/dynamo/1.15.32/
export MCR_CACHE_ROOT=/lscratch/$SLURM_JOBID
