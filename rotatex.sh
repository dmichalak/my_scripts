#!/bin/bash

WORKING_DIR=$PWD

TOMO_DIRS=/home/michalakdj/data/kas_krios_20220606/processingbin8/AAA1_tilt*

for dir in $TOMO_DIRS; do
	echo "$dir"
	cd $dir
	ls *full.rec
	#trimvol -rx *full.rec {dir.name}_rec.mrc
#trimvol -rx .../processingbin8/AAA1_tilt*/AAA1_tilt*_full.rec .../processingbin8/AAA1_tilt*/AAA1_tilt*.mrc
done

#cd $WORKING_DIR
