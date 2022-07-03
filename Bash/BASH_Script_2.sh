#! /bin/sh
clear

function math_problem
{
	result=$((($1*$1)+$1))
}

while true;
do
	echo ""
	read -p "Please enter an integer between 1 and 10 (q to quit): " user_input
	echo ""
	if [[ $user_input == "q" ]];then
		echo "Quitting..."
		echo ""
		break
	fi	

	if [[ $user_input -gt 10 || $user_input -lt 1 ]];then
		echo "That is not an integer between 1 and 10. Try again."		
		continue
	else
		math_problem $user_input
		echo "The result is "$result
	fi
done
