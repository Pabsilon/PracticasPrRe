var int: x;
var int: y;

constraint x<10;
constraint y=x-5;
constraint x>5;
constraint x<2*y;

solve satisfy;

output(["x: ", show(x), " y: ", show(y)]);