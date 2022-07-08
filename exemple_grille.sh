#!/bin/bash

affichageGrille() {
	local cpt=0	# Compteur
	local nbl="$1"	# Taille n*n de la matrice
	local cpt_index=0 # Compteur d'index
	set -a array
	for word in $(cat test.txt)
	do
		if [ "$cpt" -eq "$nbl" ]
		then
			echo
			cpt=0
		else
			echo -n  "$word "
			array["$cpt_index"]="$word"
			cpt=$(("$cpt" + 1))
		fi
		cpt_index=$((cpt_index+1))
	done

}

affichageGrille "$1" # 4 = taille n de la grille
echo
echo
echo "${array[*]}"
