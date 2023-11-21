grammar Tiny;

// prog = programa
// decl = Declaracao
// seq = Sequencia
// condDecl = Condicional
// repeatDecl
// atribDecl = Atribuicao
// readDecl, writeDecl
// expr = expression

prog: declSeq;

declSeq: declSeq';'
	| declSeq';' decl
	| decl
	;

decl: condDecl
	| repeatDecl
	| atribDecl
	| readDecl
	| writeDecl
	;

condDecl: 'if' expr 'then' declSeq 'end'
	| 'if' expr 'then' declSeq
		'else' declSeq 'end'
	;

repeatDecl: 'repeat' declSeq 'until' expr;

atribDecl: ID ':=' expr;

readDecl: 'read' ID;

writeDecl: 'write' expr;

expr: exprSimples Compare exprSimples
	| exprSimples
	;

exprSimples: exprSimples Soma termo
	| termo
	;

termo: termo Mult fator
	| fator
	;

fator: '(' expr ')'
	| NUM
	| ID
	;

Compare: ('<'|'=');
Soma: ('+'|'-');
Mult: ('*'|'/');

NUM : '0' | '-'?[1-9][0-9]*;
ID: [a-z][a-zA-Z0-9_]*;
WS : [ \t\n]+ -> skip;
COMMENT : '--' ~[\r\n]* -> skip;
