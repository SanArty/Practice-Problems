/* Ayrton D. Ledesma  														*/
/* SASOnDemand																*/
/*								Assignment 8								*/
/*								   PART 1									*/

LIBNAME mydata "/home/u59639046";
proc transpose data = mydata.tall_missing 
				out = OneRecordPerStudent 
				/*Renaming columns to score1-score3 respectively and dropping _NAME_ */
				(rename = (col1 = score1 col2 = score2 col3 = score3)
				drop =_NAME_);
	by Student Class;
	var Score;
run;

/* Printing modified dataset */
proc print data = OneRecordPerStudent;
	title 'Assignment 08: One Record per Student';
run;