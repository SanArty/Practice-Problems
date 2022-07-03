#!python3
import math, sys

#result = pow(userInput, userInput) + userInput
def operation(userInput):
    result = (pow(int(userInput), int(userInput)) + int(userInput))
    return result
    
#if output != Integer between 1 and 10, throw error  
while True:
    userInput = input('Enter an integer between 1 and 10: ')
    try:
        int(userInput)
    except: 
        print('That is not an Integer. Please try again.\n')
        continue
    if(int(userInput)) > 10:
        print('Integer out of bounds. Please try again.\n')
        continue
    elif(int(userInput)) < 1:
        print('Integer out of bounds. Please try again. \n')
        continue
    else:
        print(operation(userInput))
        print()
        
        #Keep looping or exiting
        done = input('Press Q to exit, anything else to go again: ')
        Q = str('Q')
        
        if(bool(str(done) == Q) == True):
            break
        else:
            print()
            continue
