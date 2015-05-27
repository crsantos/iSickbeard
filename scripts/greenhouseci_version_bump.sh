#!/usr/bin/env 
# Bump build number when running on GreenHouseCI
# GREENHOUSE_BUILD=1

if [ -z "$GREENHOUSE_BUILD" ]; then
    echo "var is unset";
    echo "Exiting"
else
    echo "!! var is set !!";
    # BUILD_NUMBER=10
    newBuildNumber=$((BUILD_NUMBER+1))
    echo "bymping to $newBuildNumber"
    pushd ./iSickbeard # go to the project dir
    agvtool new-version -all $newBuildNumber
    popd # get back to old dir
fi
