#!/usr/bin/env bash

set -e # parent exits on first failed command
set -m # each child is part of the same process group

X=5

mkdir -p logs

run=1
for i in $(seq 1 "$X"); do
    logfile="logs/run_${run}"
    (
         ./minimize.sh
    ) >"$logfile" 2>&1 &

    run=$((run+1))
done

wait -n
status=$?

exit $status 

