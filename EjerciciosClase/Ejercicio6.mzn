int: N = 10;
array[1..N] of int : a = [4,7,3,2,1,5,6,9,8,10];

array[1..N] of var int: b;

%ordenar a en b.

constraint forall (i in 1..N-1) (b[i]<b[(i+1)]);

constraint forall (i in 1..N) (exists (j  in 1..N)(a[i]=b[j]));

solve satisfy;