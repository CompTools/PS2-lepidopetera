#!/bin/bash

# use egrep to select Florida cities, then use sort to get unique cities, and list them in output file called Florida_cities.txt
egrep -o "[A-Za-z. ]*, FL" flights.May2017-Apr2018.csv | sort --unique > Florida_cities.txt
 
# needs to be ran on cluster, because flights.May2017-Apr2018.csv is not in repo, file size too large
