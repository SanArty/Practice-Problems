/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 4								*/
/*								   PART 1									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab4_score_data_miss777.xlsx"
DBMS = xlsx out = lab4_scoredata0 replace;
run;

data lab4_scoredata1(drop = i);
	set lab4_Scoredata0;
	array score_var{3} score1-score3;
	do i = 1 to 3; 
		/* Substituting 777 for . */
		if score_var{i} = 777 then score_var{i} = .;
	end;
run;

proc means maxdec = 2 data = lab4_scoredata1;
	var score1 score2 score3;
run;

data lab4_scoredata2 (drop = i);
	set lab4_scoredata1;
	array score_var{3} score1-score3;
	array class_average{3} _TEMPORARY_(79.50, 81.90, 79.10);
	array difference{3};
	do i = 1 to 3;
		difference{i} = score_var{i} - class_average{i};
	end;
run;

proc print data = lab4_scoredata2;
	title "lab4_scoredata2";
run;

/*								   PART 2									*/
proc import datafile = "/home/u59639046/sasuser.v94/Lab2_Vehicles.xlsx"
DBMS = xlsx out = lab4_vehicles_monthly replace;
run;

data lab4_vehicles_quarterly (drop = i j);
	set lab4_vehicles_monthly;
	array months{4, 3} Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec;
	array Qtr{4};
	do i = 1 to 4;
		qtr{i} = 0;
		do j = 1 to 3;
			qtr{i}+months{i, j};
		end;
	end;
run;

proc print data = lab4_vehicles_quarterly (keep = Type qtr1-qtr4);
	title lab4_vehicles_quarterly;
run;

