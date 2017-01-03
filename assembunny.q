cpy:{value raze y,":",x;z+1};                                                        / copy
ad:{value y,x,":1";z+1};                                                             / add function
add:{value y,"+:",x;z+1};                                                            / custom add fun
fib:{value y,":fb@",x;z+1}                                                           / apply fibonacci to.. 
fb:{last{x,sum -2#x}/[x;1 1]}                                                        / custom fibonacci
inc:ad"+";                                                                           / increment
dec:ad"-";                                                                           / decrement
jnz:{z+$[0=value x;1;value y]};                                                      / jump
mul:{[w;x;y;z]value w,":",x,"*",y;z+1}                                               / multiply
l:("dec";"inc")                                                                      / mon. instructions
m:("cpy";"jnz")                                                                      / dyad. instructions 
tgl:{r[oi]:{(enlist x not x?y),1 _ z}[(l;m)3=count o;o 0;o:r oi:y+value x];y+1};     / toggle
out:{k,:value x;y+1};                                                                / append to clock k
f:{@[value;r[x],x;x+1]};                                                             / run function
