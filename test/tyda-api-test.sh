#! /usr/bin/env bash

# Tests to make sure that the http requests sent to tyda.se are valid

# A translation that is unlikly to ever change in tydas database
ACTUAL=`../src/tyda.pl Sweden`
EXPECTED=$'Sverige\n'
if [ $ACTUAL = $EXPECTED ]
  then  
    EXITCODE=0
  else
    EXITCODE=1
fi

exit $EXITCODE
