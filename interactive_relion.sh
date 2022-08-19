#!/bin/bash

MAIL_TYPE=ALL #BEGIN,END,FAIL,ALL
MAIL_USER=dennis.michalak@nih.gov

WALL_TIME=08:00:00 # For interactive jobs, default=8h=480,max=36h=2160
CPUS_PER_TASK=56
GENERIC_RESOURCES=lscratch:200
MEMORY_PER_CPU=2g

#printf "\nRequesting job to use RELION with a walltime of $WALL_TIME. $MAIL_TYPE notifications will be sent to ${MAIL_USER}.\n\n"

# --no-gres-shell allows job steps to access general resources like /lscratch and GPUs

sinteractive --cpus-per-task=$CPUS_PER_TASK --gres=$GENERIC_RESOURCES --mem-per-cpu=$MEMORY_PER_CPU --time=$WALL_TIME --no-gres-shell #--exclusive
