#! python3

import sys

#Initial List
name_list = ['Constance Castillo', 'Kerry Goodwin',
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
 'Leo Roy', 'Nelson Lopez']

#Function No.1 - Find a name with the first letter of the name
def option1():
    
     count = 0
     option1 = []
     firstNameLetter = input('\nWhat letter does the first name begin with? \n')
     
     for i in range(0, len(name_list)):
         if name_list[i].startswith(firstNameLetter.upper()) == True:
            count += 1
            option1.append(name_list[i])
     print()
     
     
     if int(count) == 0:
         print('No first names were found starting with the letter ' + str(firstNameLetter.upper())+ '\n')
     
     else:
        for j in range(0, len(option1)):
            print(option1[j])
        print()
 
#Function No.2 - Find a name with the first letter of the last name    
def option2():
     
     newList = []
     newList2 = []
     lastNamefirstLetter = input('\nWhat letter does the last name begin with? ')
     print()
     counter = 0
     
     
     for i in range(0, len(name_list)):
        newList.append(name_list[i].split())
        
     for j in range(0, len(newList)):
        if newList[j][1].startswith(lastNamefirstLetter.upper()) == True:
           counter += 1
           newList2.append(name_list[j][1])
           print(newList[j][1] + ', ' + newList[j][0])
           
     if int(counter) == 0:
         print('No first names were found starting with the letter ' + str(firstNameLetter.upper())+ '\n')
     
#Function No.3 - Add a name to the initial list
def option3():
     
     newFirstName = input('\nEnter the new first name: ')
     newLastName = input('Enter new last name: ')
     
     newName = str(newFirstName) + ' ' + str(newLastName)
     name_list.append(newName)
     
     print('\n' + str(name_list[len(name_list) - 1]).title() + ' has been added. \n' )
     
#Function No.4 - Delete a name from the list
def option4():
     deleteName = input('\nEnter the full name to delete: ')
     deleteName = deleteName.title()
     
     try:
        name_list.remove(str(deleteName))
        print('\n' + str(deleteName) + ' has been deleted. \n' )
        
     except:
         print('\nThat name was not found\n')

#Function No.5 - Exit the list         
def option5():
     sys.exit()

while True:
    
    #Menu Bar
    print('''Please select from the following options:
        
        1.- List all first names beginning with a chosen letter
        2.- List all last names beginning with a chosen letter
        3.- Add a name
        4.- Delete a name
        5.- Exit
        ''')
        
    userInput = input('Option#: ')
    
    #Calling the needed function
    if int(userInput) == 1:
        option1()
        continue
        
    elif int(userInput) == 2:
        option2()
        continue
        
    elif int(userInput) == 3:
        option3()
        continue
        
    elif int(userInput) == 4:
        option4()
        continue
        
    elif int(userInput) == 5:
        option5()
        continue
    
    else:
        print('\nThat is not a valid option. Please try again.\n')
        continue