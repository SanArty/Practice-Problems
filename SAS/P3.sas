/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 3								*/
/*								   PART 1									*/
data salaryIncrease;
	/* Declaring array current Salary and new Salary of size 5 */
	ARRAY currentSalary{5} year1-year5;
	ARRAY newSalary{5} year1-year5;

	/* Declaring initial Slary and interest rate*/
	initialSalary = 60000;
	interest = 0.03;

	/* Iterative loop to calculate salary after 5 years at +0.03% interest rate */
	do i = 1 to 5;
    	currentSalary{i} = initialSalary;
    	newSalary{i} = currentSalary{i} + (currentSalary{i} * interest);
    	initialSalary = newSalary{i};
	end;
	drop i;
	
	/* Changing format of values to dollars with two decimal places */
	format initialSalary Dollar10.2;
	format year1-year5 Dollar10.2;
run;

/* Printing results of data set Salary Increase*/
proc print data = salaryIncrease;
	title "Salary Increase 3% per year";
run;

/*								   PART 2									*/
/* Do until loop */
data salaryOver100kDoLoop;
	currentSalary = 60000;
	interest = 0.03;
	Year = 0;
	/*Iterative Loop until salary is at least 100k */
	do until(currentSalary >= 100000);
    	newSalary = currentSalary + (currentSalary * interest);
    	currentSalary = newSalary;
    	Year + 1;
    end;
    drop newSalary;
    format currentSalary Dollar10.2;
    format interest PERCENT7.1;
run;

data salaryOver100kWhileLoop;
	currentSalary = 60000;
	interest = 0.03;
	Year = 0;
	/* Iterative loop while the current salary is less than 100k */
	do while(currentSalary < 100000);
    	newSalary = currentSalary + (currentSalary * interest);
    	currentSalary = newSalary;
    	Year + 1;
    end;
    drop newSalary;
    format currentSalary Dollar10.2;
    format interest PERCENT7.1;
run;

/* Printing results from salaryOver100k - Do Loop */
proc print data = salaryOver100kDoLoop;
	title "Time it will take to get over 100k salary - Do Loop ";
run;

/* Printing results from salaryOver100k - While Loop */
proc print data = salaryOver100kWhileLoop;
	title "Time it will take to get over 100k salary - While Loop ";
run;

/* ANSWER: It will take 18 years! */

/*								   PART 3									*/
data collegeFundSavings;
	/* Declaring all initial variables*/
	currentSavings = 0;
	constantDeposit = 8000;
	initialDeposit = 8000;
	interest = 0.07;
	Year = 0;

	/* Account starts is opened with $8,000 */
	currentSavings = currentSavings + initialDeposit;
	/* Iterative loop while the current salary is less than 100k */
	do while(currentSavings <= 120000);
    	currentSavings = currentSavings + (currentSavings * interest) + constantDeposit;
    	Year + 2;
    end;
    format currentSavings Dollar10.2;
    format initialDeposit Dollar10.2;
    format constantDeposit Dollar10.2;
    format interest PERCENT7.1;
run;

/* Printing results from CollegeFundSavings*/
proc print data = collegeFundSavings;
	title "Funds for College";
run;

/* ANSWER: It will take 20 years to have over $120,000 in the bank account */
	
	
	