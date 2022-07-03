#! python3
# <pymysort.py>
# author: <Ayrton Ledesma>
# course: <CS3363>, <Fall 2020>
# assignment: <Program 4>
# due: <10/17/2020>, <11:59pm>
# submitted: <10/17/2020>

#Function pymsort - Quicksort divide and conquer
def pymysort(array):
    #length of the list
    elements = len(array)

    #Default output if length of list = 0
    if elements == 0:
        return array
    
    #Default output if length of list = 1
    elif elements == 1:
        return array

    #QuickSort
    else:
        #Storing first value of the list as the pivot
        pivot = array[0]
        
        currentPosition = 0
        currentlyChecking = 1
        #Starting iteration to check values
        for currentlyChecking in range(elements):

            #Swapping values if pivot is greater than the value being checked
            if array[currentlyChecking] < pivot:
                array[currentlyChecking], array[currentPosition + 1] = array[currentPosition + 1], array[currentlyChecking]

                #Changing currentPosition
                currentPosition = currentPosition + 1

        #Swapping pivot with currentPosition
        array[0], array[currentPosition] = array[currentPosition], array[0]

        #Doing each each side until numbers are sorted
        #left = from 0 to currentPosition
        left = pymysort(array[:currentPosition])

        #right = from currentPosition + 1 until the end of the list
        right = pymysort(array[currentPosition + 1:])

        left.append(array[currentPosition])
        
        return left + right

#Input: A list of real values
inputList = [5, 7, 9, 2, 1, 0]

#Output: A sorted list of real values using quicksort
print(pymysort(inputList))
