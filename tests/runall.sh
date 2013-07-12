#! /usr/bin/env bash

EXITCODE=0

# Being called from multiple locations always causes errors, a printout is helpful...
DIR=`pwd`
echo "Running in: $DIR"
echo ""

# Run api test
./tyda-api-test.sh
EXITCODE=`expr $? + $EXITCODE`
echo ""

exit $EXITCODE
