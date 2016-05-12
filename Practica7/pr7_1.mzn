%Pablo Mac-Veigh
%David Quesada

% r es a AND b
predicate and(var 0..1:a, var 0..1: b, var 0..1: r) = (a+b=2/\r=1)\/(a+b!=2/\r=0);
% r es a OR b
predicate or(var 0..1:a, var 0..1: b, var 0..1: r) = (a+b>=1/\r=1)\/(a+b=0/\r=0);
% r es la negación de a
predicate neg(var 0..1:a, var 0..1: r) = (a=1/\r=0)\/(a=0/\r=1);
% r es 0
predicate cero(var 0..1: r) = (r=0);
% r es 1
predicate uno(var 0..1: r) = (r=1);
% r es a
predicate cable(var 0..1:a, var 0..1: r) = (r = a);
% construir nor a partir de las anteriores
predicate nor(var 0..1:a, var 0..1: b, var 0..1: r) = neg (or(a,b,r),cable(r,r));
% construir nand a partir de las anteriores
predicate nand(var 0..1:a, var 0..1: b, var 0..1: r) = neg (and(a,b,r),cable(r,r));

var 0..1: a;
var 0..1: b;
var 0..1: c;
var 0..1: d;
var 0..1: y;

var 0..1: s1;
var 0..1: s2;
var 0..1: s3;

constraint and(a,b,s1);
constraint and(c,d,s2);
constraint or(s1,s2,s3);
constraint neg(s3,y);


solve satisfy;
