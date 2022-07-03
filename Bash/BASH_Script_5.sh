#! /bin/bash

name_array=('Constance_Castillo' 'Kerry_Goodwin' 'Dorothy_Carson' 'Craig_Williams' 
'Daryl_Guzman' 'Sherman_Stewart' 'Marvin_Collier' 'Javier_Wilkerson' 'Lena_Olson' 
'Claudia_George' 'Erik_Elliott' 'Traci_Peters' 'Jack_Burke' 'Jody_Turner' 'Kristy_Jenkins' 
'Melissa_Griffin' 'Shelia_Ballard' 'Armando_Weaver' 'Elsie_Fitzgerald' 'Ben_Evans' 'Lucy_Baker' 
'Kerry_Anderson' 'Kendra_Tran' 'Arnold_Wells' 'Anita_Aguilar' 'Earnest_Reeves' 'Irving_Stone' 
'Alice_Moore' 'Leigh_Parsons' 'Mandy_Perez' 'Rolando_Paul' 'Delores_Pierce' 'Zachary_Webster' 
'Eddie_Ward' 'Alvin_Soto' 'Ross_Welch' 'Tanya_Padilla' 'Rachel_Logan' 'Angelica_Richards' 
'Shelley_Lucas' 'Alison_Porter' 'Lionel_Buchanan' 'Luis_Norman' 'Milton_Robinson' 'Ervin_Bryant' 
'Tabitha_Reid' 'Randal_Graves' 'Calvin_Murphy' 'Blanca_Bell' 'Dean_Walters' 'Elias_Klein' 
'Madeline_White' 'Marty_Lewis' 'Beatrice_Santiago' 'Willis_Tucker' 'Diane_Lloyd' 'Al_Harrison' 
'Barbara_Lawson' 'Jamie_Page' 'Conrad_Reynolds' 'Darnell_Goodman' 'Derrick_Mckenzie' 
'Erika_Miller' 'Tasha_Todd' 'Aaron_Nunez' 'Julio_Gomez' 'Tommie_Hunter' 'Darlene_Russell' 
'Monica_Abbott' 'Cassandra_Vargas' 'Gail_Obrien' 'Doug_Morales' 'Ian_James' 'Jean_Moran' 
'Carla_Ross' 'Marjorie_Hanson' 'Clark_Sullivan' 'Rick_Torres' 'Byron_Hardy' 'Ken_Chandler' 
'Brendan_Carr' 'Richard_Francis' 'Tyler_Mitchell' 'Edwin_Stevens' 'Paul_Santos' 
'Jesus_Griffith' 'Maggie_Maldonado' 'Isaac_Allen' 'Vanessa_Thompson' 'Jeremy_Barton' 
'Joey_Butler' 'Randy_Holmes' 'Loretta_Pittman' 'Essie_Johnston' 'Felix_Weber' 'Gary_Hawkins' 
'Vivian_Bowers' 'Dennis_Jefferson' 'Dale_Arnold' 'Joseph_Christensen' 'Billie_Norton' 
'Darla_Pope' 'Tommie_Dixon' 'Toby_Beck' 'Jodi_Payne' 'Marjorie_Lowe' 'Fernando_Ballard' 
'Jesse_Maldonado' 'Elsa_Burke' 'Jeanne_Vargas' 'Alton_Francis' 'Donald_Mitchell' 'Dianna_Perry' 
'Kristi_Stephens' 'Virgil_Goodwin' 'Edmund_Newton' 'Luther_Huff' 'Hannah_Anderson' 'Emmett_Gill' 
'Clayton_Wallace' 'Tracy_Mendez' 'Connie_Reeves' 'Jeanette_Hansen' 'Carole_Fox' 'Carmen_Fowler' 
'Alex_Diaz' 'Rick_Waters' 'Willis_Warren' 'Krista_Ferguson' 'Debra_Russell' 'Ellis_Christensen' 
'Freda_Johnston' 'Janis_Carpenter' 'Rosemary_Sherman' 'Earnest_Peters' 'Kelly_West' 
'Jorge_Caldwell' 'Moses_Norris' 'Erica_Riley' 'Ray_Gordon' 'Abel_Poole' 'Cary_Boone' 
'Grant_Gomez' 'Denise_Chapman' 'Vernon_Moran' 'Ben_Walker' 'Francis_Benson' 'Andrea_Sullivan' 
'Wayne_Rice' 'Jamie_Mason' 'Jane_Figueroa' 'Pat_Wade' 'Rudy_Bates' 'Clyde_Harris' 'Andre_Mathis' 
'Carlton_Oliver' 'Merle_Lee' 'Amber_Wright' 'Russell_Becker' 'Natalie_Wheeler' 'Maryann_Miller' 
'Lucia_Byrd' 'Jenny_Zimmerman' 'Kari_Mccarthy' 'Jeannette_Cain' 'Ian_Walsh' 'Herman_Martin' 
'Ginger_Farmer' 'Catherine_Williamson' 'Lorena_Henderson' 'Molly_Watkins' 'Sherman_Ford' 
'Adam_Gross' 'Alfred_Padilla' 'Dwayne_Gibson' 'Shawn_Hall' 'Anthony_Rios' 'Kelly_Thomas' 
'Allan_Owens' 'Duane_Malone' 'Chris_George' 'Dana_Holt' 'Muriel_Santiago' 'Shelley_Osborne' 
'Clinton_Ross' 'Kelley_Parsons' 'Sophia_Lewis' 'Sylvia_Cooper' 'Regina_Aguilar' 
'Sheila_Castillo' 'Sheri_Mcdonald' 'Lynn_Hodges' 'Patrick_Medina' 'Arlene_Tate' 'Minnie_Weber' 
'Geneva_Pena' 'Byron_Collier' 'Veronica_Higgins' 'Leo_Roy' 'Nelson_Lopez')

