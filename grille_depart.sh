#!/bin/bash

taille_grille=8

grille_depart(){
	set -a grid_af
	cpt=0	#Compteur
	for i in $(seq 0 $(($taille_grille*$taille_grille -1)))
	do
		grid_af[$i]='#'
	done
}
