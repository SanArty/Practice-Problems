#PowerShell ISE
#Ayrton D. Ledesma Fuentes

clear
$SodaBasePrice = 100
$Payment = 0
$Balance = 0

$MyRan = Get-Random -Minimum -3 -Maximum 3
$MyRan = $MyRan * 5

$SodaPrice = $SodaBasePrice + $MyRan
#Write-Host $soda_price

Write-Host "Welcome to the soda machine. You can enter values of 5, 10 or 25 in payment"
Write-Host
$UserInput = Read-Host -Prompt "What type of soda would you like?"

clear
Write-Host The current price of $UserInput is $SodaPrice cents

while ($true)
{
    Write-host
    $Coin = Read-Host -Prompt "Enter a coin"
    try    
    {
        [int]$Coin | Out-Null
    }
    catch    
    {
        clear
        Write-host "That is not a valid amount."
        Write-host
        Write-host "You still owe" $Balance "cents."
        continue
    }
    
    if ($Coin -eq 5)
    {
        clear
        Write-host "You have inserted a nickel."
        #continue
    }
    
    elseif ($Coin -eq 10)
    {
        clear
        Write-host "You have inserted a dime."
        #continue
    }
    
    elseif ($Coin -eq 25)
    {
        clear
        Write-host "You have inserted a quarter."
        #continue
    }
    
    
    else
    {
        clear
        Write-host "That is not a valid amount."
        Write-host
        Write-host "You still owe" $Balance "cents."
        continue
    }
     
    $Payment = $Payment + $Coin
    $Balance = $SodaPrice - $Payment
    
    if ($Balance -gt 0)
    {
        Write-Host
        Write-Host You still owe $Balance cents
        continue
    }
    
    elseif($Balance -lt 0)
    {
        Write-host
        Write-Host You have been refunded ($Balance * -1) cents
    }
    
    Write-Host
    Write-Host Enjoy your $UserInput
    Write-Host
    Read-Host -Prompt "Press Enter to Close the Script"  
    break
}



