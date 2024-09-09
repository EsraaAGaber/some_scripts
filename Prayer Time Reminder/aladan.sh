#! /bin/bash
Data=`curl "http://api.aladhan.com/v1/timingsByCity/08-09-2024?city=Sohag&country=Arab+Rebuplic+Egypt"`
#name=("Fajr" "Dhuhr" "Asr" "Maghrib" "Isha")
time=("05:11" "12:51" "16:22" "19:05" "20:21")
current_time=$(date +"%T")
#echo $current_time
function conv(){
#echo $1
IFS=':' read -a t <<< "$1"
mint=$(( t[0] * 60 + t[1] ))
time[$2]=${mint}
}

IFS=':' read -a t <<< ${current_time}
now=$(( t[0] * 60 + t[1] ))
#echo $now
#
function get_all_aldans(){

conv $(echo "$Data" | jq -r '.data.timings.Fajr') 0 
conv $(echo "$Data" | jq -r '.data.timings.Dhuhr') 1
conv $(echo "$Data" | jq -r '.data.timings.Asr') 2
conv $(echo "$Data" | jq -r '.data.timings.Maghrib') 3
conv $(echo "$Data" | jq -r '.data.timings.Isha') 4
#echo ${time[@]} > lets

}
check(){
	for i in "${time[@]}"
	do
		dif=$((i - now))
		echo $dif
		if [ ${dif} -le 10 ] && [ ${dif} -ge 0 ];
		then notify-send  "Aladan is coming!!"
			sleep 10m
		fi
	done

}
get_all_aldans
check
