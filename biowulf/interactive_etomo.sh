#!/bin/bash

MAIL_TYPE=ALL #BEGIN,END,FAIL,ALL
MAIL_USER=dennis.michalak@nih.gov

CPUS_PER_TASK=24
JOB_MEMORY=64g
WALL_TIME=2160 # For sinteractive: default=8h=480,max=36h=2160

printf "\nRequesting job to use Etomo (IMOD/PEET) with a walltime of $WALL_TIME minutes. $MAIL_TYPE notifications will be sent to ${MAIL_USER}.\n\n"

sinteractive --cpus-per-task=$CPUS_PER_TASK --mem=$JOB_MEMORY --time=$WALL_TIME --mail-type=$MAIL_TYPE --mail-user=$MAIL_USER
