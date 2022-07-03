/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 7								*/
/*								   PART 1									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab4_score_data_miss777.xlsx"
DBMS = xlsx out = lab7_scoredata0 replace;
run;

data lab7_scoredata1(drop = i);
	set lab7_scoredata0;
	array score_var{3} score1-score3;
	do i = 1 to 3; 
		if score_var{i} = 777 then score_var{i} = .;
	end;
run;

/* Computing average score of the three score variables. */
data lab7_scoredata2;
	set lab7_scoredata1;
	AverageScore = mean(score1, score2, score3);
run;

/* Descriptive Statistics of all numeric variables */
proc means data = lab7_scoredata2 maxdec=2 n mean max min;
	var score1 score2 score3 AverageScore; 
	title 'Descriptive Statistics of All Numeric Variables';
run;

proc sort data=lab7_scoredata2 out=lab7_scoredata3;
    by gender;
run;

/* Descriptive Statistics of all numeric variables by each value of gender using BY */
proc means data = lab7_scoredata3 maxdec=2 n mean max min;
	by gender;
	var score1 score2 score3 AverageScore; 
	title 'Descriptive Statistics of All Numeric Variables Using BY';
run;

proc means data = lab7_scoredata2 maxdec=2 n mean max min;
	class gender;
	var score1 score2 score3 AverageScore; 
	title 'Descriptive Statistics of All Numeric Variables Using CLASS';
run;

/*								   PART 2									*/
proc freq data = lab7_scoredata1 nlevels order=freq;
	tables gender;
	title 'Frequency Table of the Gender Variable';
run;

/*								   PART 3									*/
PROC UNIVARIATE data = lab7_scoredata2 noprint;
	histogram score1;
	histogram score2;
	histogram score3;
	histogram AverageScore;
	title 'Histograms';
run;

/*								   PART 4									*/
proc contents data = lab7_scoredata2;
	title 'Contents';
run;
