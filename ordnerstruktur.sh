#abfrage nach tiefe der Ebene und start Verzeichniss
read -p "wie viele Ebenen soll Ihre Ordnerstruktur haben? " anzahl_e
read -p "in welchen Verzeichniss soll die ordnerstruktur angelegt werden? " pfad
#erstellen eines leeren variablen und array
liste=()
listezwei=()
pfadzwei=""
#alle ebenen werden nacheinander durchlaufen
for ((x=0;x<=anzahl_e;x++))
	do
    # test ob liste leer ist
		if [ ${#liste[@]} -eq 0 ]
		# wenn die liste leer ist wird der standart pfad genommen
		then
			echo "sie befinden sich in "$pfad "."
			read -p " wie viele Ordner sollen angelegt werden? " anzahl_o
			# alle angegebenen ordner werden angelegt
			for ((y=0;y<$anzahl_o;y++))
				do
					read -p "wie soll der ordner heißen? " name_o
					read -p "welche rechte sollen vergeben werden? " rechte_o
					mkdir -p $pfad/$name_o
					# rechte werden vergeben
					chmod $rechte_o $pfad/$name_o
					liste+=($pfad/$name_o)
				done
		# wenn die liste nicht leer werden die gespeicherten pfade genommen		
		else
			# alle ordner der zuletzt erstellten ebene werden durchlaufen
			for ((u=0;u<${#liste[@]};u++))
				do	
					pfadzwei=${liste[$u]}
					echo "sie befinden sich in "$pfadzwei "."
					read -p " wie viele Ordner sollen angelegt werden? " anzahl_o
					if [ $anzahl_o -eq 0 ]
					then
						continue
					else	
					# alle angegebenen ordner werden angelegt
						for ((y=0;y<${anzahl_o};y++))
							do
								read -p "wie soll der Ordner heißen? " name_o
								read -p "welche rechte sollen vergeben werden " rechte_o "."
								mkdir -p $pfadzwei/$name_o
								# rechte werden vergeben
								chmod $rechte_o $pfadzwei/$name_o
								listezwei+="$pfadzwei/$name_o "
							done	
					fi
			done	
			#neue Pfadliste wird erstellt
			liste=()
			for i in $listezwei
				do
					liste+=($i)
				done
			#übergabe liste wird geleert	
			listezwei=()
    	fi
	done    
