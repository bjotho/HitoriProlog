addingVariable([],[]).
addingVariable([H|T],[X|Y]):-
    X=[H,_],
    addingVariable(T,Y).

addingRow([],[]).
addingRow([H1,H2,H3,H4,H5|T],[X|Y]):-
    X=[H1,H2,H3,H4,H5],
    addingRow(T,Y).


settingColor([[[N1,C1],[N2,C2],[N3,C3],[N4,C4],[N5,C5]],
		      [[N6,C6],[N7,C7],[N8,C8],[N9,C9],[N10,C10]],
              [[N11,C11],[N12,C12],[N13,C13],[N14,C14],[N15,C15]],
              [[N16,C16],[N17,C17],[N18,C18],[N19,C19],[N20,C20]],
              [[N21,C21],[N22,C22],[N23,C23],[N24,C24],[N25,C25]]]):-
    
    color(C1,C2,C3,C4,C5),
    color(C6,C7,C8,C9,C10),
    color(C11,C12,C13,C14,C15),
    color(C16,C17,C18,C19,C20),
    color(C21,C22,C23,C24,C25),
    color(C1,C6,C11,C16,C21),
    color(C2,C7,C12,C17,C22),
    color(C3,C8,C13,C18,C23),
    color(C4,C9,C14,C19,C24),
    color(C5,C10,C15,C25,C25).

getSquares([]).
getSquares([H1,H2|T1,T2]):-
    write('2squares:'),write(H1),write(H2),nl,
    getSquares([T1|T2]).

getRow([]).
getRow([H|T]):-
    getSquares(H),
    getRow(T).

    /*checkBoard(N1,N2,C1,C2),
    checkBoard(N2,N3,C2,C3),
    checkBoard(N3,N4,C3,C4),
    checkBoard(N4,N5,C4,C5),

    checkBoard(N6,N7,C6,C7),
    checkBoard(N7,N8,C7,C8),
    checkBoard(N8,N9,C8,C9),
    checkBoard(N9,N10,C9,C10),
    
    checkBoard(N11,N12,C11,C12),
    checkBoard(N12,N13,C12,C13),
    checkBoard(N13,N14,C13,C14),
    checkBoard(N14,N15,C14,C15),
    
    checkBoard(N16,N17,C16,C17),
    checkBoard(N17,N18,C17,C18),
    checkBoard(N18,N19,C18,C19),
    checkBoard(N19,N20,C19,C20),
    
    checkBoard(N21,N22,C21,C22),
    checkBoard(N22,N23,C22,C23),
    checkBoard(N23,N24,C23,C24),
    checkBoard(N24,N25,C24,C25).*/

color(A,B,C,D,E):-
    member('Black',[A,B,C,D,E]),
    member('White',[A,B,C,D,E]).

checkBoard(A,B,C,D):-
    A=B,C='Black',not(D='Black');%prøver å få til at 2 tall inntil hverandre ikke kan være black
    A=B,C='White',not(D='White');
    A=B,C='White',D='White';
    A=B,not(C=D);
    not(A=B),not(C=D);
    not(A=B),C=D.

run:-
    X=[[1,3,3,5,5],[4,1,5,3,2],[2,1,1,3,3],[5,3,4,1,4],[3,3,4,5,4]],
    flatten(X,Flat),
    addingVariable(Flat,L),
    addingRow(L,R),
    settingColor(R),
    getRow(R).
