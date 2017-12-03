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
    (H=[V,'W',_] -> X=V ; X='X'),
    extractRow(T,Y).

twoPlussMany([X,Y|[H|T]]):-
    write('twoPlussMany'),nl,
    write(X),write(' '),write(Y),write(' '),write(H),write(' '),write(T),nl,
    X=Y,
    not(X=H),
    list_to_set(T, S),
    write(S), nl,
    member(X,S),
    twoPlussMany([Y,H|T]).

twoPlussManyRev(L):-
    write('twoPlussManyRev'),nl,
    reverse(L,N),
    twoPlussMany(N).

containsDuplicates([H|T]):-
    member(H,T),
    containsDuplicates(T).

xSomethingX([X,Y,Z|[H|T]]):-
    (X=Z,Y=[_,'W']);
    xSomethingX([Y,Z,H|T]).
xSomethingX([X,Y,X]):-
    Y=[_,'W'].

checkTests([]).
checkTests([H|T]):-
    xSomethingX(H);
    checkTests(T).

settingColor([[N1,A],[N2,B],[N3,C],[N4,D],
		      [N5,E],[N6,F],[N7,G],[N8,H],
              [N9,I],[N10,J],[N11,K],[N12,L],
              [N13,M],[N14,N],[N15,O],[N16,P]]):-
    
    color(A,B,C,D).


color(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P):-
    member('B',[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]),
    member('W',[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]).


doSolve(SizeX,SizeY,Input,Output):-
    /*parsingInput takes in a list (Input), and binds SquareList to a list of squares. Final parameter is the starting index*/
    %parsingInput(Input,SquareList,1),
    %write(SquareList).

    /*formatOutput takes in a solved hitori puzzle list and generates output in the desired format*/
    ExampleSolved=[[[2,'B',1],[2,'W',2],[2,'B',3],[4,'W',4]],
                   [[1,'W',5],[4,'W',6],[2,'W',7],[3,'W',8]],
                   [[2,'W',9],[3,'W',10],[2,'B',11],[1,'W',12]],
                   [[3,'W',13],[4,'B',14],[1,'W',15],[2,'W',16]]],
    formatOutput(ExampleSolved,Output),
    print(Output).
    
    %addingRow(L,SquareList),
    %checkTests(SquareList),
    %write(SquareList).
    


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
