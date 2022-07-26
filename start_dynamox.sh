#!/bin/bash

export DYNAMO_ROOT=/opt/dynamo/
CWD=$(pwd)

gnome-terminal --working-directory=$CWD --window

source $DYNAMO_ROOT/dynamo_activate_linux_*
dynamo x
