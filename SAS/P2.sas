/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 2								*/
/*								   PART 1									*/

/* Importing Lab2_Vehicles.xlsx */
proc import datafile = "/home/u59639046/sasuser.v94/Lab2_Vehicles.xlsx"
DBMS = xlsx out = Lab2Vehicles replace;
run;

/* New data set Predictions, inherits data from lab2 */
data Predictions;
	set Lab2Vehicles;
	/* New variable Unit with character values In Thousands */
	Unit = 'In Thousands';
	
	/* Storing average, total, max, min, range, prediction and increase predicitons in their corresponding variables */
	Ave_sales = mean(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
	Total_sales = (Jan + Feb + Mar + Apr + May + Jun + Jul + Aug + Sep + Oct + Nov + Dec);
	Max_sales = max(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
	Min_sales = min(Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
	Range = Max_sales - Min_sales;
	
	/* 2% and 10% increase */
	Low_Prediction_2019 = Total_sales * 1.02;
	High_Prediction_2019 = Total_sales * 1.10;
	
	/* Difference between predicted min and current min */
	Pred_Low_Increase_2018_to_2019 = (Min_sales * 1.02) - Min_sales;
	
	/* Difference between predicted max and current max */
	Pred_High_Increase_2018_to_2019 = (Max_sales * 1.10) - Max_sales;
run;

/* Printing new and modified data set Predictions*/
proc print data = Predictions;
run;

/*								   PART 2									*/
/* Importing Lab2_Poverty.xlsx */
proc import datafile = "/home/u59639046/sasuser.v94/Lab2_Poverty.xlsx"
DBMS = xlsx out = Lab2Poverty replace;
run;

/* New data set Part 2 inherits all data from Lab2Poverty*/
data Part2;
	set Lab2Poverty;
	
	/* New variable Unit with character values Percentage */
	Unit = 'Percentage';
	
	/* Storing average, max, min, change in poverty from 2015 to 2016 and 2016 to 2017 in their corresponding variables */
	Average_Pov_Rate = (Year_2017 + Year_2016 + Year_2015)/3;
	Max_Pov_Rate = max(Year_2017, Year_2016, Year_2015);
	Change_In_Pov_2015_to_2016 = Year_2016 - Year_2015;
	Change_In_Pov_2016_to_2017 = Year_2017 - Year_2016;
run;

/* Printing new and modified data set Part2 */
proc print data = Part2;
run;

/* The states that have the highest and lowest average poverty rates are MS with 21.000 avg and NH with 7.90 avg */

/* Creating new data set Part2_2. Inherits all data from Part2 */
data Part2_2;
	set Part2;
	
	/* Changing label based on ranges. below 10, 10-15, 15-20, 20+, anything else */
	If Average_Pov_Rate < 10 then label = 'Below 10%';
	else if Average_Pov_Rate >= 10 AND Average_Pov_Rate < 15 then label = 'Moderate';
	else if Average_Pov_Rate >= 15 AND Average_Pov_Rate < 20 then label = 'High';
	else if Average_Pov_Rate > 20 then label = 'Vey High';
	Else label = 'NA';
	
	/* Changing note based on Improvement*/
	If Year_2015 > Year_2016 AND Year_2016 > Year_2017 then note = 'Improve consecutively';
	else if Year_2015 < Year_2016 AND Year_2016 < Year_2017 then note = 'Worsen consecutively';
	else if Year_2015 = Year_2016 AND Year_2016 = 2017 then note = 'Unchanged';
	Else note = 'Fluctuate';
run;

/* Printing new and modified data set Part2_2 */
proc print data = Part2_2;
run; 

/*								   PART 3									*/
/* Importing Lab2_Course.xlsx */
proc import datafile = "/home/u59639046/sasuser.v94/Lab2_Course.xlsx"
DBMS = xlsx out = Lab2Course replace;
run;

/* New data set Part 3 inherits all data from Lab2Course*/
data Part3;
	set Lab2Course;
	
	/* Obtaining Weighted average: Each midterm 20%, Final 40%, Attendance and HW 10% */
	Weighted_ave = (Midterm1 * 0.20) + (Midterm2 * 0.20) + (Final * 0.40) + (Attendance * 0.10) + (Homework * 0.10);
run;

/* Printing new and modified data set Part3 */
proc print data = Part3;
run;

/* New data set Part 3_2 inherits all data from Part3*/
data Part3_2;
	set Part3;
	
	/* Assigning grades: A:[90, 100], B: [80, 90),C: [70, 80), D: [60, 70),F: <60 */
	
	IF Weighted_ave >= 90 THEN DO;
		grade = 'A';
		pass = 'pass';
	end;

	Else If Weighted_ave >= 80 then do;
		grade = 'B';
		pass = 'pass';
	END;  

	Else If Weighted_ave >= 70 then do;
		grade = 'C';
		pass = 'pass';
	END;
	
	Else If Weighted_ave >= 60 then do;
		grade = 'D';
		pass = 'pass';
	END;  

	Else If 0 =< Weighted_ave < 60 then do;
		grade = 'F';
		pass = 'fail';
	END; 

	ELSE DO;
		grade = ' ';
		pass = ' ';
	END; 	   
run;

/* Printing new and modified data set Part3_2 */
proc print data = Part3_2;
run;