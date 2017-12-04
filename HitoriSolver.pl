outputFile('./hitori_solved.txt').
inputFile('./hitori_unsolved.txt').

parsingInput([],[],_).
parsingInput([H|T],[X|Y],I):-
    addingSquares(H,X,I),
    length(H,Size),
    I1 is I+Size,
    parsingInput(T,Y,I1).

addingSquares([],[],_).
addingSquares([H|T],[X|Y],I):-
    X=[H,_,I],
    I1 is I+1,
    addingSquares(T,Y,I1).

formatOutput([],[]).
formatOutput([H|T],[X|Y]):-
    extractRow(H,X),
    formatOutput(T,Y).

extractRow([],[]).
extractRow([H|T],[X|Y]):-
    ((H=[V,'W',_],
    X=V);
    X='X'),
    extractRow(T,Y).

getHead([H|_],R):-
    R=H.

/*
twoPlusMany([X,Y|[H|T]]):-
    write('twoPlusMany'),nl,
    X=Y,
    not(X=H),
    list_to_set(T, S),
    write(S), nl,
    member(X,S),
    twoPlusMany([Y,H|T]).

twoPlusManyRev(L):-
    write('twoPlusManyRev'),nl,
    reverse(L,N),
    twoPlusMany(N).

containsDuplicates([H|T]):-
    member(H,T),
    containsDuplicates(T).
*/

xSomethingX([X,Y,Z|[H|T]],[X1,Y1,Z1|[H1|T1]]):-
    X1=X,
    getHead(X,S1),
    getHead(Z,S2),
    S1=S2,Y1=[_,'W',_],
    xSomethingX([Y,Z,H|T],[Y1,Z1,H1|T1]).
xSomethingX([X,_,X],[X1,Y1,X1]):-
    Y1=[_,'W',_].
xSomethingX([_,_,_],_).

checkTests([]).
checkTests([H|T],[X|Y]):-
    xSomethingX(H,X);
    checkTests(T,Y).


doSolve(SizeX,SizeY,Input,Output):-
    /*parsingInput takes in a list (Input), and binds SquareList to a list of squares. Final parameter is the starting index*/
    %parsingInput(Input,SquareList,1),

    ExampleUnsolved=[[[2,_,1],[2,_,2],[2,_,3],[4,_,4]],
                     [[1,_,5],[4,_,6],[2,_,7],[3,_,8]],
                     [[2,_,9],[3,_,10],[2,_,11],[1,_,12]],
                     [[3,_,13],[4,_,14],[1,_,15],[2,_,16]]],

    checkTests(ExampleUnsolved,PostTests),

    /*formatOutput takes in a solved hitori puzzle list and generates output in the desired format*/
    /*
    ExampleSolved=[[[2,'B',1],[2,'W',2],[2,'B',3],[4,'W',4]],
                   [[1,'W',5],[4,'W',6],[2,'W',7],[3,'W',8]],
                   [[2,'W',9],[3,'W',10],[2,'B',11],[1,'W',12]],
                   [[3,'W',13],[4,'B',14],[1,'W',15],[2,'W',16]]],
    */
    formatOutput(PostTests,Output).



/*doSolve(5,_,_,[[1,'X',3,'X',5],[4,1,5,3,2],[2,'X',1,'X',3],[5,3,'X',1,4],[3,'X',4,5,'X']]):-!.
doSolve(7,_,_,[['X',4,1,'X',6,5,'X'],[6,'X',3,5,'X',1,4],[5,3,'X',1,2,'X',6],['X',7,6,'X',1,2,5],[4,'X',7,2,'X',6,'X'],[1,6,2,7,5,4,3],[7,'X',5,'X',4,'X',2]]):-!.*/

%doSolve(_,_,Solution,Solution).

/********************* writing the result */
writeFullOutput(S, X, Y):- write(X), write('x'), write(Y), nl, writeOutput(S).

writeOutput([]).
writeOutput([E|R]):- writeLine(E), writeOutput(R).

writeLine([]):- nl.
writeLine([E|R]):- write(' '), write(E), writeLine(R).

/********************** reading the input */
readProblem(N,M,Problem):- readInt(N), readInt(M), M=N, length(Problem, M), readProblemLines(N,Problem).

readProblemLines(_,[]).
readProblemLines(N,[H|T]):- length(H,N), readLine(H), readProblemLines(N,T).

readLine([]).
readLine([E|R]):- readInt(E), readLine(R).

readInt(N):- get_code(M), handleCode(M,N).

handleCode(M,N):- is_number_code(M,N1), !, continueInt(N1,N).
handleCode(-1,_):- !, fail. /* EOF */
handleCode(_,N):- readInt(N).

continueInt(O,N):- get_code(M), is_number_code(M,M1), !, H is 10*O+M1, continueInt(H,N).
continueInt(N,N).

is_number_code(N, N1):- N>=48, N<58, N1 is N-48.

/*********************** global control: starting the algorithm and the reading */
run:- inputFile(IF), see(IF), outputFile(F), tell(F), readInt(N), write(N), nl, solveProblems(N), told, seen, !.
run:- told, seen. /* close the files */

solveProblems(0).
solveProblems(N):- N>0, readProblem(X, Y, I), doSolve(X, Y, I, S), writeFullOutput(S, X, Y), !, N1 is N-1, solveProblems(N1).

:- nl,nl,write(' try running "?- run."'), nl,nl,nl.

:- run.
