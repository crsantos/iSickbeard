#!/bin/sh
# Bump build number when running on GreenHouseCI
# GREENHOUSE_BUILD=1

# set -e tells bash, in a script, to exit whenever 
# anything returns a non-zero return value
set -e

if [ -z "$GREENHOUSE_BUILD" ]; then
    echo "Not Greenhouse Env, Exiting!"
else
    echo "!! GREENHOUSE_BUILD is active !!";
    echo "Bumping to $BUILD_NUMBER"
    agvtool new-version -all $BUILD_NUMBER
fi
