#!/bin/bash

affichageGrille() {
	local cpt=0	# Compteur
	local nbl="$1"	# Taille n*n de la matrice
	local name="$2"
	local cpt_index=0 # Compteur d'index
	set -a array
	for word in $(cat "$name")
	do
		if [ "$cpt" -eq "$nbl" ]
		then
			echo
			cpt=0
		fi
		echo -n  "$word "
		array["$cpt_index"]="$word"
		cpt=$(("$cpt" + 1))
		cpt_index=$((cpt_index+1))
	done

}

affichageGrille "$1" 'grille.txt' # 4 = taille n de la grille
echo
echo
echo "${array[*]}"
