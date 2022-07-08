#!/bin/bash

find_number(){
	local x="$1"
	local y="$2"
	local len_grid="${#grid_r[@]}"
	local float_sq_len=$(bc -l <<<"sqrt($len_grid)")
	local sq_len=$(echo $float_sq_len | cut -d. -f1)
	local res=$(($x + $y * $sq_len ))
	echo "$res"
}

find_coord(){
	local loc=$1
	local len_grid=${#grid_r[@]}
	local float_sq_len=$(bc -l <<<"sqrt($len_grid)")
	local sq_len=$(echo $float_sq_len | cut -d. -f1)
	local x=$(($loc%$sq_len))
	local y=$(($loc/$sq_len))
	echo $x $y	
}

find_neig(){
	local len_grid=${#grid_r[@]}
	local float_sq_len=$(bc -l <<<"sqrt($len_grid)")
	local sq_len=$(echo $float_sq_len | cut -d. -f1)
	local index=$1
	local res=$(find_coord index)
	local x=$(echo $res | cut -d" " -f1)
	local y=$(echo $res | cut -d" " -f2)
	
	set -a neigs
	
	local n0=$((index-1-$sq_len))
	if [[ $n0 -lt 0 || $n0 -lt $(( $(($y-1)) * $sq_len)) ]]
	then
		neigs[0]=-1
	else
		neigs[0]=$n0
	fi

	local n1=$((index-$sq_len))
	if [ $n1 -lt 0 ]
	then
		neigs[1]=-1
	else
		neigs[1]=$n1
	fi

	local n2=$((index-$sq_len+1))
	if [[ $n2 -lt 0 || $n2 -gt $(( $(($y * $sq_len))-1 )) ]]
	then
		neigs[2]=-1
	else
		neigs[2]=$n2
	fi
	
	local n3=$((index-1))
	if [ $n3 -lt $(($y * $sq_len)) ]
	then
		neigs[3]=-1
	else
		neigs[3]=$n3
	fi
	
	local n4=$((index+1))
	if [ $n4 -gt $(( $(( $(($y+1))*$sq_len )) -1 )) ]
	then
		neigs[4]=-1
	else
		neigs[4]=$n4
	fi
	
	local n5=$((index+$sq_len-1))
	if [[ $n5 -lt $(( $(($y+1)) * $sq_len )) || $n5 -ge $len_grid ]]
	then
		neigs[5]=-1
	else
		neigs[5]=$n5
	fi
		
	local n6=$((index+$sq_len))
	if [ $n5 -ge $len_grid ]
	then
		neigs[6]=-1
	else
		neigs[6]=$n6
	fi
	
	local n7=$((index+$sq_len+1))
	if [[ $n7 -gt $(( $(( $(($y+2))*$sq_len )) -1 )) || $n5 -ge $len_grid ]]
	then
		neigs[7]=-1
	else
		neigs[7]=$n7
	fi
	
	echo ${neigs[*]}
}
