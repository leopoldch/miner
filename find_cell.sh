#!/bin/bash

function find_number(){
	grid=$1
	x=$2
	y=$3
	len_grid=${#tableau_indi[@]}
	res=$(($x + $y * sqrt($len_grid)))
	echo $res
}

function find_coord(){
	grid=$1
	loc=$2
	len_grid=${#tableau_indi[@]}
	sq_len=$((sqrt($len_grid)))
	x=$(($loc%$sq_len))
	y=$(($log / $sq_len))
	echo $x $y	
}

