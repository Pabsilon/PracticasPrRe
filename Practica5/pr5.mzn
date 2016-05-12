%Pablo Mac-Veigh
%David Quesada
int: n;
int: m;
int: nb;
int: mb;

array[1..n, 1..nb] of int: f;
array[1..m, 1..mb] of int: c;
array[1..n, 1..m] of var bool: res;
array[1..n] of var 0..n: bloquesFila;
array[1..m] of var 0..m: bloquesCol;
array[1..n] of var 0..2: espaciosFila;
array[1..m] of var 0..2: espaciosCol;


constraint forall(i in 1..n) (bloquesFila[i] = sum(j in 1..nb)(f[i,j]));
constraint forall(i in 1..n) (bloquesCol[i] = sum(j in 1..mb)(c[i,j]));
constraint forall(i in 1..n) (sum(j in 1..m where res[i,j] == true)(1) == bloquesFila[i]);
constraint forall(i in 1..m) (sum(j in 1..n where res[j,i] == true)(1) == bloquesCol[i]);
constraint forall(i in 1..n) (espaciosFila[i] = (sum(j in 1..mb where f[i,j] != 0)(1)) -1);
constraint forall(i in 1..m) (espaciosCol[i] = (sum(j in 1..nb where c[i,j] != 0)(1)) -1);

constraint forall (i in 1..n ) (sum(j in 1..n-1, k in 2..n) (res[i,j]==true /\ res[i,k]==false /\ k==j+1)=espaciosFila[i]);
constraint forall (i in 1..m ) (sum(j in 1..m-1, k in 2..m) (res[j,i]==true /\ res[k,i]==false /\ k==j+1)=espaciosCol[i]);


solve satisfy;

