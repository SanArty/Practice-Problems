#! python3
#This is my original dictionary of events

events={
'Weezer': {'Jan 30, 2018': ['Concrete Gold', 'Etihad Stadium', 'Melbourne, VIC'],
           'Jun 16, 2018': ['Montebello Rockfest 2018', 'Montebello Marina',  
'Montebello, QC']},
'Tenacious D': {'May 06, 2018': ['Shaky Knees Music Festival 2018', 'Central Park',
'Atlanta, GA'],
                'Jun 16, 2018': ['Montebello Rockfest 2018', 'Montebello Marina',
'Montebello, QC']},
'Lamb of God': {'Jun 09, 2018': ['Final World Tour: North America 2018', 'Keybank Pavilion', 'Burgettstown, PA'],
                'Jun 16, 2018': ['Montebello Rockfest 2018', 'Montebello Marina',
'Montebello, QC']},
'Ed Sheeran': {'Mar 10, 2018': ['Ed Sheeran with Missy Higgins', 'Etihad Stadium',
'Melbourne, VIC']},
'Cold War Kids': {'Jun 02, 2018': ['XFEST 2018', 'Keybank Pavilion', 'Burgettstown, PA']},
'Steel Panther': {'Oct 21, 2017': ['Aftershock', 'Discovery Park', 'Sacramento,  CA']}}

#Iterating through the information in {events} and printing it
#Nested loops
def printConcertInformation():
    print()
    for i in events:
        print(i)
        
        for j in events[i]:
            print('  ' + j)
            
            for k in events[i][j]:
                print('    ' + k)

#Adding a new Concert                
def addNewConcert():

    while True:
        name = input('\nArtist or Band: ')
        concert = input('Concert: ')
        date =  input('Date: ')
        venue =  input('Venue: ')
        location = input('Location: ')
        
        #When name is already part of the information, add the information instead of creating another name
        if name in events:
            events[name].update({date: [concert, venue, location]})
            
        else:
            events.update({name:  {date: [concert, venue, location]}})

        #Asking the user if they would like to add more concerts    
        userInputAdicion = input('\nQ to stop entering new concerts, anything else to add more concerts: ')
        userInputAdicion = userInputAdicion.upper()
        
        if userInputAdicion == 'Q':
            break

printConcertInformation()

while True:

    #Asking the user if they would like to add more concerts - Outside!
    userInputQuit = input('\nEnter Y if you would like to add more events or hit enter to quit: ')
    
    userInputQuit = userInputQuit.upper()
    
    if userInputQuit == 'Y':
        addNewConcert()
        printConcertInformation()
        
    else:
        break