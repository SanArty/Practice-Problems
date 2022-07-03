/*
	<p4.pl>
	author: <Ayrton Ledesma>
	course: <CS3363>, <Fall 2020>
	assignment <Program 6>
	due <11/14/2020>, <11:59pm>
	submitted: <11/14/2020>
*/

% A is ancestor of C if A is parent of B and B is ancestor of C
ancestor(A, C) :- parent(A, B), ancestor(B, C).

% A is ancestor of B if A is parent of B
ancestor(A, B) :- parent(A, B).

% B and C are sibilings if A is their parent
sibilings(B, C) :- parent(A, B), parent(A, C).

% B and C are cousing if A is ancestor of B and C, B is not ancestor of C and C is not ancestor of B, A is not B's or C's parent
cousins(B, C) :- ancestor(A, B), ancestor(A, C), \+(ancestor(B, C)), \+(ancestor(C, B)), \+(parent(A, B)), \+(parent(A, C)).

%TEST CASES
parent(a, b).
parent(a, c).
parent(b, d).
parent(b, e).
parent(c, f).
parent(a, g).
parent(g, h).
