#!/bin/sh
set -e

xctool -workspace iSickbeard/iSickbeard.xcworkspace -scheme Debug -sdk iphonesimulator build test