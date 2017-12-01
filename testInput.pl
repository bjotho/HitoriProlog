mergeing([H|T], Color, [H,C|R]):-
    mergeing(T, Color, R).
mergeing([], Color, Color):- !.
mergeing(T, [], T).

settingColor([N1,A,N2,B,N3,C,N4,D,
		      N5,E,N6,F,N7,G,N8,H,
              N9,I,N10,J,N11,K,N12,L,
              N13,M,N14,N,N15,O,N16,P]):-
    
    pre(A,B,C,D), pre(E,F,G,H), pre(I,J,K,L), pre(M,N,O,P),
    pre(A,E,I,M), pre(B,F,J,N), pre(C,G,K,O), pre(D,H,L,P).

pre(A,B,C,D):-
    member('Black',[A,B,C,D]), member('White',[A,B,C,D]).


run:-
    X=[[1,1,1,1],[2,2,2,2],[3,3,3,3],[4,4,4,4]],
    flatten(X,Flat),
    mergeing(Flat,Color,M),
    settingColor(M),
    write(M).

