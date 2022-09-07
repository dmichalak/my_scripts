#!/bin/bash

# ribosome tilt frames = 177_-4.0_Jun08_17.45.08.mrc

for file in *_[0-9].0_*.mrc; do
    name=${file%.*}
    extension=${file##*.}
    new_name='printf %04d.%s ${name} ${extension}'

    mv -n $file $new_name
done

for file in *_-[0-9].0_*.mrc; do
    name=${file%.*}
    extension=${file##*.}
    new_name='printf %04d.%s ${name} ${extension}'

    mv -n $file $new_name
done