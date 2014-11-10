#!/bin/bash

# Parses the weatherunderground xml file for a weather icon to go
# with the weather forecast

ICON=$(grep -oPm1 "(?<=<icon_url>)[^<]+" ~/bin/w.xml)

curl -s $ICON > ~/bin/w.gif
