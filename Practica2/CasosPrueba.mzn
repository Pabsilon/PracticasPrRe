var -2..2:x;
var -2..2:y;
var -2..2:z;
var -2..2:m;

constraint ((x<y)/\(y<z)/\(m=z))\/((x<y)/\not(y<z)/\(m=y))\/(not(x<y)/\(y<z)/\(m=z))\/((not(x<y)/\not(y<z)/\(m=x)));

solve satisfy;