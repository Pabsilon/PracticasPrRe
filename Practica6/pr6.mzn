%Pablo Mac-Veigh
%David Quesada

% num asignaturas
int:n=5;
% 1-> ge , 2->fp, 3->fc, 4-> mdl, 5->mmi
% num dias con clase
int:dias=5;
% num horas/dia
int:horas=4;
% bloques de 1 hora semanal, bloques de 2 horas semanales
array [1..n,1..2] of 0..n:bloques = [|0,2 | 2,1 | 2,1 | 4,0 | 4,0 |];
% esto es lo que queremos averiguar
array [1..dias,1..horas] of var 1..n:horario;

array [1..n] of var 1..4: horasPorAsignatura;
constraint forall (i in 1..n) (horasPorAsignatura[i]=bloques[i,1]+bloques[i,2]*2);

constraint forall (asig in 1..n) (sum(i in 1..dias, j in 1..horas)(horario[i,j]=asig)=horasPorAsignatura[asig]);
constraint forall (asig in 1..n) ((sum(i in 1..dias, j in 1..horas) (horario[i,j]=asig /\ horario[i,j+1]=asig /\ horario[i,j+2] != asig))==bloques[asig,2]);
constraint forall (asig in 1..n) ((sum(i in 1..dias, j in 1..horas) (horario[i,j]=asig /\ 
								     ((horario[i,j-1]!= asig /\ horario[i,j+1] != asig)
								     \/ (j == 1 /\ horario[i,j+1] != asig)
								     \/ (j == horas /\ horario[i,j-1] != asig)))= bloques[asig,1]));
%%constraint forall (i in 1..dias, j in 1..horas-1 where bloques[i,j] == bloques[i,j+1]) (bloques[i,j+1] != bloques[] /\ bloques[i, j-1] != asig)

solve satisfy;

output([show(horario[j,i])++(if (j==dias) then "\n" else "  " endif) | i in 1..horas,j in 1..dias]);	

