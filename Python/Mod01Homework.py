#! python3

BASE_PRICE = 100
money_entered = 0


import random
random_number = random.randint(-3, 3)
variance_price = random_number * 5
soda_price = BASE_PRICE + variance_price

print('WELCOME! To purchase a soda we only accept nickels(5c), dimes(10c) and quarters(25c).')
print('What type of soda would you like today?')
soda_name = input()

print('Because of global warming the price of a ' + soda_name + ' is ' + str(soda_price) + ' cents.')
print('Please enter a coin: ')

while True:
    coin = int(input())
    money_entered += coin
    balance = soda_price - money_entered
    
    if(balance > 0):
        print('You still need ' + str(balance) + ' more cents.')
        print('Please enter another coin: ')
        
    elif(balance < 0):
        balance = abs(balance)
        print('You have been refunded ' + str(balance) + ' cents.')
        print('Please take your change!')
        break

    else:
        break
    
print('Have a good day and enjoy your ' + soda_name + '!')
