#!/bin/sh
clear

SODA_BASE_PRICE=100
#payment=0
#balance=0

#echo $SODA_BASE_PRICE
#echo $payment
#echo $balance

price_variance=$(( ($RANDOM%4) * 5))
#echo $price_variance

random_cost=$(($SODA_BASE_PRICE-$price_variance))

echo "Welcome to the soda machine. You can enter values of 5, 10 or 25 in payment"
echo ""
read -p "What type of soda would you like? " soda_type
echo ""
echo "The current price of" $soda_type "is" $random_cost "cents"
echo ""

while true;
do
	read -p "Enter a coin: " coin
	if [ $coin -eq 5 ] >/dev/null 2>&1 ;then
		echo "You have inserted a nickel."
	elif [ $coin -eq 10 ] >/dev/null 2>&1 ;then
		echo "You have inserted a dime."
	elif [ $coin -eq 25 ] >/dev/null 2>&1 ;then
		echo "You have inserted a quarter."
	else
		echo "That is not a valid amount."
		echo "You still owe" $balance "cents."
		echo ""
		continue
	fi
	payment=$(($payment+$coin))
	balance=$(($random_cost-$payment))
	#echo $balance
	if [ $balance -gt 0 ];then
		echo "You still owe" $balance "cents."
		echo ""
		continue
	elif [ $balance -lt 0 ];then
		echo ""
		echo "You have been refunded" $(($balance * -1)) "cents"
		echo ""
		break
	else
		echo ""
		break
	fi
done

echo "Enjoy your" $soda_type"!"
echo ""
read -p "Press the enter key to close the script" end
