#!/bin/bash


#Modification de la case du tableau affichage, le tableau que l'utilisateur verra 


jalon() {

	if [ -z $1 ]; then 
		echo "Error Code 01 : Veuillez ajouter un argument de position à jalon"
	else
		position=$1
	fi
	
	#Tableau affichage / nom à modifier pour agir sur une variable globale
	
	tableau_affichage[$position]="¤"
	
}



