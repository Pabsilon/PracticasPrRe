var -2..2:x;
var -2..2:y;
var -2..2:z;
var -2..2:m;
var int: a;
var int: b;
var int: u;

constraint ((x<y)/\(y<z)/\(m=z))\/((x<y)/\not(y<z)/\(m=y))\/(not(x<y)/\(y<z)/\(m=z))\/((not(x<y)/\not(y<z)/\(m=x)));

constraint ((a>0)/\(a=x)/\(b=y)/\(u=m)/\(z=100)) \/ (not(a>0)/\(a*a=x)/\(b=y)/\(z=y*y)/\(u=m+1));

solve satisfy;