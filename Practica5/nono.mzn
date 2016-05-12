int:n;
int:m;
int:nb;
int:mb;

array[1..n, 1..nb] of int:f;
array[1..m, 1..mb] of int:c;
array[1..n, 1..m] of var bool: res;
array[1..n] of var int: bloquesFila;
array[1..m] of var int: bloquesColumna;

constraint forall(i in 1..n) (bloquesFila[i] = sum(j in 1..nb)(f[i,j]));
constraint forall(i in 1..n) (bloquesColumna[i] = sum(j in 1..nb)(c[i,j]));




solve satisfy;

