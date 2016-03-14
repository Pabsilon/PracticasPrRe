include "alldifferent.mzn";

int: N = 10;
array [1..N] of var 1..N : t;
array [1..N-5] of var int: s;
var 0..N-4: M;

constraint alldifferent (t);

constraint forall (i in 1..N-5) (s[i]==t[(M+i)]);

solve satisfy;