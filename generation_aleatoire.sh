randomGenerate() {
	local taux="$1"
	local n="$2"
	local ratio=$((100-"$taux"))
	local ratio=$(("$ratio"/10))
	set -a grid
	local m=$(("$n"*"$n"-1))
	nb_mines=0
	
	for i in $(seq 0 "$m")
	do
		local alea=$(echo $(($RANDOM% "$ratio+1")))
		if [ "$alea" -eq "$ratio" ]
		then
			grid["$i"]=-1
			nb_mines=$(($nb_mines+1))
		else
			grid["$i"]=0
		fi
	done

}


numbersDetection() {
	local cpt_bombe=0
	local cpt=0
	set -a grid_r
	local fin=$((taille_grille*taille_grille))
	for i in $(seq 0 $fin)
	do
			
		source find_cell.sh
		voisin=$(find_neig $i)
		
		if [ ${grid[i]} -eq 0 ]
		then
			for j in ${voisin[*]}
			do
				if [ $j -le $fin ]
				then
					if [ ${grid[j]} -eq -1 ]
					then
						cpt_bombe=$(("$cpt_bombe"+1))
					fi
				fi
			done
			grid_r[i]="$cpt_bombe"
		elif [ ${grid[i]} -eq -1 ]
		then
			grid_r[i]=-1
		fi
		cpt=$(("$cpt"+1))
		cpt_bombe=0
	done
}


affichageGrille() {
	local cpt=0	# Compteur
	local nbl="$1"	# Taille n*n de la matrice
	for i in ${grid[*]}
	do
		if [ "$cpt" -eq "$nbl" ]
		then
			echo
			cpt=0
		fi
		if [ $i -eq -1 ]
		then
			echo -n "X   "
		else
			echo -n  "$i   "
		fi
		cpt=$(("$cpt" + 1))
	done
}

affichageGriller() {
	local cpt=0	# Compteur
	local nbl="$1"	# Taille n*n de la matrice
	for i in ${grid_r[*]}
	do
		if [ "$cpt" -eq "$nbl" ]
		then
			echo
			cpt=0
		fi
		if [ $i -eq -1 ]
		then
			echo -n "X   "
		else
			echo -n  "$i   "
		fi
		cpt=$(("$cpt" + 1))
	done
}





if [ -e demmarrage.sh ]
then
	source demarrage.sh
	difficulty=$(sendDifficulty)
	taux_bombes=$(echo difficulty | cut -d" " -f2)
	taille_grille=$(echo difficulty | cut -d" " -f1)
else
	taux_bombes=50 # En pourcentage
	taille_grille=5 # Taille n*n de la grille
fi


randomGenerate "$taux_bombes" "$taille_grille"
#echo ${grid[*]}
#grid=(0 0 -1 -1 0 0 0 0 0)

echo "grid avec bombe" 
echo
affichageGrille $taille_grille 
echo

numbersDetection 


echo "grid resolut" 
echo
affichageGriller $taille_grille 

echo "$nb_mines"

