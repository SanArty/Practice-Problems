#! python3
#Project

#Ayrton D. Ledesma Fuentes

import string, getpass, os, shutil, zipfile, io, sys

active_clients = {}
dnc_clients = {}
employee_data = {}
alphabet = {}

desk_path = ''

user = getpass.getuser()
client_data_path = os.path.join('C:\\', 'Users', user, 'Desktop', 'client_data')
archived_data_path = os.path.join('C:\\', 'Users', user, 'Desktop', 'client_data', 'archived_data')
data_for_import_path = os.path.join('C:\\', 'Users', user, 'Desktop', 'client_data', 'data_for_import')
reports_path = os.path.join('C:\\', 'Users', user, 'Desktop', 'client_data', 'reports')
active_clients_path = os.path.join('C:\\', 'Users', user, 'Desktop', 'client_data', 'active_clients.csv')
dnc_clients_path = os.path.join('C:\\', 'Users', user, 'Desktop', 'client_data', 'dnc_clients')

desk_path = os.path.join('C:\\Users',user,'Desktop')

os.chdir(desk_path)

#Creating a folder named client_data on the desktop

if os.path.exists(client_data_path) == False:
    os.mkdir('client_data')

#Going inside client_data
os.chdir(client_data_path)

#Creating folders named archived_data_path, data_for_import and reports if they doesnt exist
#archived_data
if os.path.exists(archived_data_path) == False:
    os.mkdir('archived_data')

#data_for_import
if os.path.exists(data_for_import_path) == False:
    os.mkdir('data_for_import')

#reports
if os.path.exists(reports_path) == False:
    os.mkdir('reports')

#Creating active_clients.csv
if os.path.exists(active_clients_path) == False:
    with open('active_clients.csv','w') as f:
        f.write('')

#Creating active_clients.csv
if os.path.exists(dnc_clients_path) == False:
    with open('dnc_clients.csv','w') as f:
        f.write('')


#Menu
def Menu():
    while True:
        print('''
Menu Options:
    1: Import new customer data
    2: Add customer to Do Not Call (DNC) list
    3: Reports
    4: Exit the program
''')
        userInput = input('Please enter your choice: ')
        
        try:
            int(userInput)
        except:
            print('That is not an option. Please try again.')
            continue
        if(int(userInput)) > 4:
            print('That is not an option. Please try again.')
            continue
            
        if(int(userInput)) == 1:
            MenuOption1()

        if(int(userInput)) == 2:
            MenuOption2()

        if(int(userInput)) == 3:
            MenuOption3()
            
        if(int(userInput)) == 4:
            print('\nExciting now!')
            print('Have a good day!\n')
            sys.exit()
            

def MenuOption1():
    while True:
        print('\nPlease manually move all customer data files for input into the data_for_import directory.')
        input('\n********** Press enter when they are ready to be imported **********')
        for folder_name, subfolders, filenames, in os.walk(data_for_import_path):
            if len(filenames) == 0:
                print('\n********************* data_for_import IS EMPTY *********************')
                continue
            else:   
                print('\nImporting information from: ')

            #WORKING ON The user is allowed to put multiple files in the ‘data_for_import’ folder.  All files will be .csv files.  All files in the “data_for_import” folder will be processed one at a time.  For each file, data needs to be put into the “active_clients” csv file:

            for folder, subfolder_list, file_name_list in os.walk(data_for_import_path):
                for file_name in file_name_list:
                    if file_name.endswith('.csv') == False:
                        print("\nFile: " + file_name + " is NOT a .csv file")
                    else:
                        os.chdir(data_for_import_path)
                        with open(file_name, 'r') as f:
                                os.chdir(client_data_path)
                                print(file_name)
                                with open('active_clients.csv','w') as j:
                                    for line in f:
                                        full_name = line.split(',')[0]
                                        phone_number = line.split(',')[1]
                                        address = line.split(',')[2]
                                        city = line.split(',')[3]
                                        state = line.split(',')[4]
                                        zipCode = line.split(',')[5]
                                        DOB = line.split(',')[6]
                                        salary = line.split(',')[7]
                                        company = line.split(',')[8]
                                        if len(full_name) == 0:
                                            continue
                                        else:
                                            duplicates_name = full_name
                                            duplicates_DOB = DOB
                                            duplicates_phone_number = phone_number
                                            full_names_parts = duplicates_name.split(' ')
                                            last_names = full_names_parts[0]
                                            
                                            if duplicates_name not in employee_data:
                                                employee_data[duplicates_name] = []
                                                employee_data[duplicates_name].append(full_name)
                                                if duplicates_DOB not in employee_data:
                                                    employee_data[duplicates_DOB] = []
                                                    employee_data[duplicates_DOB].append(DOB)
                                                    if duplicates_phone_number not in employee_data:
                                                        employee_data[duplicates_phone_number] = []
                                                        employee_data[duplicates_phone_number].append(phone_number)

                                                        j.write(line)
                                                        continue
                                                    else:
                                                        continue
                                                else:
                                                    continue
                                            else:
                                                continue
                                            continue
                        
                        emp_data = zipfile.ZipFile('.\\archived_data\\' + file_name + '.zip', 'w')
                        emp_data.write('active_clients.csv', compress_type = zipfile.ZIP_DEFLATED)
                        emp_data.close()

                        print('\nFile: ' + file_name + ' has been imported and copied into a zip file in the archived_data folder.')
        break                 
    decisionInput = input('\nPress M to go back to the menu. Anything else to exit: ')
    if decisionInput.upper() == 'M':
        sys.exit()

