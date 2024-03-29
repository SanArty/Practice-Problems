#Ayrton D. Ledesma Fuentes
#PowerSheel Script 5 - Project

clear

#List of names
$name_list = @('Constance Castillo', 'Kerry Goodwin',
 'Dorothy Carson', 'Craig Williams', 'Daryl Guzman', 'Sherman Stewart',
 'Marvin Collier', 'Javier Wilkerson', 'Lena Olson', 'Claudia George',
 'Erik Elliott', 'Traci Peters', 'Jack Burke', 'Jody Turner',
 'Kristy Jenkins', 'Melissa Griffin', 'Shelia Ballard', 'Armando Weaver',
 'Elsie Fitzgerald', 'Ben Evans', 'Lucy Baker', 'Kerry Anderson',
 'Kendra Tran', 'Arnold Wells', 'Anita Aguilar', 'Earnest Reeves',
 'Irving Stone', 'Alice Moore', 'Leigh Parsons', 'Mandy Perez',
 'Rolando Paul', 'Delores Pierce', 'Zachary Webster', 'Eddie Ward',
 'Alvin Soto', 'Ross Welch', 'Tanya Padilla', 'Rachel Logan',
 'Angelica Richards', 'Shelley Lucas', 'Alison Porter', 'Lionel Buchanan',
 'Luis Norman', 'Milton Robinson', 'Ervin Bryant', 'Tabitha Reid',
 'Randal Graves', 'Calvin Murphy', 'Blanca Bell', 'Dean Walters',
 'Elias Klein', 'Madeline White', 'Marty Lewis', 'Beatrice Santiago',
 'Willis Tucker', 'Diane Lloyd', 'Al Harrison', 'Barbara Lawson',
 'Jamie Page', 'Conrad Reynolds', 'Darnell Goodman', 'Derrick Mckenzie',
 'Erika Miller', 'Tasha Todd', 'Aaron Nunez', 'Julio Gomez',
 'Tommie Hunter', 'Darlene Russell', 'Monica Abbott', 'Cassandra Vargas',
 'Gail Obrien', 'Doug Morales', 'Ian James', 'Jean Moran',
 'Carla Ross', 'Marjorie Hanson', 'Clark Sullivan', 'Rick Torres',
 'Byron Hardy', 'Ken Chandler', 'Brendan Carr', 'Richard Francis',
 'Tyler Mitchell', 'Edwin Stevens', 'Paul Santos', 'Jesus Griffith',
 'Maggie Maldonado', 'Isaac Allen', 'Vanessa Thompson', 'Jeremy Barton',
 'Joey Butler', 'Randy Holmes', 'Loretta Pittman', 'Essie Johnston',
 'Felix Weber', 'Gary Hawkins', 'Vivian Bowers', 'Dennis Jefferson',
 'Dale Arnold', 'Joseph Christensen', 'Billie Norton', 'Darla Pope',
 'Tommie Dixon', 'Toby Beck', 'Jodi Payne', 'Marjorie Lowe',
 'Fernando Ballard', 'Jesse Maldonado', 'Elsa Burke', 'Jeanne Vargas',
 'Alton Francis', 'Donald Mitchell', 'Dianna Perry', 'Kristi Stephens',
 'Virgil Goodwin', 'Edmund Newton', 'Luther Huff', 'Hannah Anderson',
 'Emmett Gill', 'Clayton Wallace', 'Tracy Mendez', 'Connie Reeves',
 'Jeanette Hansen', 'Carole Fox', 'Carmen Fowler', 'Alex Diaz',
 'Rick Waters', 'Willis Warren', 'Krista Ferguson', 'Debra Russell',
 'Ellis Christensen', 'Freda Johnston', 'Janis Carpenter', 'Rosemary Sherman',
 'Earnest Peters', 'Kelly West', 'Jorge Caldwell', 'Moses Norris',
 'Erica Riley', 'Ray Gordon', 'Abel Poole', 'Cary Boone',
 'Grant Gomez', 'Denise Chapman', 'Vernon Moran', 'Ben Walker',
 'Francis Benson', 'Andrea Sullivan', 'Wayne Rice', 'Jamie Mason',
 'Jane Figueroa', 'Pat Wade', 'Rudy Bates', 'Clyde Harris',
 'Andre Mathis', 'Carlton Oliver', 'Merle Lee', 'Amber Wright',
 'Russell Becker', 'Natalie Wheeler', 'Maryann Miller', 'Lucia Byrd',
 'Jenny Zimmerman', 'Kari Mccarthy', 'Jeannette Cain', 'Ian Walsh',
 'Herman Martin', 'Ginger Farmer', 'Catherine Williamson', 'Lorena Henderson',
 'Molly Watkins', 'Sherman Ford', 'Adam Gross', 'Alfred Padilla',
 'Dwayne Gibson', 'Shawn Hall', 'Anthony Rios', 'Kelly Thomas',
 'Allan Owens', 'Duane Malone', 'Chris George', 'Dana Holt',
 'Muriel Santiago', 'Shelley Osborne', 'Clinton Ross', 'Kelley Parsons',
 'Sophia Lewis', 'Sylvia Cooper', 'Regina Aguilar', 'Sheila Castillo',
 'Sheri Mcdonald', 'Lynn Hodges', 'Patrick Medina', 'Arlene Tate',
 'Minnie Weber', 'Geneva Pena', 'Byron Collier', 'Veronica Higgins',
 'Leo Roy', 'Nelson Lopez')
 
