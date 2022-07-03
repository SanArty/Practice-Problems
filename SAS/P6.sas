/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 6								*/
/*								   PART 1									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab5_Sales.xlsx"
DBMS = xlsx out = Lab6Sales replace;
run;

/* i)								   				     					*/
proc print data = Lab6Sales;
	var id state sale_m1 sale_m2 sale_m3;
	where state='ca' AND sale_m1 >= 600;
	title 'Part 1.1: Observations in California with “sale_m1” value at least 600';
run;

/* ii)								   				     			      	*/
proc print data = Lab6Sales;
	var id state sale_m1 sale_m2 sale_m3;
	where state='tx' AND sale_m3 >= 500;
	title 'Part 1.2: Observations in Texas with “sale_m3” value at least 500';
run;

/* iii)								   				     			      	*/
proc print data = Lab6Sales;
	var sale_m1 sale_m2 sale_m3;
	ID id state;
	title 'Part 1.3: Replacing the default "Obs" with variables "id" and "state"';
run;

/* iv)								   				     			      	*/
proc print data = Lab6Sales noobs;
	var state sale_m1;
	title 'Part 1.4: Reporting only columns “state” and “sale_m1” and suppressing the default “Obs”';
run;

/*								   PART 2									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab6_drugtest.xlsx"
DBMS = xlsx out = Lab6drugtest_0 replace;
run;

/* i)								   				     					*/
proc sort data = Lab6drugtest_0 out = Lab6drugtest_1;
by Drug descending Cholesterol;
run;

proc print data = Lab6drugtest_1;
	title 'Part 2.1: Sorting "drugtest" dataset by ascending order of “Drug” and descending order of "Cholesterol"';
run;

/* ii)								   				     			      	*/
proc sort data = Lab6drugtest_0 out = Lab6drugtest_2 nodupkey dupout = extraobs;
by descending Drug;
run;

proc print data = Lab6drugtest_2;
	title 'Part 2.2: Sorting the "drugtest" dataset by descending order of "Drug" without duplicate observations';
run;

proc print data = extraobs;
	title 'Part 2.2: Placing all the duplicates in a separate dataset';
run;

/*								   PART 3									*/
/* i)								   				     					*/
data Lab6SalesPart3;
	set Lab6Sales;
	TotalSales = sum(sale_m1, sale_m2, sale_m3);
	label TotalSales = 'Total Sales in Q1';
	
	if sale_m1 = '.' then DELETE;
	if sale_m2 = '.' then DELETE;
	if sale_m3 = '.' then DELETE;
run;

/* ii)								   				     			      	*/
proc sort data = Lab6SalesPart3 out = Lab6SalesPart3_1;
	by state;
run; 

/* iii)								   				     			      	*/
title "Part 3.3: Enhanced Reports - Total Sales";
proc print data = Lab6SalesPart3_1 label noobs sumlabel = "State Total in Q1" grandtotal_label = "Grand Total in Q1";
	var id state sale_m1 sale_m2 sale_m3 TotalSales;
	sum TotalSales;
	by state;
run;

/* iv)								   				     			      	*/
title "Part 3.4: Enhanced Reports - Customized layout";
proc print data = Lab6SalesPart3_1 label noobs sumlabel = "State Total in Q1" grandtotal_label = "Grand Total in Q1";
	var id state sale_m1 sale_m2 sale_m3 TotalSales;
	sum TotalSales;
	by state;
	id state;
	format sale_m1 sale_m2 sale_m3 TotalSales Dollar10.2;
run;