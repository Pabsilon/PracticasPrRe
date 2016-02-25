var bool:a;
var bool:b;
var bool:c;
var bool:d;
var bool:e;
var bool:f;
var bool:g;
var bool:h;

constraint a!=b /\ b!=c /\ c!=d /\ d!=a;
constraint e!=f /\ f!=g /\ g!=h /\ h!=e;
constraint a!=e /\ b!=f /\ g!=c /\ d!=h;

solve satisfy;
