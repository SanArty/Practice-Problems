fun main() {
    fun moneyConverter(Cash: Double) {
        //Initializing two arrays: currenciesAvailable will not change and money in change will
        val currenciesAvailable = arrayOf<Double>(50.0, 20.0, 10.0, 5.0, 1.0, 0.25, 0.10 ,0.05, 0.01)
        var moneyInChange = arrayOf<Int>(0, 0, 0, 0, 0, 0, 0, 0, 0)
        val offset = 0.0001
        
        //Initializing variable to store the money remaining after each operation
        var remaining = Cash
        
        //Initializing variable that will store the maximum possible amount of bills and coins after each check
        var operation = 0;
        
        println("Amount: " + Cash)
        if(Cash < 0){
            print("No negative numbers allowed")
        }
        else {
            //Looping through all the currencies available stored in the array
        	for (i in 0..8){
                //Dividing remaining over each bill and rounding the result down to the last full int
            	operation = (remaining / currenciesAvailable[i]).toInt()
                
                //Subtracting the result from the step before and storing into the remaining variable
            	remaining = (remaining - (operation * currenciesAvailable[i])).toDouble() + offset
            	print(" " + operation)
        	}	
        }
        println()
        println()
    }

    //Initializing 6 double values of type cash, 4 of them to randomish numbers between 0 and 100, 1 to 0 and one to a negative value
    val num1 = 47.23
    val num2 = 32.19
    val num3 = 80.18
    val num4 = 14.30
    val num5 = -18.22
    val num6 = 0.0
    
    //Passing values to the moneyConverter function
    moneyConverter(num1)
    moneyConverter(num2)
    moneyConverter(num3)
    moneyConverter(num4)
    moneyConverter(num5)
    moneyConverter(num6)
}