########################   MENU BAR   ########################################################
while true;
do
	echo ""
	echo "Please select from the following options:"
	echo "" 
	echo "         1. List all names starting with one or more letters of the first name"
	echo "         2. List all names starting with one or more letters of the last name"
	echo "         3. Add a name"
	echo "         4. Delete a name"
	echo "         5. Exit"
	echo ""
	read -p "Option #: " option


###########################   OPTION 1   #########################################################
	if [[ $option -eq 1 ]]; then
		echo ""
		read -p "Enter the first name, or a partial start of the first name: " name_start
		echo ""
		
		#Converting input to Title Case	
		name_start=$(echo $name_start | tr [:upper:] [:lower:])
		rest_input=$(echo ${name_start:1})
		initial=$(echo ${name_start:0:1} | tr [:lower:] [:upper:])
		name_start="$initial$rest_input"
		#End of Title Case
	
		counter=0
		for i in ${name_array[*]};
		do
			name=$(echo $i | tr "_" " " )
			if [[ $name == $name_start* ]]; then
				counter=$(($counter+1))
				echo $name

			fi
		done
		
		if [[ $counter -eq 0 ]]; then
			echo "No first name was found starting with" $name_start
		fi

###########################   OPTION 2  #######################################################		
	elif [[ $option -eq 2 ]]; then
		echo ""
		read -p "Enter the last name, or a partial start of the last name: " last_start
		echo ""
		
		#Converting input to Title Case	
		last_start=$(echo $last_start | tr [:upper:] [:lower:])
		rest_input=$(echo ${last_start:1})
		initial=$(echo ${last_start:0:1} | tr [:lower:] [:upper:])
		last_start="$initial$rest_input"
		#End of Title Case
		
		counter=0
		for i in ${name_array[*]};
		do
			name=$(echo $i | tr "_" " ")
			first_name=$(echo $name | cut -d " " -f 1)
			last_name=$(echo $name | cut -d " " -f 2)
			if [[ $last_name == $last_start* ]]; then
				counter=$(($counter+1))
				echo $name
			fi	
		done
		
		if [[ $counter -eq 0 ]]; then
			echo "No last name was found starting with" $last_start
		fi

###########################   OPTION 3   #######################################################
	elif [[ $option -eq 3 ]]; then
		while true;
		do
			read -p "Enter the new first name: " new_first_name
			space=" "
			if [[ $new_first_name == *$space* ]]; then
				echo "Just first name, please. No spaces."
			else
				break
			fi
			
		done

		while true;
		do
			read -p "Enter the new last name: " new_last_name
			space=" "
			if [[ $new_last_name == *$space* ]]; then
				echo "Just last name, please. No spaces."
			else 
				break
			fi
		done
		
		#Converting new first name to Title Case	
		new_first_name=$(echo $new_first_name | tr [:upper:] [:lower:])
		rest_input=$(echo ${new_first_name:1})
		initial=$(echo ${new_first_name:0:1} | tr [:lower:] [:upper:])
		new_first_name="$initial$rest_input"
		#End of Title Case
	
		
		#Converting new last name to Title Case	
		new_last_name=$(echo $new_last_name | tr [:upper:] [:lower:])
		rest_input_last_name=$(echo ${new_last_name:1})
		initial_last_name=$(echo ${new_last_name:0:1} | tr [:lower:] [:upper:])
		new_last_name="$initial_last_name$rest_input_last_name"
		#End of Title Case

		full_name="$new_first_name $new_last_name"
		full_name_underscore=$(echo $full_name | tr " " "_")
		
		name_array+=($full_name_underscore)
		
		echo ""
		echo $full_name "has been added"

###########################   OPTION 4   #######################################################	
	elif [[ $option -eq 4 ]]; then
		while true;
		do
			echo ""
			echo "Delete a name by entering the full name ie: John Smith"
			read -p "Enter the full name (Q to return to the main menu, 1 to search first names): " delete_name
			
			if [[ $delete_name == "Q" ]]; then
				break
			echo "debug 1"
			elif [[ $delete_name == "1" ]]; then
				echo ""
				read -p "Enter the first name, or a partial start of the first name: " name_start
				
				#Converting input to Title Case	
				name_start=$(echo $name_start | tr [:upper:] [:lower:])
				rest_input=$(echo ${name_start:1})
				initial=$(echo ${name_start:0:1} | tr [:lower:] [:upper:])
				name_start="$initial$rest_input"
				#End of Title Case
	
				counter=0
				for i in ${name_array[*]};
				do
					name=$(echo $i | tr "_" " " )
					if [[ $name == $name_start* ]]; then
						counter=$(($counter+1))
						echo $name

					fi
				done
		
				if [[ $counter -eq 0 ]]; then
					echo "No first name was found starting with" $name_start
				fi

			else
				counter=0
				for i in ${name_array[*]};
				do
					nam=$(echo $i | tr "_" " " )
					if [[ $nam == $delete_name ]]; then
						counter=$(($counter+1))
						#echo $name "is in the array"
						name_array=(${name_array[*]:0:$i} ${name_array[*]:$(($i+2))})
						echo ""
						echo $delete_name "has been deleted from array"				
					fi
				done
		
				if [[ $counter -eq 0 ]]; then
					echo $delete_name "was not found in the array"
				fi
			fi
		done

	elif [[ $option -eq 5 ]]; then
		break

	else 
		echo "That is not a valid option. Please try again."
	
	fi
done
