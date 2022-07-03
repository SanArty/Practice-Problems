/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 11								*/
/*								   PART 1									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab11_Patients_Date.xlsx"
    DBMS = xlsx out= Lab11_Patients0 replace;
run;

data Lab11_Patients1;
	set Lab11_Patients0;
	
	/* Extracting the year of patients administered to hospital */
	Initial_Year = year(Start_date);
	
	/* Calculating the actual number of days that patients stayed in hospital */
	Days_in_Hospital = intck('day', Start_date, End_date);
	Actual_Number_Of_Days = datDIF(Start_date, End_date, 'ACT/365');
	
	/* Creating variable containing today’s date*/
	Today_Date = today();
run;
	
proc print data = Lab11_Patients1;
	format today_date date9.;
	title 'Lab 11: Part 1';
run;

/*								   PART 2									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab11_Student_Date.xlsx"
    DBMS = xlsx out= Lab11_Students0 replace;
run;

data Lab11_Students1;
	set Lab11_Students0;
	
	/* 2.1: Find the year, month and day of each student’s birthday using date functions */
	Year = year(DOB);
	Month = month(DOB);
	Day = day(DOB);
	
	/* 2.2: Find the weekday of the start date */
	Weekday_StartDate = weekday(Start_date);
	
	/* 2.3: Compute the year difference between birthday and start date using ‘30/360’ basis */
	Year_Difference = YRDIF(DOB, Start_date, '30/360');
	
	/* 2.4: Create a variable which contains the date 2015/12/31 and assign an appropriate format */
	fix_date = mdy(12, 31, 2015);
	
	/* 2.5: Compute the actual number of days which have pass since the start date until 2019/01/01 */
	Actual_Number_Of_Days_2019_01_01 = datDIF(Start_date, '1jan2019'd, 'ACT/365');
run;

proc print data = Lab11_Students1;
	format fix_date date9.;
	title 'Lab 11: Part 2';
run;

/*								   PART 3									*/
data Lab11_Students2;
	set Lab11_Students1;
	
	/* Create a new variable “age” and compute its value for each student (integers) */
	age = intck('year', DOB, today());
run;

proc print data = Lab11_Students2;
	format fix_date date9.;
	
	/* Only select observations which have start date not on weekends */
	where Weekday_StartDate <= 5;
	title 'Lab 11: Part 3';
run;

