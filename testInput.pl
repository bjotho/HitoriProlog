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



addColor([]).
addColor([H|T]):-
    member('Black',H);
    member('White',H),
    addColor(T).

checkColor([],[]).
checkColor([H1,H2,H3|T],[X1,X2,X3|Y]):-
    /*Check rows*/
    H1=X1,
    (H2='Black',X2='White';
    H2='White',X2='Black';
    H2='White',H2=X2);
    not(H1=X1),
    (H2='Black',X2='White';
    H2='White',X2='Black';
    H2='White',H2=X2).
    /*Check columns*/

checkRow([]).
checkRow([[H|R]|T]):-
    member(H,T);
    checkRow([R|T]).
    
getSquares([X]).
getSquares([H1,H2|T]):-
    checkColor(H1,H2),
    getSquares([H2|T]).

getRow([]).
getRow([H|T]):-
    addColor(H),
    write(List),
    getSquares(H),
    getRow(T).

rowN([H|_],1,H):-!.
rowN([_|T],I,X) :-
    I1 is I-1,
    rowN(T,I1,X).

columnN([],[],[]).
columnN([H|T], I, [R|X]):-
   rowN(H, I, R), 
columnN(T,I,X).

checkBoard([],5,Result).
checkBoard(List,5,Result):-
    rowN(List,5,R),
    checkColor(R,RColor),
    columnN(List,5,C),
    checkColor(C,Ccolor),
    N1=N-1,
    checkBoard(List,N1,Result).

checkAll(List):-
    write(List),
    checkBoard(List,5,R),
    write(R).
    %getRow(List).

run:-
    X=[[1,3,3,5,5],[4,1,5,3,2],[2,1,1,3,3],[5,3,4,1,4],[3,3,4,5,4]],
    parsingInput(X,List,1),
    checkAll(List).
