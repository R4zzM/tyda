#! /usr/bin/env sh

# The below test/tests exists to make sure that the http requests sent to tyda.se are valid

echo $0
EXITCODE=0

# Sweden => Sverige is a translation that is unlikly to ever change in tydas database
ACTUAL=`../src/tyda.pl Sweden | tr -d '\n'`
EXPECTED="Sverige"
echo -n "Sweden => Sverige: "
if [ $ACTUAL = $EXPECTED ]
  then  
    echo OK 
  else
    echo FAIL
    EXITCODE=1
fi

exit $EXITCODE
