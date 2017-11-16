tori([[[N1,A],[N2,B],[N3,C],[N4,D]],
        [[N5,E],[N6,F],[N7,G],[N8,H]],
        [[N9,I],[N10,J],[N11,K],[N12,L]],
        [[N13,M],[N14,N],[N15,O],[N16,P]]]):-
    
    pre(A,B,C,D), pre(E,F,G,H), pre(I,J,K,L), pre(M,N,O,P),
    pre(A,E,I,M), pre(B,F,J,N), pre(C,G,K,O), pre(D,H,L,P),
    
    check(A,B),check(B,C),check(C,D),
    check(E,F),check(F,G),check(G,H),
    check(I,J),check(J,K),check(K,L),
    check(M,N),check(N,O),check(O,P),
    check(A,E),check(E,I),check(I,M),
    check(B,F),check(F,J),check(J,N),
    check(C,G),check(G,K),check(K,O),
    check(D,H),check(H,L),check(L,P),

    R1 = [N1,N2,N3,N4],
    R2 = [N5,N6,N7,N8],
    R3 = [N9,N10,N11,N12],
    R4 = [N13,N14,N15,N16],
    C1 = [N1,N5,N9,N13],
    C2 = [N2,N6,N10,N14],
    C3 = [N3,N7,N11,N15],
    C4 = [N4,N8,N12,N16],
    dup(R1),dup(R2),dup(R3),dup(R4),
    dup(C1),dup(C2),dup(C3),dup(C4).

pre(A,B,C,D):-
    member('Black',[A,B,C,D]), member('White',[A,B,C,D]).

check(A,B):-
    not(A=B).

dup([H|T]):-
    member(H,T),
    dup(T).

:- X=[[[2,_],[2,_],[2,_],[4,_]],
      [[1,_],[4,_],[2,_],[3,_]],
      [[2,_],[3,_],[2,_],[1,_]],
      [[3,_],[4,_],[1,_],[2,_]]], hitori(X), writeln(X).
