#!/bin/bash

function (){
	grid=$1
	x=$2
	y=$3
	len_grid=${#tableau_indi[@]}
	res=$(($x + $y * sqrt($len_grid)))
	echo $res
}
