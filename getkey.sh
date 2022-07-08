#!/bin/bash
source find_cell.sh
emplacement=0
taille_grille=8
#On fait commencer le joueur à la case 1, donc indice 0.
# Il faut absolument donner un argument à la fonction getkey, il faut lui passer l'emplacement actul et elle retournera l emplacement de sortie



#=======================================================
#Génération d'une grille pour tests

declare -a grid
	for i in $(seq 0 63)
	do
		grid[$i]=$i
	done
#=====================================================



getkey() {
	
	if [ -z $1 ]; then
		echo "erreur 00, veuillez passer un argument à getkey()"
	else
		local position=$1
	fi

	

	# Si on veut une taille différente il va falloir mettre à jour le code pour renseigner taillemat
	
	if [ -z $1 ]; then
		echo "Error code 00  | Veuillez passer un argument à getkey"
	else
		position=$1
	fi
	
	while true; do
		read -n1 -s input
		

		if [ "$input" ==  "z" ]; then

			#Faire action aller en haut si possible (si on est pas déjà sur la premiere ligne)
			
			xhaut=$(find_coord $position | cut -d' ' -f2)
			echo $xhaut

			if [ $xhaut -eq 0 ]; then
				clear
                                find_coord $position
			else
				clear
				
				position=$(($position-$taille_grille))
				find_coord $position 
			fi

		elif [ "$input" ==  "s" ]; then
			#Faire action aller en bas si possible (si on est pas déjà sur la derniere ligne)
			
			xbas=$(find_coord $position | cut -d' ' -f2)
			echo $xbas

			if [ $xbas -eq 7 ]; then
                                clear
                                find_coord $position
                        else
                        	clear
                                position=$(($position+$taille_grille))
				find_coord $position
                        fi


		elif [ "$input" == "q" ]; then

			yright=$(find_coord $position | cut -d' ' -f1)
			echo $yright

			if [ $yright -eq 0 ]; then
                                clear
                                find_coord $position
                        else
                        	clear
                                position=$(($position-1))
				find_coord $position
                        fi


		elif [ "$input" == "d" ]; then
			
			yleft=$(find_coord $position | cut -d' ' -f1)
			echo $yleft

			if [ $yleft -eq 7 ]; then
                                clear
                                find_coord $position 
                        else
                        	clear
                                position=$(($position+1))
				find_coord $position
                        fi


		elif [ "$input" == "e" ]; then
		
			#appel de la fonction qui change la valeur affiché par le tableau d'affichage 
			
			
			
			source val_change.sh
			val_change $position			
			
			
			exit
		elif [ "$input" == "a" ]; then

		 	#action pour poser le flag 
		 	
		 	#appel de la fonction jalon pour poser le flag / modifier le tableau affiché
		 	
		 	source jalons.sh
		 	jalon $position

			exit
		else
			getkey $position
		fi
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

