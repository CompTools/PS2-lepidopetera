#!/bin/bash

sample_data(){
less flights.May2017-Apr2018.csv >sample_data.txt
}
find_unique(){
egrep -o "\"[A-Z]{3}\"" sample_data.txt | sort --unique >output_3.txt
}
#only run real data on the cluster, it hangs otherwise

find_unique