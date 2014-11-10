#!/bin/bash

# Parses the WeatherUnderGround xml document for the current forecast
# (e.g. "Partly Cloudy" or "Clear") and prints it out.

FCAST=$(grep -oPm1 "(?<=<weather>)[^<]+" ~/bin/w.xml)

echo $FCAST
