#!/bin/bash

#On récupère encore une fois l'index de la position de là où est le joueur

#Attention le tableau où l'on stocke les données et celui où que l'on affiche sont des variables globales sur lesquelles on agit via des fonctions


val_change() {

	if [ -z $ ]; then
		echo "error code 022; Veuillez renseigner une position en paramètre à val_change"
		exit
	else
		local posval=$1
	grid_af[$posval]=${grid[$posval]}
	
}
