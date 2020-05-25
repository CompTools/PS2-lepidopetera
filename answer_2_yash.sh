#!/bin/bash
#
reduce_gainsville(){
#Stores all gainsville flights
egrep "GNV" flights.May2017-Apr2018.csv > GNV_flight_data.txt
}

filter_departure_gainsville(){
#stores all flights that dpart form gainsville
egrep "[0-9]+,\"GNV\"" GNV_flight_data.txt >GNV_depart.txt
}

filter_all_delays_fifteen(){
#Stores all flights with a delay of 15 minutes in a new file
#"Gives delays on input file"
egrep -c "\"[0-9]{4}\",[0-9]*.{3},1" "$1"
egrep "\"[0-9]{4}\",[0-9]*.{3},1" "$1" > delayed_flights_15.txt
}

filter_all_delays_weather(){
#Stores all flights with weather delay 
#"Gives delays due to weather on input file"
egrep "([1-9]+\.00,)([0-9]+\.00,)([0-9]+\.00,)([0-9]+\.00,)$" "$1" > delayed_flights_weather.txt
}

find_city(){
    #takes inout 1 as city
    #takes input as file and finds all occurences of city in file and prints number
    egrep -c "$1" "$2"
}
#only run real data on the cluster, it hangs otherwise
#Extracts all flights to and from gainsville

reduce_gainsville
filter_departure_gainsville
#Give an output file of all Gainsville daprtures GNV_daprt.txt

filter_all_delays_fifteen GNV_depart.txt 
#Filters delays of fifteen minutes into
filter_all_delays_weather GNV_depart.txt
#
echo "Total flights by city out of gainsville"
find_city "Atlanta" "GNV_depart.txt"
find_city "Charlotte" "GNV_depart.txt"
find_city "Miami" "GNV_depart.txt"

echo "Total flights by city out of gainsville which are delayed"
find_city "Atlanta" "delayed_flights_15.txt"
find_city "Charlotte" "delayed_flights_15.txt"
find_city "Miami" "delayed_flights_15.txt"

echo "Total flights by city out of gainsville which are delayed by weather"
find_city "Atlanta" "delayed_flights_weather.txt"
find_city "Charlotte" "delayed_flights_weather.txt"
find_city "Miami" "delayed_flights_weather.txt"