$temporal_array = @()

function insert-name ($new_name)
{
    $Global:name_list += $new_name
}

function delete-name($name)
{
    for($j = 0; $j -lt $name_list.length; $j++)
    {
        if($name_list[$j] -ne $name)
        {
            $temporal_array += $name_list[$j]
        }
        
        else
        {
            #write-host "Name has been found"
        }
    }
}

#OPTION-1
function Option-1 ()
 {
    
    $counter = 0
    $first_name_start = Read-Host "Enter the first name, or a partial start of the first name"
    write-host
    $first_name_start = (Get-Culture).TextInfo.ToTitleCase($first_name_start.ToLower())
    
    #Iterating through each element in the array
    foreach($i in $name_list)
    {
        if($i.StartsWith($first_name_start))
        {
            $counter += 1
            write-host $i
        }     
    }
    
    #If no names were found
    if($counter -eq 0)
        {
           Write-host "No first names were found starting with" $first_name_start
        }
 }
 
 
 #OPTION-2
 function Option-2 ()
 {
    $counter = 0
    $myArray = @()

    $last_name_start = Read-Host "Enter the last name, or a partial start of the last name"
    Write-host
    $last_name_start = (Get-Culture).TextInfo.ToTitleCase($last_name_start.ToLower())

    foreach($i in $name_list)
    {
        $myArray += $i.Split()
    }

    for($j = 1; $j -lt $myArray.length; $j+= 2)
    {
        if($myArray[$j].StartsWith($last_name_start))
        {
            $counter += 1
            Write-host($myArray[$j - 1] + " " + $myArray[$j])
        }
    
        else
        {
            continue
        }
    }
    
    if($counter -eq 0)
        {
           Write-host "No last names were found starting with" $last_name_start
        } 
 }
 
 
 #OPTION-3
 function Option-3 ()
 {
    $new_first_name = Read-Host "Enter the new first name"
    $new_last_name = Read-Host "Enter the new last name"
    write-host
    $new_full_name = $new_first_name + " " + $new_last_name
    $new_full_name = (Get-Culture).TextInfo.ToTitleCase($new_full_name.ToLower())
    
    #$name_list = insert-name -name_list $name_list -inserted $new_full_name
    
    insert-name -new_name "$new_full_name"              
    
    write-host $new_full_name "has been added"
 }
 
 
 #OPTION-4
 function Option-4 ()
 {
    while ($true)
    {
        Write-host
        write-host ("The full name is required. Use menu option 1 to view names if needed")     
        Write-host
        $view_names_or_quit = Read-Host 'Enter the full name, "1" to view names or "Q" to quit'
        Write-host
        #$counter = 0
    
        if($view_names_or_quit -eq 1)
        {
            Option-1
        }
    
        if($view_names_or_quit.ToUpper() -eq 'Q')
        {
            break
        }
        
        else
        {
            foreach($i in $name_list)
            {
                if($i -eq $view_names_or_quit)
                {
                    delete-name -name $i
                    
                    $counter += $counter + 1
                    Write-host
                    #$name_list = $temporal_array
                    Write-host ($i + ' has been deleted')
                    break
                }
                #$name_list = $temporal_array
            }
        
            if($counter -eq 1)
            {
                break
            }
        
            else
            {
                if($view_names_or_quit -eq 1)
                {
                    
                }
                
                else
                {
                    Write-host($view_names_or_quit + " does not exist. Please try again.")
                    Write-host
                }
            }
        }
    }    
 }
 
 function Option-5 ()
 {
    break
 }
 
 
 
while ($true)
{
    write-host
    Write-host "Please select from the following options:"
    Write-host
    Write-host "   1. List all names starting with one or more letters of the first name"
    Write-host "   2. List all names starting with one or more letters of the last name"
    write-host "   3. Add a name"
    Write-host "   4. Delete a name"
    Write-host "   5. Exit"
    Write-host
    $userInput = Read-Host "Option #"
    Write-host

    if($userInput -eq 1)
    {
        Option-1
    }
    
    if($userInput -eq 2)
    {
        Option-2
    }
    
    if($userInput -eq 3)
    {
        Option-3
    }
    
    if($userInput -eq 4)
    {
        Option-4
        $name_list = $temporal_array
        
    }
    
    if($userInput -eq 5)
    {
        Option-5
    }
    
    else
    {
        continue
    }
}