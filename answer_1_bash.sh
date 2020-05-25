#!/bin/bash

grep "GNV" flights.May2017-Apr2018.csv > GNV_flight_data.txt
"\d{4}",\d+.\d{2},([0-1]).00,"\d{4}",\d+.00,1.00

egrep "\"[0-9]{4}\",[0-9]*.{3},1" GNV_flight_data.txt > delayed_flights.txt

#Regex expression for departure gainsville delays
#\d{4},"GNV",.*"..","\d{4}",1.00
egrep -c "[0-9]{4},\"GNV\",.*\"..\",\"[0-9]{4}\",1.00" delayed_flights.txt

#Regex expression for arrival gainsville delays
#","GNV".+"\d{4}",\d+.\d{2},1.00
egrep -c "\",\"GNV\".+[0-9]{4}\",[0-9]+.[0-9]{2},1.00" delayed_flights.txt


