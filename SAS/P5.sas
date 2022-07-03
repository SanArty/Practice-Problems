/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/* 10/24/2021																*/
/*								Assignment 5								*/
/*								   PART 1									*/
/* Importing Lab5_Sales.xlsx */
proc import datafile = "/home/u59639046/sasuser.v94/Lab5_Sales.xlsx"
	DBMS = xlsx out = lab5_sales0 replace;
run;

data lab5_sales1;
	set lab5_sales0;
	
	/* Calculating mean and storing into variable average */
	average = mean(sale_m1, sale_m2, sale_m3);
	
	/* Formating numbers to dollar sign, commas and two decimal places*/
	format average sale_m1 sale_m2 sale_m3 Dollar9.2;
	
	/* Changing labels */
	label id = 'Employee id'
		sale_m1 = 'Sales in Jan'
		sale_m2 = 'Sales in Feb'
		sale_m3 = 'Sales in Mar'
		average = 'Average Sales in Quarter 1';
run;

/* Printing new data set lab5_sales 1 including label and format*/
proc print data = lab5_sales1 label;
	title 'Part 1: Calculating average, changing labels and format to 9.2';
run;

/*								   PART 2									*/
PROC FORMAT;
VALUE salesgroup low-<700 = 'need improvement'
				 700-<900 = 'good'
				 900-High = 'top sale';
run;

/* Using temporary library */
proc print data = lab5_sales1 label;
	FORMAT average salesgroup.;
	title 'Part 2: Formating average from Part 1 to need improvement, good and top sale';
run;

/*								   PART 3									*/
/* Importing Lab2_Poverty.xlsx */
proc import datafile = "/home/u59639046/sasuser.v94/Lab2_Poverty.xlsx"
	DBMS = xlsx out = lab2_poverty0 replace;
run;

/* Creating new data set using Lab2_Poverty*/
data lab5_poverty1;
set lab2_poverty0;
	/* Calculating avergae and changes in poverty rate from year to year */
	Average_Pov_Rate = mean(Year_2017, Year_2016, Year_2015);
	Ch_2015_to_2016 = Year_2016 - Year_2015;
	Ch_2016_to_2017 = Year_2017 - Year_2016;
	
	/* Assigning length of new variable note to 10 characters */
	length note $10;
	
	/* Setting note to Improve, Worsen, Unchanged, Fluctuate based on the data */
	If Year_2015 > Year_2016 AND Year_2016 > Year_2017 then note = 'Improve';
	else if Year_2015 < Year_2016 AND Year_2016 < Year_2017 then note = 'Worsen';
	else if Year_2015 = Year_2016 AND Year_2016 = 2017 then note = 'Unchanged';
	Else note = 'Fluctuate';
run;

/* Creating format: povertygroup */
PROC FORMAT;
VALUE povertygroup low-<10 = 'Below 10%'
				 10-<15 = 'Moderate'
				 15-<20 = 'High'
				 20-High = 'Very high'
				 Other = 'NA';
run;

proc print data = lab5_poverty1;
	/* Assigning povertygroup format to the average poverty rate variable */
	FORMAT Average_Pov_Rate povertygroup.;
	title 'Part 3: Calculating average, changes in poverty rate, adding note and format';
run;

