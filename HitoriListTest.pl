containsDuplicates([H|T]):-
member(H,T);
containsDuplicates(T).


xSomethingX([X,Y,X|_]).
xSomethingX([X,Y,Z|[H|T]]):-
write(X),write(' '),write(Y),write(' '),write(Z),write(' '),write(H),write(' '),write(T), nl,
xSomethingX([Y,X,H|T]).


adjacentValue([X,X|_]).
adjacentValue([X,Y|[H|T]]):-
adjacentValue([Y,H|T]).




twoPlussMany([X,Y|[H|T]]):-
write(X),write(' '),write(Y),write(' '),write(H),write(' '),write(T), nl,
X=Y,
member(X,T),  
not(X=H);
twoPlussMany([Y,H|T]).


reverse([],Z,Z).
reverse([H|T],Z,Acc):- 
reverse(T,Z,[H|Acc]).
