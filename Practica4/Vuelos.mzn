%%%%%%%%%%%%% Práctica 4 %%%%%%%%%%%%%%%%
%Pablo Mac-Veigh, 50766233N

int: n;
int: ini;
int: fin;
int: max;
var int: coste;
var int: posfin;

array [1..max] of var 0..n: trayecto;
array [1..n,1..n] of int: t;
array [1..max-1] of var int:costes;

%Ciudad inicial en primera posicion
constraint trayecto[1]=ini;
%Ciudad final en posicion 'posfin'
constraint trayecto[posfin]=fin;
%Despues de posfin todos los valores son '0'
constraint forall (i in 1..max)((i>posfin/\trayecto[i]=0)\/(i<=posfin /\ trayecto[i]!=0));
%Todos los valores tienen precio por lo que existen
constraint forall (i in 1..max-1)((i<posfin)/\(t[trayecto[i],trayecto[(i+1)]]>0)\/(i>=posfin));
%El array auxiliar costes coje los valores de los costes anteriores a posfin
constraint forall(i in 1..max-1)	((i<posfin /\ costes[i]=t[trayecto[i],trayecto[(i+1)]]) \/
                      				(i>=posfin)/\costes[i]=0);
%La suma de todos los precios
constraint coste = sum (i in 1..max-1) (costes[i]);


%%Solución para trayecto mas corto
%solve minimize posfin;

%%Solución para trayecto mas barato
solve minimize coste;