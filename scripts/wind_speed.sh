#!/bin/bash

# Parses the WeatherUndergound xml file to find the current wind
# speed in miles per hour and prints this out.

WIND=$(grep -oPm1 "(?<=<wind_mph>)[^<]+" ~/bin/w.xml)

echo "$WIND mph"
