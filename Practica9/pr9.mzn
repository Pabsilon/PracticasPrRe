% fichero lstrings.mzn
%Pablo Mac-Veigh
%David Quesada
set of int:CHAR=1..4;

predicate substring(array [int] of var CHAR:a, var int:ini, array [int] of var CHAR:b) = 
(max(index_set(a)) <= (max(index_set(b))-ini+1)) /\ forall (i in index_set(a)) (a[i] == b[i+ini-1]);

predicate reverse(array [int] of var CHAR:a, array[int] of var CHAR:b) =
(max(index_set(a))==(max(index_set(b)))) /\ forall (i in index_set(a)) (a[i] = b[max (index_set(b)) -i+1]);

predicate count (array [int] of var CHAR:a, var int:copias, var CHAR: b) =
sum (i in  index_set(a) where a[i]==b)(1)=copias;

