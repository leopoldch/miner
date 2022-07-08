#!/bin/bash

#On récupère encore une fois l'index de la position de là où est le joueur

#Attention le tableau où l'on stocke les données et celui où que l'on affiche sont des variables globales sur lesquelles on agit via des fonctions


val_change() {
	
	local counter=0
	
	if [ -z $ ]; then
		echo "error code 022; Veuillez renseigner une position en paramètre à val_change"
		exit
	else
		local posval=$1
		grid_af[$posval]=${grid[$posval]}
		if [ ${grid[$posval]} -eq -1 ]; then
			echo "Vous avez trouvé une mine ! jeu perdu"
			exit
		else
			counter=$(($counter+1))
			local max=$(($taille_grille-$nb_mine))
		fi
	fi
	
	if [ $counter -eq $max ]; then
		echo "Vous avez gagné, la partie est terminé"
	fi
		
}

