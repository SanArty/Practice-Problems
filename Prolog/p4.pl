/*
	<p4.pl>
	author: <Ayrton Ledesma>
	course: <CS3363>, <Fall 2020>
	assignment <Program 6>
	due <11/14/2020>, <11:59pm>
	submitted: <11/14/2020>
*/

% Family relationship analysis in Prolog


% 1. parent(a, b), meaning a is a parent of b

% 2. If A is parent of B, then A is ancestor of B
ancestor(A, B) :- parent(A, B).

% 3. If B is an ancestor of C and A is a parent of B, A is an ancestor of C
ancestor(A, C) :- parent(A, B), ancestor(B, C).

% 4. If A is parent of B and A is parent of C, B and C are sibling
sibling(B, C) :- parent(A, B), parent(A, C).

% 5. If A is ancestor of B and an ancestor of C, 
%    B is not an ancestor of C, and C is not an ancestor of B,
%    and neither B nor C is a child of A, B and C are cousin
cousin(B, C) :- ancestor(A, B), ancestor(A, C), \+(ancestor(B, C)), \+(ancestor(C, B)), \+(parent(A, B)), \+(parent(A, C)).

% Family relationship Analysis
parent(grandma, dad).
parent(grandma, uncle).
parent(uncle, braiden).
parent(dad, me).
parent(dad, brother).
parent(mom, me).
parent(mom, brother).