#!/bin/bash

ICON=$(grep -oPm1 "(?<=<icon_url>)[^<]+" ~/bin/w.xml)

curl -s $ICON > ~/bin/w.gif
