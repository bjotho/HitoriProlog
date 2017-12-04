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

getHead([H|_],R):-
    R=H.

getColor([H1,H2,H3],R):-
    R=H2.

containsDuplicates([]).
containsDuplicates([H|T]):-
    getHead(H,R),
    (member([R,'W',_],T),H=[_,'B',_];
    member([R,'B',_],T),H=[_,'W',_];
    not(member([R,_,_],T)),H=[_,'W',_]),
    containsDuplicates(T).

neighborBlack([],[],[]).
neighborBlack([H1,H2,H3],[X1,X2,X3],[Z1,Z2,Z3]):-
    H2='W',X2='B',Z2='W';
    H2='W',X2='W',Z2='B';
    H2='B',X2='W',Z2='B';
    H2='B',X2='W',Z2='W';
    H2='W',X2='W',Z2='W'.

setColors([],[],[]).
setColors([H1,H2,H3|T],[X1,X2,X3|Y],[Z1,Z2,Z3]):-
    (H2='B';H2='W'),
    (X2='B';X2='W'),
    (Z2='B';Z2='W').
    
getSquares([X,Y]).
getSquares([H1,H2,H3|T]):-
    setColors(H1,H2,H3),
    neighborBlack(H1,H2,H3),
    %containsDuplicates([H1,H2,H3|T]),
    getSquares([H2,H3|T]).
    /*getSquares([H2|T]),
    checkColor(H1,H2),
    getSquares([H2|T]).*/

runTests([]).
runTests([H|T]):-
    getSquares(H),
    %reverse(H,RevH),
    %getSquares(RevH),
    runTests(T).

rowN([H|_],1,H):-!.
rowN([_|T],I,X) :-
    I1 is I-1,
    rowN(T,I1,X).

columnN([],_,[]).
columnN([H|T], I, [R|X]):-
   rowN(H, I, R), 
columnN(T,I,X).

getAllColumns(Size,_,N,[]):-
	N>Size.
getAllColumns(Size,SquareList,N,[H|T]):-
	columnN(SquareList,N,H),
	N1 is N+1,
	getAllColumns(Size,SquareList,N1,T).

checkAll(List):-
    getAllColumns(7,List,1,Cols),
    (runTests(List);
    runTests(Cols)),
    getAllColumns(7,Cols,1,R),
    write(R).

run:-
    X=[[1,3,3,5,5],[4,1,5,3,2],[2,1,1,3,3],[5,3,4,1,4],[3,3,4,5,4]],
    Y=[[1,4,1,5,6,5,4],[6,6,3,5,4,1,4],[5,3,3,1,2,1,6],[6,7,6,7,1,2,5],[4,4,7,2,2,6,6],[1,6,2,7,5,4,3],[7,7,5,2,4,5,2]],
    parsingInput(Y,List,1),
    checkAll(List).
