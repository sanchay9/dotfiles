#!/usr/bin/env bash

for ((testNum=0;testNum<$4;testNum++))
do
    ./$3 > input
    ./$1 < input > out
    cat input out > data
    ./$2 < data > res
    result=$(cat res)
    if [ "${result:0:2}" != "OK" ];
    then
        echo "Error found!"
        echo "Input:"
        cat input
        echo "Output:"
        cat out
        echo "Validator Result:"
        cat res
        exit
    fi
done
echo Passed $4 tests

## $ validate.sh wrong val gen 100
## Format: validate.sh solution validator generator numTests
## Runs solution against test cases output by generator, then feeds the test cases followed by the output into validator.  Returns a test case on which the validator does not output "OK".
