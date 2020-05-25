#!/bin/bash
#Extracs all lines with Gainsville and sotres it in a file
egrep "GNV" flights.May2017-Apr2018.csv > GNV_flight_data.txt

#Stores all flights with a delay in a new file
egrep "\"[0-9]{4}\",[0-9]*.{3},1" GNV_flight_data.txt > delayed_flights.txt
#Regex equivalent for troubleshooting
#"\d{4}",\d+.\d{2},([0-1]).00,"\d{4}",\d+.00,1.00

echo "Flights that departed from gainsville with delays: "
egrep -c "[0-9]{4},\"GNV\",.*\"..\",\"[0-9]{4}\",[0-9]+.[0-9]{2},1.00" delayed_flights.txt
#Regex expression for troubleshooting
#\d{4},"GNV",.*"..","\d{4}",\d+.\d{2},1.00
echo "Flights that arrived in gainsville with delays:"
egrep -c "\",\"GNV\".+[0-9]{4}\",[0-9]+.[0-9]{2},1.00" delayed_flights.txt
#Regex expression for arrival gainsville delays
#","GNV".+"\d{4}",\d+.\d{2},1.00

