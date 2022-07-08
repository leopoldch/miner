#!/bin/bash

discover_blank(){
	local index=$1
	source find_cell.sh
	local neigs=$(find_neig index)
	for n in neigs
	do
		source discover.sh
		discover n
	done
}
