#!/bin/bash
source demarrage.sh

#On récupère encore une fois l'index de la position de là où est le joueur

#Attention le tableau où l'on stocke les données et celui où que l'on affiche sont des variables globales sur lesquelles on agit via des fonctions


val_change() {
	
	local counter=0
	if [ -z $ ]; then
		echo "error code 022; Veuillez renseigner une position en paramètre à val_change"
		exit
	else
		local posval=$1
		if [ ${grid_r[$posval]} -eq -1 ]; then
			grid_af[$posval]="¤"
			echo "Vous avez trouvé une mine ! jeu perdu"
			fin=1
			GameOver
			exit
		else
			grid_af[$posval]=${grid_r[$posval]}
			counter=$(($counter+1))
			local max=$(($taille_grille-$nb_mine))
		fi
	fi
	
	if [ $counter -eq $max ]; then
		echo "Vous avez gagné, la partie est terminé"
		fin=1
	fi
		
}

