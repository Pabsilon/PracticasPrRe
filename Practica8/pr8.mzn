%Pablo Mac-Veigh
%David Quesada

include "alldifferent.mzn";
int: n = 15;
var int: suma = (n * (n*n + 1)) div 2;
array[1..n, 1..n] of var 1..n*n:cuadrado;

constraint forall (i in 1..n) (sum(j in 1..n)(cuadrado[i,j])=suma);
constraint forall (i in 1..n) (sum(j in 1..n)(cuadrado[j,i])=suma);

constraint alldifferent([cuadrado[i,j] | i,j in 1..n]);
%constraint forall (i in 1..n, j in 1..n) (alldifferent(cuadrado[i,j]));

solve :: int_search([cuadrado[i,j] | i,j in 1..n], first_fail, indomain_random, complete) satisfy;

output([show(cuadrado[j,i])++(if (j==n) then "\n" else "  " endif) | i in 1..n,j in 1..n]);
