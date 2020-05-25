#Bonus question scripts
filter_city(){
egrep -c "$1" flights.May2017-Apr2018.csv 
egrep "$1" flights.May2017-Apr2018.csv > "$1".txt

}

echo "Enter city"
read varname
find_city $varname "GNV_depart.txt"
filter_city $varname
