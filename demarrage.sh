#!/bin/bash

function choisir_menu(){
	echo '1 - Jouer'
	echo '2 - Difficulté'
	echo '3 - defi'
	read -p 'Veuillez faire votre choix ' input

	if [ $input -eq '1' ]
		then
			jouer
	elif [ $input -eq '2' ]
		then
			difficulte
	elif [ $input -eq '3' ]
		then
			defi
	else
		echo 'Veuillez rentrer une valeur valide'
	fi
}

function jouer(){
	echo 'Jouer'
}

function defi(){
	echo 'defi'
}

function difficulte(){
	echo '1 - Débutant'
	echo '2 - Intermédiaire'
	echo '3 - Expert'
	read -p 'Veuillez choisir votre difficulté ' input
#	if [ $input -eq '1' ]
#	if [ $input -eq '2' ]
#	if [ $input -eq '3' ]
}

function retry(){
	echo 'recommencer'
}

choisir_menu
