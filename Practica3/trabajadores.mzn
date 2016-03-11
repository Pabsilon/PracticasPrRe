int:n=5;
int:d=7;
int:maxh=8;
int:tiempoProyecto=125;
var int: mindias;

array [1..n,1..d] of var 0..maxh: t;

array [1..n] of var 0..d*maxh: horasPersona;

array [1..d] of var 0..maxh*n: horasDia;

constraint forall (i in 1..n) (horasPersona[i]=sum([t[i,j]|j in 1..d]));

constraint forall (i in 1..d) (horasDia[i]=sum([ t[j,i] | j in 1..n ]));

constraint forall (i in 1..n) (exists (j in 1..d) (t[i,j]=0) );

constraint forall (i in 1..n) (horasPersona[i]>=maxh*(d-3));

constraint forall (i in 1..n) (not(exists (j in 1..d-1) ((t[i,j]=maxh)/\(t[i,(j+1)]=maxh))));

constraint sum([horasPersona[i]| i in 1..n ])>=tiempoProyecto;

solve satisfy;

%solve maximize sum([horasDia[i]|i in 1..d]);