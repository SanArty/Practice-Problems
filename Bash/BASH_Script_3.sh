#!/bin/sh
clear

input_counter=0
declare -a myArray=()
#new_array=()

echo "Create an array filled with 10 items"
echo "Be sure to get a mix of floating numbers, integers and text"
echo ""

while [ $input_counter -lt 10 ];
do
	read -p "Please enter a number or a word for index position $input_counter: " user_input
	user_input=$( echo $user_input | tr " " "_")
	myArray+=($user_input)
	input_counter=$(($input_counter+1))
done

echo ""

if [[ ${#myArray[*]} -eq 10 ]];then
	echo "This array has 10 items"
	echo ""
else
	echo "The array does not have 10 items"
	echo ""
fi

echo "This is the array: "
echo ${myArray[*]}
echo ""

firstItem=${myArray[0]}
myArray[0]=${myArray[-1]}
myArray[-1]=$firstItem

echo "This is the array after swapping the first and last items: " 
echo ${myArray[*]}
echo ""

echo "These are the first three and last three items in the array: "
first_three_and_last_three=(${myArray[*]:0:3} ${myArray[*]:7})
echo ${first_three_and_last_three[*]}
echo ""

for i in ${myArray[*]};
	do
		echo $i
	done
echo ""

cat="cat"
counter=0
for i in ${!myArray[*]};
do
	if [[ ${myArray[$i]} == $cat ]]; then
		counter=$(($counter+1))
		#echo "There is a" $cat "in my array"
	fi
done

	if [[ $counter -eq 0 ]]; then
		echo "There is not a cat in my array"
	else
		echo "There is a cat in my array"
	fi
echo ""

read -p "Please insert the name of a Marvel character: " marvel_character
marvel_character=$( echo $marvel_character | tr " " "_")
#echo $marvel_character

random_index=$(($RANDOM%${#myArray[*]}))
new_array=(${myArray[*]:0:$random_index} $marvel_character ${myArray[*]:$(($random_index))})
echo ""
echo $marvel_character "is at position" $random_index "in the array"
echo ""
echo "The array is now: "${new_array[*]}
echo ""

for i in ${!$myArray[*]};
do
	if [[ ${myArray[$i]} =~ ^-?[0-9]+$ ]]; then
		new_array_sorted+=(${myArray[$i]})
	fi
done

myArray=($(for i in ${new_array_sorted[*]}; do echo $i; done | sort -n))
echo "The integers in the original array, sorted, are: "${myArray[*]}
echo ""

read -p "Press enter to end the script: " end
echo ""