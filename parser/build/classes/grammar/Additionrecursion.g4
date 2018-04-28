grammar Additionrecursion;

program: (statement)+;

statement: println ';'
         | varDeclaration ';'
         | assignment ';'
         | branch
         ;

expression: lft= expression '/' rght=expression #Div
                | lft=expression '*' rght=expression #Mult
                | lft=expression '-' rght=expression #Minus
                | lft=expression '+' rght=expression #Plus
                | lft=expression operator = ('<'| '<=' | '>' |'>=') rght=expression #Relational
                | lft=expression '&&' rght=expression #And
                | lft=expression '||' rght=expression #Or
		| number=NUM #Number
                | varName=IDENTIFIER #Variable 
                ;

varDeclaration: 'int' varName=IDENTIFIER;

assignment: varName=IDENTIFIER '=' expr=expression;

println: 'println(' argument=expression ')' ;

branch: 'if' '(' condition= expression ')' onTrue=block 'else' onFalse=block ;

block: '{'statement* '}';

NUM: [0-9]+;

NEWLINE : [\r\n]+ ;

IDENTIFIER: [a-zA-Z][a-zA-Z0-9]*;

WHITESPACE: [ \t\n\r]+ -> skip;