set NODES;

param E{a in NODES, b in NODES};
param W{a in NODES, b in NODES};

var y{a in NODES, b in NODES}, binary;
var w{a in NODES, b in NODES};

minimize total_sum: sum{a in NODES, b in NODES} E[a,b] * W[a,b] * y[a,b];

s.t. ordering_exists{a in NODES, b in NODES: a <> b}: y[a,b] + y[b,a] = 1;
s.t. no_cycles{a in NODES, b in NODES, c in NODES: a <> b and b <> c and c <> a}: y[a,b] + y[b,c] + y[c,a] >= 1;

