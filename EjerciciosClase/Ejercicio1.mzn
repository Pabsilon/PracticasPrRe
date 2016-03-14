int: N = 3;
array [1..N] of int: t = [1,1,2];
var int: x;

constraint x = sum (i in 1..N) (t[i]==0);

solve satisfy;