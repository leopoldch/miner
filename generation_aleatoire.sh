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
			array["$i"]=-1
		else
			array["$i"]=0
		fi
	done
}


numbersDetection() {
	local cpt_bombe=0
	for i in $array
	do
		if [ i -eq 0 ]
		then	
			#APPEL FONCTION JUL, RETURN LISTE VOISIN (voisin = 4 5 6 9 11 15 16 17)
			for j in $voisin
			do
				if [ ${array[j]} -eq -1 ]
				then
					cpt_bombe=$(("$cpt_bombe"+1))
				fi
			done
			array[i]="$cpt_bombe"
		fi
		cpt_bombe=0
	done
		


}

taux_bombes=20 # En pourcentage
taille_grille=5 # Taille n*n de la grille

randomGenerate "$taux_bombes" "$taille_grille"
numberDetection
source affichage_grille.sh
affichageGrille 5 


echo ${array[*]}

