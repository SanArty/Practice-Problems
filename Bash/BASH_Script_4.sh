#! /bin/bash

lyrics_string="Quisiera:Ayer:cambiarle:conocí:el:un:final
:cielo:al:sin:cuento|Las:sol|Y:barras:un:y:hombre:los:sin
:tragos:suelo|Un:han:santo:sido:en:testigo|De:prision|Y:el
:una:dolor:canción:que:triste:me:sin:causaste:dueño|Y:y
:conocí:to':tus:lo:ojos:que:negros|Y:hciste:ahora:conmigo|Un
:sí:infeliz:que:en:no:el:puedo:amor,:vivir:que:sin:aun
:ellos:no:yo|Le:te:pido:supera|Que:al:ahora:cielo:camina
:solo:solo:un:sin:deseo|Que:nadie:en:por:tus:todas:ojos
:las:yo:aceras|Preguntándole:pueda:a:vivir|He:Dios:recorrido
:si:el:en:mundo:verad:entero|te:el:vengo:amor:a:existe|:decir|"


declare -a song1=()
declare -a song2=()

lyrics_string_spaces=($(echo $lyrics_string | tr ":" " "))
#echo ${lyrics_string_spaces[*]}
for i in ${lyrics_string_spaces[*]};
do
	echo $i
	#$lyrics_string_spaces[$i]
done
#lyrics=($(echo $lyrics_string_spaces | cut -d " " -f 1-))
#echo ${lyrics[*]}
#echo ${lyrics[1]}

