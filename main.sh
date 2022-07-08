#!/bin/bash

source demarrage.sh
source getkey.sh
source affichage_grille.sh
source grille_depart.sh
source generation_aleatoire.sh

emplacement=0
taille_grille=8
fin=0




function main () {
	
	#Appel de la fonction démarrage 
	
	randomGenerate 40 "$taille_grille"
	numbersDetection 

	choisir_menu

	
	while [ $fin -eq 0 ]; do
		clear
		affichage_grille
		getkey $emplacement
	done
	emplacement=$position
	
	
}

main
