%David Quesada
%Pablo Mac-Veigh

int: n=5;
float: lado=1.0;
var 1..n: num;
array [1..n,1..2] of 0.0..1000.0: a=[|1,1|2,1|3,1|4,1|5,1|];
array [1..n,1..3] of var 0.0..1000.0: c;

predicate enElCuadrado(var float:x0, var float:y0, var float:x1, var float:y1, var float:l) =
	x1 <= x0 /\ x0 <= (x1 + l) /\ y1 <= y0 /\ y0 <= (y1 + l);

constraint forall (i in 1..n where i <= num) (c[i,3] <= lado /\ c[i,3] >= 0);

constraint forall (i in 1..n) (exists (j in 1..n where j <= num)(enElCuadrado(a[i,1],a[i,2],c[j,1],c[j,2],c[j,3])));

predicate noSobrepuesto(var float:x0, var float:y0, var float:l0, var float:x1, var float:y1, var float:l1) =
	not (enElCuadrado(x1,y1,x0,y0,l0))
	/\ not (enElCuadrado(x1+l1,y1,x0,y0,l0))
	/\ not (enElCuadrado(x1,y1+l1,x0,y0,l0))
	/\ not (enElCuadrado(x1+l1,y1+l1,x0,y0,l0));

constraint forall (i in 1..n,j in 1..n where i <= num /\ j <= num /\ i != j) (noSobrepuesto(c[i,1],c[i,2],c[i,3],c[j,1],c[j,2],c[j,3]));

solve minimize num;
