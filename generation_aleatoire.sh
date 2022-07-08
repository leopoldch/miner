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
	for i in $grid
	do
		if [ i -eq 0 ]
		then	
			#APPEL FONCTION JUL, RETURN LISTE VOISIN (voisin = 4 5 6 9 11 15 16 17)
			for j in $voisin
			do
				if [ ${grid[j]} -eq -1 ]
				then
					cpt_bombe=$(("$cpt_bombe"+1))
				fi
			done
			grid[i]="$cpt_bombe"
		fi
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
	taux_bombes=20 # En pourcentage
	taille_grille=5 # Taille n*n de la grille
fi

randomGenerate "$taux_bombes" "$taille_grille"
numberDetection
source affichage_grille.sh
affichageGrille 5 


echo ${grid[*]}

