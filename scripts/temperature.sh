#!/bin/bash

# Parses the WeatherUndergound xml file for the temperature
# in Fahrenheit and prints it out.

TEMP=$(grep -oPm1 "(?<=<temp_f>)[^<]+" ~/bin/w.xml)

echo "$TEMP°"
