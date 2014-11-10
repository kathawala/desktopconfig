#!/bin/bash

# This script pulls an xml document containing weather information from WeatherUnderground
# It can be run with arguments in the following form:
# Argument 1: <City>
# Argument 2: <ST> (the state's two letter abbreviation)
# The script will only run when provided no arguments or two arguments (it's impossible
# to tell which Madison you are talking about if you do not specify a state)
# Running this script also requires you to fill in an API key below.
# You can sign up for an API key with WeatherUnderground at the following link:
# www.wunderground.com/weather/api/
# This script will also create two files in your ~/bin directory, if such a directory
# does not exist YOU MUST CREATE IT BEFORE RUNNING THIS SCRIPT.
# These two files, w.xml and w.xml~ are used to make sure you do not lose weather
# info in case the API decides to block you for trying to page it too much.
# w.xml always contains info and w.xml~ can tell you if your key is blocked or not

  # Set this variable to the API key you received when signing up with 
  # WeatherUndergorund
  API=

  # Set URL for fetching weather information and an Error Msg for invalid input
  # You can change the default location to retrieve weather from by modifying the
  # end of this URL (e.g. ...TN/Memphis.xml instead of ...CA/Stanford.xml)
  URL=http://api.wunderground.com/api/$API/geolookup/conditions/q/CA/Stanford.xml
  ERR="Error: Arguments expected in form [City] [State]. Ex: weather Palo_Alto CA"

  # handles arguments for location / default is Stanford CA
  # well-formed argument example: "weather Memphis TN"
  if [ ! -z "$1" ] && [ ! -z "$2" ]
    then
      URL=${URL/Stanford/$1}
      URL=${URL/CA/$2}
  fi
  
  # Handles erroneous input such as:
  # no second argument or a second argument with invalid State Code
  # bad argument example: "weather Memphis T"
  if [[ ! -z "$1" && -z "$2" ]] || [[ ! -z "$2" && ! ${#2} -eq 2 ]]
    then
      echo "$ERR"
      exit 1
  fi
  
  # get xml file from API, parse out relevant information and echo to stdout
  # NOTE: ~/bin/w.xml~ MUST BE AN EXISTENT FILE!
  curl -s $URL > ~/bin/w.xml~
  if grep -qom1 "<icon_url>" ~/bin/w.xml~; then
      cat ~/bin/w.xml~ > ~/bin/w.xml
  fi
