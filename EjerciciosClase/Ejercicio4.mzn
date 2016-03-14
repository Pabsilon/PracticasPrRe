include "alldifferent.mzn";
int: N = 10;
int: M = 3;
var 1..N: x;
var 1..N: y;
var 1..N: z;

var int: aux1;

array [1..N] of var int : t;
array [1..M] of var int : s;

constraint (sum (i in 1..M) (s[i]))=N;

constraint forall (i in 1..M) (s[i]>=0);

constraint alldifferent ([x,y,z]);

constraint aux1 = s[2]+s[1];



constraint forall (i in 1..N) (	(i<=s[1]/\t[i]=x)
								\/(i>s[1]/\i<=aux1/\t[i]=y)
								\/(i>aux1/\t[i]=z));

solve satisfy;