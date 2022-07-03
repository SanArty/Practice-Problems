import random
import copy
import sys

#Declaring the base deck
card_deck = [['Ace of Spades', 'King of Spades', \
            'Queen of Spades', 'Jack of Spades', \
            '10 of Spades', '9 of Spades', \
            '8 of Spades', '7 of Spades', \
            '6 of Spades', '5 of Spades', \
            '4 of Spades', '3 of Spades', \
            '2 of Spades'], \
            ['Ace of Diamonds', 'King of Diamonds', \
            'Queen of Diamonds', 'Jack of Diamonds', \
            '10 of Diamonds', '9 of Diamonds', \
            '8 of Diamonds', '7 of Diamonds', \
            '6 of Diamonds', '5 of Diamonds', \
            '4 of Diamonds', '3 of Diamonds', \
            '2 of Diamonds'],\
            ['Ace of Clubs', 'King of Clubs', \
            'Queen of Clubs', 'Jack of Clubs', \
            '10 of Clubs', '9 of Clubs', \
            '8 of Clubs', '7 of Clubs', \
            '6 of Clubs', '5 of Clubs', \
            '4 of Clubs', '3 of Clubs', \
            '2 of Clubs'],\
            ['Ace of Hearts', 'King of Hearts', \
            'Queen of Hearts', 'Jack of Hearts', \
            '10 of Hearts', '9 of Hearts', \
            '8 of Hearts', '7 of Hearts', \
            '6 of Hearts', '5 of Hearts', \
            '4 of Hearts', '3 of Hearts', \
            '2 of Hearts']]

#Copying the base deck into a game deck that can be modified
game_deck = copy.deepcopy(card_deck)

def dealing_cards():
    while True:
        if(len(game_deck) <= 0):
            print("There are no more cards. Sorry!")
            break
        
        #Choosing a number between 1 and the number of suits
        random_suit_number = random.randint(0, len(game_deck) - 1)
        
        #delete the suit if it is empty
        if(len(game_deck[random_suit_number]) == 0):
            del game_deck[random_suit_number]
            continue
        
        #Choosing a number between 1 and the number of cards in a suit
        random_number_inside_suit = random.randint(0, len(game_deck[random_suit_number])-1)
        
        #Print selected card
        print(game_deck[random_suit_number][random_number_inside_suit])
        
        #Once the card has appeared it will be deleted
        del game_deck[random_suit_number][random_number_inside_suit]
        break
    
#dealing_cards()
print('The deck has been shuffled and it is ready for you to start playing')

while True:
    #Getting a number from the user
    number_of_cards = input('How many cards do you want to draw? ')
    print()
    
    #Making sure the input is an integer
    try:
        int(number_of_cards)
    except:
        print('The input needs to be an integer')
        continue
    
    #Calling the function as many times as the user wants 
    for i in range(0, int(number_of_cards)):
        dealing_cards()
    
    #Asking the user to start over, continue or quit
    print()
    userInput = input('Press S to shuffle and draw, or Q to quit. Anything else to continue: ')
    if(str(userInput) == 'Q'):
        break
    elif(str(userInput) == 'S'):
        game_deck = copy.deepcopy(card_deck)
        print('The deck has been shuffled')
        print()
        continue
    else:
        continue

#Ending the game
print()  
input('Thanks for playing! Please hit enter to exit the game')
sys.exit()
