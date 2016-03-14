int: N = 5;
var set of 1..N:t;
var set of 1..N:s;

constraint t intersect s={1,3,4};

solve satisfy;