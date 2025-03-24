To run the code run those commands by order:
flex calculator.l
yacc -d calculator.y
gcc y.tab.c lex.yy.c -o calculator
./calculator


My code's logic prioritizes parentheses and exponents, paying attention to the order of operations.
