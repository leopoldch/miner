getkey() {
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
			exit
		elif [ "$input" == "a" ]; then
			echo "poser un flag"
		 	#action pour poser le flag 
			exit
		else
			getkey
		fi
	done
}

getkey
