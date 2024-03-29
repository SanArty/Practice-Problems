#Ayrton D. Ledesma Fuentes
#PowerSheel Script 4

clear

#Initial string
$combined_songs = ("Quisiera:Ayer:cambiarle:conocí:el:un:final" +
               ":cielo:al:sin:cuento|Las:sol|Y:barras:un:y" +
               ":hombre:los:sin:tragos:suelo|Un:han:santo:" +
               "sido:en:testigo|De:prision|Y:el:una:dolor:" +
               "canción:que:triste:me:sin:causaste:dueño|Y:" +
               "y:conocí:to':tus:lo:ojos:que:negros|Y:hiciste" +
               ":ahora:conmigo|Un:sí:infeliz:que:en:no:el:" +
               "puedo:amor,:vivir:que:sin:aun:ellos:no:yo|" +
               "Le:te:pido:supera|Que:al:ahora:cielo:camina" +
               ":solo:solo:un:sin:deseo|Que:nadie:en:por:tus" +
               ":todas:ojos:las:yo:aceras|Preguntándole:pueda" +
               ":a:vivir|He:Dios:recorrido:si:el:en:mundo:verdad" +
               ":entero|te:el:vengo:amor:a:existe|:decir|")
               
#Arrays where each song will be stored            
$amorfada = @()
$ojos_asi = @()

#Array where repeated words will be stored
$repeated_words = @()

#Array to split the songs
$lyrics = @()
$lyrics += $combined_songs.split(":")

for ($i = 0; $i -lt $lyrics.length; $i += 2)
{
    $amorfada += $lyrics[$i] #Adding lyrics to amorfada
    $ojos_asi += $lyrics[$i + 1] #Adding lyrics to ojos asi
}

#Fixing the output - Starting a new line every time it sees a "|"
$amorfada_print = $amorfada -replace "\|", "`n"
$ojos_asi_print = $ojos_asi -replace "\|", "`n"

#Checking if the lyrics in amorfada are in ojos asi
$amorfada_lower = @()

foreach($i in $amorfada)
{
    if ($i.Contains("|"))
    {
        $new_line = $i.split("|")
        if ($new_line[0].length -ne 0)
        {
            $amorfada_lower += $new_line[0].ToLower()
        }
        
        if ($new_line[1].length -ne 0)
        {
            $amorfada_lower += $new_line[1].ToLower()
        }  
    }
    
    else
    {
        $amorfada_lower += $i.ToLower()
    }
}

$ojos_asi_lower = @()
foreach($i in $ojos_asi)
{
    #write-host $i
    if ($i.Contains("|"))
    {
        $new_line = $i.split("|")
        #write-host $new_line
        if ($new_line[0].length -ne 0)
        {
            $ojos_asi_lower += $new_line[0].ToLower()
            #write-host $amorfada_lower
        }
        
        if ($new_line[1].length -ne 0)
        {
            $ojos_asi_lower += $new_line[1].ToLower()
            #write-host $amorfada_lower
        }  
    }
    
    else
    {
        $ojos_asi_lower += $i.ToLower()
    }
}

$repeated_words = @()
foreach($j in $amorfada_lower)
{
    if($ojos_asi_lower -Contains($j))
    {
        if($repeated_words -Contains($j.ToLower()))
        {
            #$repeated_words += $j.ToLower()
        }
        else
        {
            $repeated_words += $j.ToLower()
        }
    }
}

#Sorting the repeated words
$repeated_words = $repeated_words | sort 


write-host $amorfada_print
write-host $ojos_asi_print
write-host "Words that are in both songs are:"
write-host
write-host $repeated_words
write-host
Read-Host -Prompt "Press any key to exit"