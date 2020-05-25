#!/bin/bash

egrep -o "[A-Za-z. ]*, FL" flights.May2017-Apr2018.csv | sort --unique > Florida_cities.txt
 
