#!/bin/bash

MAIL_TYPE=ALL #BEGIN,END,FAIL,ALL
MAIL_USER=dennis.michalak@nih.gov

WALL_TIME=480 # For interactive jobs, default=8h=480,max=36h=2160
CPUS_PER_TASK=14
GENERIC_RESOURCES=gpu:k80:2,lscratch:10 # request 2x k80 gpus and a 10gb scratch directory. Access at '/lscratch/$SLURM_JOB_ID'
JOB_MEMORY=20g

printf "\nRequesting job to use Dynamo a walltime of $WALL_TIME minutes. $MAIL_TYPE notifications will be sent to ${MAIL_USER}.\n\n"
printf "*****\nRemember to run setup_dynamo.sh once the allocation is complete!\n*****\n\n"

sinteractive --cpus-per-task=$CPUS_PER_TASK --gres=$GENERIC_RESOURCES --mem=$JOB_MEMORY --time=$WALL_TIME --mail-type=$MAIL_TYPE --mail-user=$MAIL_USER
