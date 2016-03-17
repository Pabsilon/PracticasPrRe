int : M = 3; %monedas

array[1..M] of bool: tiradaIni = [true,false,true]; %True cara, false cruz
%menor número de movimientos para que sean iguales?

array[1..M] of var bool : tiradaFin;

array[1..M] of var bool : cambiados;

var int: Cambios;

constraint forall (i in 2..M) (tiradaFin[1]=tiradaFin[i]);

constraint (sum(i in 1..M) (tiradaIni[i]!=tiradaFin[i]))=Cambios;

constraint forall (i in 1..M) ((cambiados[i]=true/\tiradaIni[i]!=tiradaFin[i])\/(cambiados[i]=false/\tiradaIni[i]=tiradaFin[i]));

solve minimize Cambios;
