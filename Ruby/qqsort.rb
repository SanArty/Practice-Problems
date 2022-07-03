# <qqsort.rb>
# author: <Ayrton Ledesma>
# course: <CS3363>, <Fall 2020>
# assignment: <Program 5>
# due: <11/01/2020>, <11:59pm>
# submitted: <10/28/2020>

# function qqsort - Quicksort: Takes an array 'a' as an input
def qqsort(a)
    return [] if a.length == 0 # No need to continue if 'a' is empty
    
    # pivot = A random value from the array (leaving random since it reduces the chances that
    # any list will produce O(n2) time performance). 
    # delete_at: Takes a value from the array at the given index
    pivot = a.delete_at(rand(a.length - 1))
    
    # Spliting values using partition
    # partition: Returns two arrays, in this case left and right. Values from initial array are split depending on whether they are true or false according to the statement
    left, right = a.partition{|x| x < pivot}
    
    # Recursive call of the function - repeats until all values are sorted 
    return *qqsort(left), pivot, *qqsort(right)
end

# Declaring array v
v = [9, 8, 7, 6, 5, 0, 1, 2, 3, 4]

p qqsort(v)