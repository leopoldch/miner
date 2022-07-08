#!/bin/bash

source demarrage.sh
source getkey.sh
source affichage_grille.sh
source grille_depart.sh

emplacement=0
taille_grille=8
fin=0




function main () {
	
	#Appel de la fonction démarrage 
	choisir_menu
	
	while [ $fin -eq 0 ]; do
		clear
		affichage_grille
		getkey $emplacement
	done
	emplacement=$position
	
	
}

main
