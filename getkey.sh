emplacement = 0
#On fait commencer le joueur à la case 1, donc indice 0.
# Il faut absolument donner un argument à la fonction getkey, il faut lui passer l'emplacement actul et elle retournera l emplacement de sortie



getkey() {
	
	if [ $1 -z ]; then
		echo "erreur 00, veuillez passer un argument à getkey()"
	else
		local position=$1
	fi

	

	while true; do
		read -n1 -s input

		if [ "$input" ==  "z" ]; then 
			echo "en haut"
			#Faire action aller en haut si possible (si on est pas déjà sur la premiere ligne)
		elif [ "$input" ==  "s" ]; then
			echo "en bas"
			#Faire action aller en bas si possible (si on est pas déjà sur la derniere ligne)
		elif [ "$input" == "q" ]; then
			echo "à gauche"
		elif [ "$input" == "d" ]; then
			echo "à droite"
		elif [ "$input" == "e" ]; then
			echo "découvre la touche"
		
			#action pour découvrir la case en question
	
			echo "$position"		
			exit
		elif [ "$input" == "a" ]; then
			echo "poser un flag"

		 	#action pour poser le flag 

			echo "$position"
			exit
		else
			getkey
		fi
	done
}





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

