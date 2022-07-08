#!/bin/bash

affichage_grille() {
	local cpt=0	# Compteur
	for c in ${grid_af[*]}
	do
		if [ "$cpt" -eq $taille_grille ]
		then
			echo
			cpt=0
		fi
		echo -ne " $c "
		cpt=$(($cpt+1))
	done
	echo
	echo
}
