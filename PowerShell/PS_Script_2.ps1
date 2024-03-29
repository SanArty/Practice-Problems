#PowerShell ISE
#Ayrton D. Ledesma Fuentes

function Math-Problem($num)
 {
    return [math]::Pow($num, $num) + $num
 }
 
 while ($true)
{
    $UserInput = Read-Host "Please enter an integer between 1 and 10"
    
    try
    {
        $UserInput = $UserInput/1
    }
    
    catch
    {
        Write-host "That is not an integer. Please try again."
        continue
    }
    
    $Difference = $UserInput - [int]$UserInput
    
    if($Difference -gt 0)
    {
        Write-host "That is not an integer. Please try again."
        continue
    }
    
    if ($UserInput -gt 10)
    {
        Write-host "Integer out of bounds. Please try again."
        continue
    }
    
    if($UserInput -lt 0)
    {
        Write-host "Integer out of bounds. Please try again."
        continue
    }
    
    else
    {
         Math-Problem -num $UserInput
    }
     
    $GoAgain = Read-Host "Press Q to exit. Anything else to go again"
    
    if($GoAgain -ne 'Q')
    {
        continue
    }
    
    else
    {
        break
    }
    
}