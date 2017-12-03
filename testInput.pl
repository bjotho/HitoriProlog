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

addColor([]).
addColor([H|T]):-
    member('Black',H);
    member('White',H),
    addColor(T).

checkColor([],[],5).
checkColor([H1,H2,H3|T],[X1,X2,X3|Y],5):-
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
    member(H,T),
    checkRow([R|T]).
    
getSquares([X]).
getSquares([H1,H2|T]):-
    checkColor(H1,H2,5),
    %checkNumbers(H1,H2),
    getSquares([H2|T]).

getRow([]).
getRow([H|T]):-
    addColor(H),
    checkRow(H).
    %getRow(T).

checkAll(List):-
    getRow(List).

run:-
    X=[[1,3,3,5,5],[4,1,5,3,2],[2,1,1,3,3],[5,3,4,1,4],[3,3,4,5,4]],
    parsingInput(X,List,1),
    checkAll(List).
