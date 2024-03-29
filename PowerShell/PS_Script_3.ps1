#PowerShell
#Ayrton D. Ledesma Fuentes

clear

$InputListStatic = @()
#$InputListStatic = @(3.14, "Three", -23, -4, 817, 12, "cat", "MOUSE", "dog7", "grEen")

$OnlyIntegersArray = @()
$counter = 0

function Marvel-Character($InputStaticList, [string]$MarvelCharacterName)
 {
    $tmpArray = @()
    $Position = Get-Random -Minimum 0 -Maximum $InputListStatic.length
    
    if($Position -eq 0)
    {
        $tmpArray += $MarvelCharacterName
        for($i = 0; $i -lt $InputListStatic.length; $i++)
        {
            $tmpArray += $InputListStatic[$i]
        }
        #return $tmpArray
    }
    
    elseif($Position -ge $InputListStatic.length)
    {
        for($i = 0; $i -lt $InputListStatic.length; $i++)
        {
            $tmpArray += $InputListStatic[$i]
        }
        $tmpArray += $MarvelCharacterName
        #return $tmpArray
    }
    
    else
    {
        for($i = 0; $i -lt $Position; $i++)
        {
            $tmpArray += $InputListStatic[$i]
        }
        $tmpArray += $MarvelCharacterName
         for($i = $Position; $i -lt $InputListStatic.length; $i++)
        {
            $tmpArray += $InputListStatic[$i]
        }
        #return $tmpArray     
    }
    Write-host
    Write-host $MarvelCharacterName "is at position" $Position "in the array"
    Write-host $tmpArray
    
 }
 

 while ($true)
{
    
    if($counter -lt 10)
    {
        $userInput = Read-Host "Please enter a number of a word"
        $InputListStatic += $userInput
        $counter += 1
    }
    
    else
    {
        break
    }
}


#Length of the array
Write-host    
$CheckingLength = $InputListStatic.length -eq 10
Write-host "This array has 10 items. " $CheckingLength

#Initial Array
Write-host
Write-host "This is the array:"
Write-host $InputListStatic

#Swapping first and last values  
$tmp = $InputListStatic[0]
$InputListStatic[0] = $InputListStatic[$InputListStatic.length - 1]
$InputListStatic[$InputListStatic.length - 1] = $tmp

Write-Host
Write-host "This is the array after swapping the first and last items:"
Write-host $InputListStatic
   
#First three and last three values of the array
Write-Host
Write-Host "These are the first three and last three items in the array:"
Write-Host $InputListStatic[0] $InputListStatic[1] $InputListStatic[2] $InputListStatic[7] $InputListStatic[8] $InputListStatic[9]

#Printing each element one by one
Write-host
Write-host "These are the individual items in my array:"
foreach ($element in $InputListStatic)
{
    Write-host $element
}

#Checking to see if the array contains the word cat
Write-host
if($InputListStatic -Contains("cat"))
{
    Write-host "There is a cat in my array"
}

else
{
    Write-host "There is NOT a cat in my array"
}

#Entering a marvel name and passing it to a function that will insert the name at a random index in the array
Write-host  
$userInput2 = Read-Host "Please insert the name of a Marvel character"

Marvel-Character -InputListStatic $InputListStatic -MarvelCharacterName $userInput2

#Sorting all the integers in the string
foreach ($element in $InputListStatic)
{
    #Only passing numbers
    try    
    {
        [int]$element | Out-Null
    }
    catch    
    {
        #Write-host $element "not an integer" 
        continue
    }
    
    #Working with negative integers, Math::abs 
    if($element -lt 0)
    {
        $tmpElement = $element * -1
    }
    
    else
    {
        $tmpElement = $element
    }
    
    #Passing only integers, not doubles
    
    #Write-host ($element) "=" ([math]::abs($tmpElement) - [int]$tmpElement)
    $Difference = [math]::abs($tmpElement) - [int]$tmpElement
     
    
    if($Difference -eq 0)
    {
        $OnlyIntegersArray += $element
        continue
    }
    
    if($Difference - (-2 * $element) -eq 0)
    {
        $OnlyIntegersArray += $element
        continue
    } 
}

#Sorting the array
$OnlyIntegersArray = $OnlyIntegersArray | sort
Write-host
Write-host "The integers in the original array, sorted, are: " $OnlyIntegersArray

#Exiting the program
Write-Host
Read-Host -Prompt "Press enter to close the program"  
break