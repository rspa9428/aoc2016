cpy:{.:,/y,":",x;z+1};                                                  / copy
ad:{.:y,x,":1";z+1};                                                    / add function
add:{.:y,"+:",x;z+1};                                                   / custom add fun
fib:{.:y,":fb@",x;z+1}                                                  / apply fibonacci to.. 
fb:{:/{x,+/-2#x}/[x;1 1]}                                               / custom fibonacci
inc:ad"+";                                                              / increment
dec:ad"-";                                                              / decrement
jnz:{z+$[0=.:x;1;.:y]};                                                 / jump
mul:{[w;x;y;z].:w,":",x,"*",y;z+1}                                      / multiply
l:("dec";"inc")                                                         / mon. instructions
m:("cpy";"jnz")                                                         / dyad. instructions 
tgl:{r[oi]:{(,x@~x?y),1_z}[(l;m)3=#o;*o;o:r@oi:y+.:x];y+1};             / toggle
out:{k,:.:x;y+1};                                                       / append to clock k
f:{@[.:;r[x],x;x+1]};                                                   / run function
