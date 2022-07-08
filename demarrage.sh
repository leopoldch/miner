#/bin/bash

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
	start=$(date +%s)
	# Do something
	end=$(date +%s)
	seconds=$(echo "$end - $start" | bc)
	echo "$seconds" ' sec'
}

function defi(){
	echo 'defi'
}

function difficulte(){
	echo '1 - Débutant'
	echo '2 - Intermédiaire'
	echo '3 - Expert'
	read -p 'Veuillez choisir votre difficulté ' input
	if [ "$input" -eq '1' ]
	then
		taille=8
		bombe=20
	elif [ "$input" -eq '2' ]
	then
		taille=15
		bombe=30
	elif [ "$input" -eq '3' ]
	then
		taille=25
		bombe=40
	fi
}

function GameOver(){
	if  [ $jeu -eq '-1' ]
		echo '1 - Recommencer'
		echo '2 - Menu Principal'
		echo '3 - Quitter'
		read -p 'Veuillez choisir: ' choix
	if [ $choix -eq '1' ]
		jeu
	if [ $choix -eq '2' ]
		choisir_menu
	if [ $choix -eq '3' ]
		exit
}

sendDifficulty(){
	echo "$taille" "$bombe"
}
taille=8
bombe=20

choisir_menu

