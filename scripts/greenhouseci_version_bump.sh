#!/bin/sh
# Bump build number when running on GreenHouseCI
# GREENHOUSE_BUILD=1

# set -e tells bash, in a script, to exit whenever 
# anything returns a non-zero return value
set -e

if [ -z "$GREENHOUSE_BUILD" ]; then
    echo "var is unset";
    echo "Exiting"
else
    echo "!! GREENHOUSE_BUILD is active !!";
    echo "Bumping to $BUILD_NUMBER"
    ls -la
    # pushd ./iSickbeard # go to the project dir
    agvtool new-version -all $BUILD_NUMBER
    # popd # get back to old dir
fi
