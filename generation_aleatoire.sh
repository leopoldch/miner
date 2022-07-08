randomGenerate() {
	local taux="$1"
	local n="$2"
	local ratio=$((100-"$taux"))
	ratio=$(("$ratio"/10))
	set -a array
	m=$(("$n"*"$n"))
	
	for i in $(seq 1 "$m")
	do
		alea=$(echo $(($RANDOM% "$ratio+1")))
		if [ "$alea" -eq "$ratio" ]
		then
			grid["$i"]=-1
		else
			grid["$i"]=0
		fi
	done
}


numbersDetection() {
	local cpt_bombe=0
	local cpt=0
	local fin=$((taille_grille*taille_grille-1))
	for i in $(seq 0 $fin)
	do
			
		source find_cell.sh
		voisin=$(find_neig $i)
		echo "voisin  " ${voisin[*]}
		echo
		
		if [ ${grid[i]} -eq 0 ]
		then
			for j in ${voisin[*]}
			do
				if [ $j -le $fin ]
				then
					echo "test avec $j, voisin de $i" ${grid[j]}
					if [ ${grid[j]} -eq -1 ]
					then
						cpt_bombe=$(("$cpt_bombe"+1))
					fi
				fi
			done
			echo "nb bombe  "  "$cpt_bombe"
			echo "avant" ${grid[cpt]}
			grid[cpt]="$cpt_bombe"
		fi
		cpt=$(("$cpt"+1))
		cpt_bombe=0
	done
		


}

if [ -e demmarrage.sh ]
then
	source demarrage.sh
	difficulty=$(sendDifficulty)
	taux_bombes=$(echo difficulty | cut -d" " -f2)
	taille_grille=$(echo difficulty | cut -d" " -f1)
else
	taux_bombes=80 # En pourcentage
	taille_grille=5 # Taille n*n de la grille
fi

#randomGenerate "$taux_bombes" "$taille_grille"
grid=(0 -1 0 -1 0 -1 -1 0 0 -1 0 -1 0 0 0 -1 0 -1 0 -1 0 -1 0 0 0)
echo "grid avec bombe   " ${grid[*]}
numbersDetection


echo "grid resolut   " ${grid[*]}

