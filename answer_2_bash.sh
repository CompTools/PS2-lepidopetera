#!/bin/bash
#Extracts all lines with Gainsville and sotres it in a file
egrep "GNV" flights.May2017-Apr2018.csv > GNV_flight_data.txt

#Stores all flights with a delay in a new file
egrep "\"[0-9]{4}\",[0-9]*.{3},1" GNV_flight_data.txt > delayed_flights.txt
#Regex equivalent for troubleshooting
#"\d{4}",\d+.\d{2},([0-1]).00,"\d{4}",\d+.00,1.00


