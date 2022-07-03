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

	/* Changing format of values to dollars with two decimal places */
	format initialSalary Dollar10.2;
	format year1-year5 Dollar10.2;

	/* Iterative loop to calculate salary after 5 years at +0.03% interest rate */
	do i = 1 to 5;
    	currentSalary{i} = initialSalary;
    	newSalary{i} = currentSalary{i} + (currentSalary{i} * interest);
    	initialSalary = newSalary{i};
	end;
	drop i;
run;

proc print data = salaryIncrease;
	title "Salary Increase 0.03% per year";
run;