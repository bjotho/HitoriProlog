hitori([[[N1,A],[N2,B],[N3,C],[N4,D]],
		[[N5,E],[N6,F],[N7,G],[N8,H]],
        [[N9,I],[N10,J],[N11,K],[N12,L]],
        [[N13,M],[N14,N],[N15,O],[N16,P]]]):-
    
        pre(A,B,C,D), pre(E,F,G,H), pre(I,J,K,L), pre(M,N,O,P),
        pre(A,E,I,M), pre(B,F,J,N), pre(C,G,K,O), pre(D,H,L,P),

        check(N1,N2,A,B),check(N2,N3,B,C),check(N3,N4,C,D),
        check(N5,N6,E,F),check(N6,N7,F,G),check(N7,N8,G,H),
        check(N9,N10,I,J),check(N10,N11,J,K),check(N11,N12,K,L),
        check(N13,N14,M,N),check(N14,N15,N,O),check(N15,N16,O,P),
        check(N1,N5,A,E),check(N5,N9,E,I),check(N9,N13,I,M),
        check(N2,N6,B,F),check(N6,N10,F,J),check(N10,N14,J,N),
        check(N3,N7,C,G),check(N7,N11,G,K),check(N11,N15,K,O),
        check(N4,N8,D,H),check(N8,N12,H,L),check(N12,N16,L,P),
        R1 = [N1,N2,N3,N4],
        R2 = [N5,N6,N7,N8],
        R3 = [N9,N10,N11,N12],
        R4 = [N13,N14,N15,N16],
        C1 = [N1,N5,N9,N13],
        C2 = [N2,N6,N10,N14],
        C3 = [N3,N7,N11,N15],
        C4 = [N4,N8,N12,N16].
        /*dup(R1),dup(R2),dup(R3),dup(R4),
        dup(C1),dup(C2),dup(C3),dup(C4).*/

pre(A,B,C,D):-
    member('Black',[A,B,C,D]), member('White',[A,B,C,D]).

check(A,B,C,D):-
    A=B,C='Black',not(D='Black');%prøver å få til at 2 tall inntil hverandre ikke kan være black
    A=B,C='White',not(D='White');
    A=B,C='White',D='White';
    A=B,not(C=D);
    not(A=B),not(C=D);
    not(A=B),C=D.

/*dup([H|T]):-
    member(H,T),
    dup(T).*/

run:- X=[[[1,_],[1,_],[1,_],[4,_]],
         [[1,_],[4,_],[2,_],[3,_]],
         [[2,_],[3,_],[2,_],[1,_]],
         [[3,_],[4,_],[1,_],[2,_]]], hitori(X), writeln(X).
