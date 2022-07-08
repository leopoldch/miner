#!/bin/bash

emplacement=0
#On fait commencer le joueur à la case 1, donc indice 0.
# Il faut absolument donner un argument à la fonction getkey, il faut lui passer l'emplacement actul et elle retournera l emplacement de sortie


verifypos() {

	for $valeur in $1
	do
		if [ $valeur == $2 ]; then
			return 0
		fi
	done
	return 1
}



getkey() {
	
	if [ $1 -z ]; then
		echo "erreur 00, veuillez passer un argument à getkey()"
	else
		local position=$1
	fi

	

	# Si on veut une taille différente il va falloir mettre à jour le code pour renseigner taillemat
	taillemat=8

	declare -A array1
	declare -A array2
	declare -A array3
	declare -A array4

	for i in $(seq 0 $(($taillemat-1)))
	do
		array1[$i]=$i
		array2[$i]=$((8*$i))
		array4[$i]=$((56+$i))
		array3[$i]=$((7+$((8*$i))))
	done
	
	echo ${array1[*]}
	
	echo ${array4[*]}

	if [ -z $1 ]; then
		echo "Error code 00  | Veuillez passer un argument à getkey"
	else
		position=$1
	fi

	while true; do
		read -n1 -s input

		if [ "$input" ==  "z" ]; then
			echo "en haut"

			#Faire action aller en haut si possible (si on est pas déjà sur la premiere ligne)

			if verifypos $array1 $position; then
				true #Aucune action
			else
				position=$(($position-$taillemat))
			fi

		elif [ "$input" ==  "s" ]; then
			echo "en bas"
			#Faire action aller en bas si possible (si on est pas déjà sur la derniere ligne)

			if verifypos $array4 $position; then
                                true #Aucune action
                        else
                                position=$(($position+$taillemat))
                        fi


		elif [ "$input" == "q" ]; then
			echo "à gauche"

			if verifypos $array2 $position; then
                                true #Aucune action
                        else
                                position=$(($position-1))
                        fi


		elif [ "$input" == "d" ]; then
			echo "à droite"
			
			if verifypos $array3 $position; then
                                true #Aucune action 
                        else
                                position=$(($position+1))
                        fi


		elif [ "$input" == "e" ]; then
			echo "découvre la touche"
		
			#appel de la fonction qui change la valeur affiché par le tableau d'affichage 
			
			source val_change.sh
			val_change			
			
	
			echo "$position"		
			exit
		elif [ "$input" == "a" ]; then
			echo "poser un flag"

		 	#action pour poser le flag 
		 	
		 	#appel de la fonction jalon pour poser le flag / modifier le tableau affiché
		 	
		 	source jalons.sh
		 	jalon $position

			echo "$position"
			exit
		else
			getkey $position
		fi
		echo $position
	done
}


getkey $emplacement



# A  partant du principe que le champ de mine est représenté par un tableau 8x8 et que l'indice 1 est 0

#     0  1  2  3  4  5  6  7
#     8  9 10 11 12 13 14 15
#    16 17 18 19 20 21 22 23
#    24 25 26 27 28 29 30 31
#    32 33 34 35 36 37 38 39
#    40 41 42 43 44 45 46 47
#    48 49 50 51 52 53 54 55
#    56 57 58 59 60 61 62 63

#Structure du tableau 

# Donc on suggère qu'on a une variable qui a compté où était l emplacement du joueur qu on nomme variable ...

