#!/bin/bash

grilleToArray() {
	local name="$1"
	local cpt_index=0 # Compteur d'index
	set -a array
	for word in $(cat "$name")
	do
		array["$cpt_index"]="$word"
		cpt_index=$((cpt_index+1))
	done
}

grilleToArray 'grille.txt' # 4 = taille n de la grille

# Tableau => array
