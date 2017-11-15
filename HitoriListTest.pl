
runTests(X,L):-
nth0(0,L,E),
write('E1: '),write(E),nl,
containsDuplicates(E);
nth0(0,L,E),
write('E2: '),write(E),nl,
adjacentValue(E);
nth0(0,L,E),
write('E3: '),write(E),nl,
xSomethingX(E);
nth0(0,L,E),
write('E4: '),write(E),nl,
twoPlussMany(E);
nth0(0,L,E),
write('E5: '),write(E),nl,
twoPlussManyRev(E);
write('E6: '),write(E),nl.

checkBoard():-
Rows = [[1,3,3,5,5],[4,1,5,3,2],[2,1,1,3,3],[5,3,4,1,4],[3,3,4,5,4]],
Cols = [[1,4,2,5,3],[3,1,1,3,3],[3,5,1,4,4],[5,3,3,1,5],[5,2,3,4,4]],
runTests(0,Rows).

containsDuplicates([H|T]):-
write('containsDuplicates'),nl,
member(H,T);
containsDuplicates(T).

xSomethingX([X,Y,X|_]).
xSomethingX([X,Y,Z|[H|T]]):-
write('xSomethingX'),nl,
write(X),write(' '),write(Y),write(' '),write(Z),write(' '),write(H),write(' '),write(T), nl,
xSomethingX([Y,Z,H|T]).

adjacentValue([X,X|_]).
adjacentValue([X,Y|[H|T]]):-
write('adjacentValue'),nl,write('X: '),write(X),nl,write('Y: '),write(Y),nl,
adjacentValue([Y,H|T]).

twoPlussMany([X,Y|[H|T]]):-
write('twoPlussMany'),nl,
write(X),write(' '),write(Y),write(' '),write(H),write(' '),write(T), nl,
X=Y,
not(X=H),
list_to_set(T, S),
write(S), nl,
member(X,S);
twoPlussMany([Y,H|T]).

twoPlussManyRev(L):-
write('twoPlussManyRev'),nl,
reverse(L, N),
twoPlussMany(N).

