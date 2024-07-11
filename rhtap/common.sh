#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" 

# Vars for scripts
# Generated patterns to convert from Tekton. 


# exit 0, write Succeeded to STATUS result
function exit_with_success_result () { 
    echo "Succeeded" > $RESULTS/STATUS
    exit 0
}

# exit 1, write Failed to STATUS result
function exit_with_fail_result () { 
    echo "Failed" > $RESULTS/STATUS
    exit 1
}
 
DIR=$(pwd)
export TASK_NAME=$(basename $0 .sh)
export BASE_RESULTS=$DIR/results 
export RESULTS=$BASE_RESULTS/$TASK_NAME
export TEMP_DIR=$DIR/results/temp 
# clean results per build 
rm -rf $RESULTS
mkdir -p $RESULTS
mkdir -p $TEMP_DIR
mkdir -p $TEMP_DIR/files
echo 
echo "Step: $TASK_NAME"
echo "Results: $RESULTS" 
export PATH=$PATH:/usr/local/bin 

source $SCRIPTDIR/env.sh  
