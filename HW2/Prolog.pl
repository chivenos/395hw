:- initialization(main).

main :- 
    write('x + y veya çıkış için "exit." yazın:'), nl,
    read(Input),
    ( Input == exit -> halt;
      evaluate(Input, Result) -> write(Result), nl, main;
      write('Hata!'), nl, main
    ).

evaluate(A + B, Result) :- number(A), number(B), Result is A + B.
evaluate(A - B, Result) :- number(A), number(B), Result is A - B.
evaluate(A * B, Result) :- number(A), number(B), Result is A * B.
evaluate(A / B, Result) :- number(A), number(B), B =\= 0, Result is A / B.
evaluate(_ / 0, _) :- write('0'a bölünemez!'), nl, fail.
evaluate(_, _) :- write('Hata!'), nl, fail.
