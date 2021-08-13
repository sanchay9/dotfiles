#!/usr/bin/env bash

cp ~/vimcp/Library/runner.py runner.py #Replace the first string with the path to runner.py!

for ((testNum=0;testNum<$3;testNum++))
do
    python3 runner.py --command1-stdout-prefix "Pro: " --command2-stdout-prefix "Int: " ./$1 ./$2 > out

    if [ "$(awk 'NF{p=$0}END{print p}' out)" != "Int: OK" ]
    then
        echo "Error found!"
        echo "Interaction:"
        cat out
        exit
    fi
done
echo Passed $3 tests


## Requires runner.py to work
## $ interact.sh wrong int 100
## Format: interact.sh solution interactor numTests
## Runs solution against interactor and outputs the first test on which the interactor's last output is not "OK".
