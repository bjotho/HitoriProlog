addingVariable([],C,[]).
addingVariable([H|T],C,[X|Y]):-
    X=[H,C],
    addingVariable(T,C,Y).

addingRow([],[]).
addingRow([H1,H2,H3,H4|T],[X|Y]):-
    X=[H1,H2,H3,H4],
    addingRow(T,Y).


settingColor([[N1,A],[N2,B],[N3,C],[N4,D],
		      [N5,E],[N6,F],[N7,G],[N8,H],
              [N9,I],[N10,J],[N11,K],[N12,L],
              [N13,M],[N14,N],[N15,O],[N16,P]]):-
    
    /*pre(A,B,C,D), pre(E,F,G,H), pre(I,J,K,L), pre(M,N,O,P),
    pre(A,E,I,M), pre(B,F,J,N), pre(C,G,K,O), pre(D,H,L,P).*/
    pre(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P).

pre(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P):-
    member('Black',[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]).
    %member('White',[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]).


run:-
    X=[[1,1,1,1],[2,2,2,2],[3,3,3,3],[4,4,4,4]],
    flatten(X,Flat),
    addingVariable(Flat,Color,L),
    addingRow(L,R),
    write(R).