def MenuOption2():
    counter = 0
    userInput = input('Enter a name or a partial name: ')

    with open('active_clients.csv','r') as f:
        for line in f:
            full_name = line.split(',')[0]
            full_name_capitalized = full_name.upper()
            userInput = userInput.upper()

            if userInput == full_name_capitalized:
                counter += 1
                print('\n' + line)
                addInput = input('Press A to add ' + full_name + ' to the DNC file. This action is irreversible. ')
                
                if addInput == 'A':
                    print('\nAdding ' + full_name + ' to the DNC file.')
                    
                    with open('dnc_clients.csv', 'w') as f:
                        f.write(line)
                else:
                    continue

            if full_name_capitalized != 'NAME':
                first_name = full_name_capitalized.split(' ')[0]
                last_name = full_name_capitalized.split(' ')[1]
                if first_name.startswith(userInput):
                    counter += 1
                    print('\n' + full_name +'\n')
                    decision_Input = input('Enter A to add ' + full_name + ' to the DNC file. (This action is irreversible). Anything else to look for another match.')
                    if decision_Input == 'A':
                        print('\nAdding ' + full_name + ' to the list.\n')
                        with open('dnc_clients.csv', 'w') as f:
                            f.write(line)
                        decision_Input_dos = input('Enter C to continue searching. M to go back to the main menu: ')
                        if decision_Input_dos == 'M':
                            break
                        if decision_Input_dos == 'C':
                            continue

                        
                if last_name.startswith(userInput):
                    counter += 1
                    print('\n' + full_name + '\n')
                    decision_Input = input('Enter A to add ' + full_name + ' to the DNC file. (This action is irreversible). Anything else to look for another match.')
                    if decision_Input == 'A':
                        print('\nAdding ' + full_name + ' to the list.\n')
                        with open('dnc_clients.csv', 'w') as f:
                            f.write(line)
                        decision_Input_dos = input('Enter C to continue searching. M to go back to the main menu.')
                        if decision_Input_dos == 'M':
                            break
                        if decision_Input_dos == 'C':
                            continue
            else:
                continue

        if counter > 0:
            print('\nTotal Matches: ' +str(counter))
        else:
            print('\nNo names that start with ' + userInput.lower())
            input('\n*********************Back to main menu*********************')

def MenuOption3():
    while True:
        print('''
Report Menu Options:
    1: Salary Reports
    2: Miscellaneous Reports 
''')
        userInput = input('Please enter your choice: ')
        try:
            int(userInput)
        except:
            print('That is not an option. Please try again.')
            continue
        
        if(int(userInput)) > 2:
            print('That is not an option. Please try again.')
            continue
            
        if(int(userInput)) == 1:
            salaryReports()

        if(int(userInput)) == 2:
            MiscellaneousReports()
           
        break

def salaryReports():
    while True:
        print('''
Report Menu Options:
    1: Salary by State
    2: Salary by City
    3: Salary by Company
    4: Top % of Salaries
    5: Average Salaries
''')
        userInput = input('Please enter your choice: ')
        try:
            int(userInput)
        except:
            print('That is not an option. Please try again.')
            continue
        
        if(int(userInput)) > 5:
            print('That is not an option. Please try again.')
            continue
            
        if(int(userInput)) == 1:
            salaryByState()
            print('Salary by State')
            
        if(int(userInput)) == 2:
            print('Salary by City')
            salaryByCity()
            
        if(int(userInput)) == 3:
            print('Salary by Company')
            salaryByCompany()
            
        if(int(userInput)) == 4:
            print('Top % of Salaries')
            topSalaries()
            
        if(int(userInput)) == 5:
            print('Average Salaries')
            averageSalaries()
            
        break

def MiscellaneousReports():
    while True:
        print('''
Report Menu Options:
    1: Customer Age Brackets
    2: Contact List
''')
        userInput = input('Please enter your choice: ')
        try:
            int(userInput)
            
        except:
            print('That is not an option. Please try again.')
            continue
        
        if(int(userInput)) > 2:
            print('That is not an option. Please try again.')
            continue
            
        if(int(userInput)) == 1:
            print('Customer Age Brackets')
            customerAgeBrackets()
            
        if(int(userInput)) == 2:
            print('Contact List')
            contactList()
            
        break

def salaryByState():
    employee_data = []
    employee_data_byState = []
    employee_data_name = []
    
    with open('active_clients.csv','r') as f:
        for line in f:
            employee_list = line.split(',')
            counter = 0

            for i in range(int(len(employee_list)/9)):
                employee_data.append({'Name':employee_list[i + counter], 'Phone':employee_list[i + 1 + counter], 'Address':employee_list[i + 2 + counter], 'City':employee_list[i + 3 + counter], 'State':employee_list[i + 4 + counter], 'Zip':employee_list[i + 5 + counter], 'DOB':employee_list[i + 6 + counter], 'Salary':employee_list[i + 7 + counter], 'Company':employee_list[i + 8 + counter]})
                counter += 8          

                if employee_list[4] != 'State':
                    employee_data_byState.append(employee_list[4])
                    employee_data_byState.sort()
        print(employee_data_byState)
                
                
Menu()
