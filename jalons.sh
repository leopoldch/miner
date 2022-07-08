#!/bin/bash


#Modification de la case du tableau affichage, le tableau que l'utilisateur verra 
#Attention !! Par convention le tableau qui est affiché est appellé grid_af

jalon() {

	if [ -z $1 ]; then 
		echo "Error Code 01 : Veuillez ajouter un argument de position à jalon"
	else
		local positionjal=$1
	fi
	
	#Tableau affichage / nom à modifier pour agir sur une variable globale
	
	grid_af[$positionjal]="¤"
	
}



