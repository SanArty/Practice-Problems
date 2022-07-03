/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 9								*/
/*								   PART 1									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab9_class_info.xlsx"
DBMS = xlsx out = Lab9_Class_Info replace;
run;

proc import datafile = "/home/u59639046/sasuser.v94/Lab9_score_data_id_class.xlsx"
DBMS = xlsx out = Lab9_Score_Data replace;
run;

/* 1) One to One */
data Lab9OneToOne;
	set Lab9_Class_Info;
	set Lab9_Score_Data;
run;

/* 2) Concatenate */
data Lab9Concatenate;
	set Lab9_Class_Info Lab9_Score_Data;
run;

/* 3) Interleaving */
proc sort data = Lab9_Class_Info;
	by class;
run;

proc sort data = Lab9_Score_Data;
	by class;
run;

data Lab9Interleave;
	set Lab9_Class_Info Lab9_Score_Data;
	by class;
run;

/* 3) Match-Merge */
proc sort data = Lab9_Class_Info;
	by class;
run;

proc sort data = Lab9_Score_Data;
	by class;
run;

data Lab9_Merge_Match (drop = teacher);
	merge Lab9_Class_Info (in = A)
		  Lab9_Score_Data
		  (in = B rename=(score1 = Midterm1 score2=Midterm2 score3=Final));
	by class;
	if A = 1 and B = 1;
run;

/* Printing Statements */
proc print data = Lab9OneToOne;
	title "Lab 9.1: One To One";
run;

proc print data = Lab9Concatenate;
	title "Lab 9.2: Concatenate";
run;

proc print data = Lab9Interleave;
	title "Lab 9.3: Interleave";
run;

proc print data = Lab9_Merge_Match;
	title "Lab 9.4: Merge-Match";
run;
