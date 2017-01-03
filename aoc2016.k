"Advent of code 2016 in k (k4)"

"Problem 1"
i:", "\:*0:`p1                                                                                                          / input (cred. arthur/atilla)
c:,/-:\|:\0 1                                                                                                           / coord moves
r:{(y_x),y#x}                                                                                                           / rotate, 3 or 1
x:*:'c r\1 3@"L"=*:'i                                                                                                   / which direction to turn each step
y:.:'1_'i                                                                                                               / how many steps
+/abs@+/x*y                                                                                                             / part 1
&/+/'abs@&:1<#:'=+\x@&y                                                                                                 / part 2 (credit: arthur's +\x@&y)

"Problem 2"
d:"UDRL"!(-1 0;1 0;0 1;0 -1)                                                                                            / dict of directions
i:0:`p2                                                                                                                 / input
1+/'3 1*/:1 2{x{2&0|y+x}/y}\d@i                                                                                         / part 1
m:5 5#"  1   234 56789 ABC   D"                                                                                         / matrix of chars (credit nick p for fixing my initial over complicated way)        
.[m]'2 0{x{(r;x)@^m . r:x+d y}/y}\i                                                                                     / part 2

"Problem 3"
+/+/[f]>2*|/f:+0'0:`p3                                                                                                  / part 1
+/+/[g]>2*|/g:+:,/0N 3#/:f                                                                                              / part 2

"Problem 4"
i:+{(,/-1_s;.:*|s:"-"\:*r;-1_*|r:"["\:x)}'0:`p4                                                                         / inputs
f:{5#>(k@<k:!d)#d:#:'=x}                                                                                                / find 5 most common letters in string
+/i[1]@&i[2]~'f'*i                                                                                                      / part 1
l:1500#.Q.a                                                                                                             / at least as long as max i 1, could use 50+|/i 1
i[1](l@i[1]+.Q.a?*i)?"northpoleobjectstorage"                                                                           / part 2

"Problem 5 (slow due to md5 hashing)"
i:*0:`p5                                                                                                                / input
l:{-15!i,x}':$:!30000000                                                                                                / precalc list of md5's, cores+peach
z:-3#'0x0\:'!16                                                                                                         / zeros
j:&l[;!3] in z                                                                                                          / indexes where they start with 5 zeros
r:+,/'$:l j                                                                                                             / the strings of those that start with 5 zeros
8#r 5                                                                                                                   / part 1
r[6]@r[5]?,/$:!8                                                                                                        / part 2

"Problem 6"
i:+0:`p6                                                                                                                / input
(*>#:'=:)'i                                                                                                             / part 1
(*<#:'=:)'i                                                                                                             / part 2

"Problem 7"
a:{x,|x}'l@&~(l:,/a,/:\:a)in 2#/:a:.Q.a                                                                                 / lists of abba acca ... 
c:{#:[b]&~:|/,/(b:d x)within/:0N 2#&x in"[]"}                                                                           / check if supports TLS
d:{,/ss[x]'a}
+/c'0:`p7                                                                                                               / part 1
a:,/.Q.a@{x,/:_[1+x;l],'x}'l:!26                                                                                        / list of aba etc.        
d:{x@<x:ss[x]'(y;3#1_y)}
f:{|/{{|/{&/y in'x}[x]'|:\0 1}@.q.mod[y bin x;2]}[;& x in "[]"]'?:d[x]'a}                                               / check if supports SSL
+/f'0:`p7                                                                                                               / part 2

"Problem 8"
m:6 50#0b                                                                                                               / matrix m
i:" "\:'0:`p8                                                                                                           / input
rec:{.[`m;|!:'.:'"x"\:x 1;:;1b]}
ix:{(,:;(::),)["x"=*a]@.*|:"="\:a:x 2}
rot:{.[`m;j;:;.q.rotate[-.:x 4;m . j:ix x]]}
{.:[3#*x]x}'i;                                                                                                          / run, modifying global m as we go
+//m                                                                                                                    / part 1
-1" 1"m;                                                                                                                / part 2

"Problem 9"
i:*0:`p9                                                                                                                / input
g:{m:.:'"x"\:(r:0 1 1_'(0,x?"()")_ x) 1;r[0],(*/[m]#.q.ssr/[m[0]#r 2;"()";"[]"]),m[0]_r 2}                              / iterate func, ssr "()" -> "[]"
#("("in)g/i                                                                                                             / part 1
h:{c:x 0;x:x 1;$[&/"()"in x;[k:*w:x?"()";                                                                               / (count;string) return count if no parenths, cut off leading chars before "(",
        m:*r:({.:'"x"\:1_x};1_)@'(w-k)_k_x;(c+k+m[1]**h/(0;m[0]#r 1);m[0]_r 1)];(c+#x;"")]}                             / get vals of "12x3"->12 3, list of chars to decompress, (tot. count incl. subcounts; leftover str)
*h/(0;i)                                                                                                                / part 2

"Problem 10"
f:+i:(" I   *I   SI";" ")0:`p10                                                                                         / inputs
bot:output:B:()!()                                                                                                      / initialize dicts
bi:@[i[;&~ip:^i 2];1;`$]                                                                                                / bot inputs
p:+:[(*i;"J"$i 1)]@&ip                                                                                                  / parameter inputs
B[*bi]:+bi@1+!4;                                                                                                        / add bot rules to B dict
c:{if[1<+/~:^r@:<r:?bot@x;s:B@x;@[;;,;].'q:+(s 0 2;s 1 3;2#r);c'q[;1]@&:{$[x=`output;~z in output y;2=#:?bot@y]}.'q]};  / check function, call itself if we've just given a bot 2 inputs
{bot[y],:x;c y}.'p;                                                                                                     / run through each input param
bot?61 17i                                                                                                              / part 1
**/output@!3                                                                                                            / part 2

"Problem 11"
n:4;                                                                                                                    / # of floors
i:.:'0:`p11                                                                                                             / inputs 1 and 2 (elevator floor 0;elementA microchip flr 2 and generator flr 1; ....)
ia: {~|/{(~(=). x@y)&x[y;0]in (x@t@&~(t:!w)in y)[;1]}[1_ x]':!w}                                                        / check if a given configuration is allowed
c:{x[0],x[0]*0N 2#1_x}                                                                                                  / covert to (level;element 1;element 2 ...)
m:{x+/:c':,/-1 1,/:\:l@&:l[;i]~\:#:[i:&~x[0]=1_,/x]#0b};                                                                / move possibilities
a:.q.asc;                                                                                                               / ascend
p:{s:?:sr@&ia':sr:?:,/m':x 1;s:?a@s[;0],'a':s[;1+!w];                                                                   / iterate func (BFS, with much pruning)
    $[e in s@:&:(~s in x 2)&{&/,/[x]within 0 3}':s;(1+*x;());(1+*x;s;?:x[2],s)]}                                        / (steps taken;current states; prev. states)
init:{is::(0;i;i:,:x);w::#1_x;                                                                                          / initialize (set globals l, w;end:e,init state:is)
    l::k@&(+/':k:-:[2*w]#'0b\:'!:"j"$2 xexp w*2)within 1 2;e::(n-1),w#,:2#n-1;}     
f:{init x;*{#x 1}p/is}                                                                                                  / run function, more cores help massively (uses peach)
f@*i                                                                                                                    / part 1
f@i 1                                                                                                                   / part 2

"Problem 12"
\l assembunny.k
r:" "\:'0:`p12                                                                                                          / NB, build a custom fibonacci func for lines 9-15 (as that's whats happening to a in that loop)
a:b:c:d:0                                                                                                               / idea to optimize from nick+rahul
(#:[r]>)f/0;a                                                                                                           / part 1, modify a globally
a:b:d:0;c:1
(#:[r]>)f/0;a                                                                                                           / part 2

"Problem 13"
c:t,/:\:t:!n:80                                                                                                         / coords of matrix
i:0@*0:`p13                                                                                                             / input
g:{(x*x+3+2*y)+y*y+1}                                                                                                   / func
d:,/-:\|:\0 1                                                                                                           / up/down/left/right
m:(n;0N)#~.q.mod[(+/0b\:i+g .)',/c;2]                                                                                   / matrix of 01b's, 1b=empty space
s:(0;();,1 1);e:31 39;                                                                                                  / start and end vals
f:{(1+*x;?x[1],r;r:?r@&(~r in x 1)&m ./:r:,/d+/:\:x 2)}                                                                 / iterate func
*{~e in:/x}f/s                                                                                                          / with pruning
#?*1_50 f/s                                                                                                             / count distinct places in 50 moves

"Problem 14 (slow due to md5 hashing)"
s:*0:`p14                                                                                                               / salt
t:3#'.Q.n,16#.Q.a                                                                                                       / triples
l:{,/$-15!s,$x}':!30000                                                                                                 / precalc a list of md5 hashes with salt
f:{w@*<i@w:&0<#:'i:ss[l x]'t}                                                                                           / index of first triple
g:{(1+*x;t@f 1+*x)}
h:{(*b;0<#:,/ss[;5#b 1]'l(*b:{""~x 1}g/(*x;""))+1+!:1000)}                                                              / check the next 1000 for a quintuple
* :/64{*:[{~x 1}h/x],0b}\(1;0b)                                                                                         / get first 64 such indexes
l:{2017{,/$-15!x}/s,$x}':!30000                                                                                         / part 2, redefine l, run last line again peach+cores
* :/64{*:[{~x 1}h/x],0b}\(1;0b)                            

"Problem 15"
i:"j"$("   I       F";" ")0:`p15                                                                                        / input
r:+{5000000#y+!x}.'+i                                                                                                   / positions of discs
f:{x?.q.mod[a-1+!#a;a:*y]}                                                                                              / look for configuration
f[r;i]                                                                                                                  / part 1
f[r,'5000000#!11;i,'11 0]                                                                                               / part 2, additional values, or flip flip ...

"Problem 16"
i:0:`p16
f:{{~.q.mod[#x;2]}{~1=+/'0N 2#x}/y#(y>#:){x,0b,|~x}/x}                                                                                                                 
f["B"$'*i]'272 35651584                                                                                                 / parts 1 and 2

"Problem 17"
i:*0:`p17                                                                                                               / input
c:(0 -1;0 1;-1 0;1 0)                                                                                                   / coord move
d:"UDLR"                                                                                                                / direction
m:4 4#1b                                                                                                                / matrix valid positions
r:*:'{,/{$[3 3~x 1;,x;+(x[0],/:d w u;r u:&m ./:r:x[1]+/:c w:&(4#,/$-15!*x)in"bcdef")]}'x}/,(i;0 0)                      / run over
#:[i]_r@*<#:'r                                                                                                          / part 1
-#:[i]-|/#:'r                                                                                                           / part 2

"Problem 18"
i:"^"=*0:`p18                                                                                                           / input
f:{+//~(y-1){~(:':x)=1_x,0b}\x}                                                                                         / simiplify to this, (nick psaris suggested final simplification)
f[i]'40 400000                                                                                                          / part 1 and 2  

"Problem 19"
i:0@*0:`p19                                                                                                             / input
**-2#{$[1=.q.mod[#x;2];1_;]x@2*!-_-.5*#x}\1+!i                                                                          / part 1 alternatively, from http://www.exploringbinary.com/powers-of-two-in-the-josephus-problem 
/                                                                                                                       / 1+2*i-2 xexp_.q.xlog[2;i]
i-3 xexp_.q.xlog[3;i]                                                                                                   / part 2 (credit: u/natemago and others from reddit), my original solution was too slow+ugly to post


"Problem 20"
x:+|\x@:<x:0''"-"\:'0:`p20                                                                                              / from nick psaris (his solution was so much nicer than mine had to put it here)
g:0|-1+x[0]- :':x 1                                                                                                     / gap
-1+x[0]@*:&:g>0                                                                                                         / p1
+/g                                                                                                                     / p2

"Problem 21"
x:{(*:'2#x;{$[x in .Q.a;::;.:]x}'*:'x@&1=#:'x)}'" "\:'0:`p21                                                            / inputs
i:"abcdefgh"
mp:{(c#a),x[b],(c:y 1)_a:(b#x),(1+b:*y)_x}                                                                              / move to position
rp:{@[x;|j;:;x@j:a+!1+y[1]-a:*y@:<y]}                                                                                   / rev pos
sp:{@[x;|y;:;x y]}                                                                                                      / swap pos
sl:{@[x;(&x=)'y;:;|y]}                                                                                                  / swap letter
r:{.q.rotate[y**z;x]}                                                                                                   / rotate
rl:r[;1]                                                                                                                / rotate left
rro:rr:r[;-1]                                                                                                           / rotate right (o=orig)
rb:rbo:{rro[x;1+i+3<i:x?y]}                                                                                             / rotate based on pos (o=orig)
{.(*y;x;y 1)}/[i;x]                                                                                                     / run over inputs
rb:{m@(rbo[;y]'m:rl[x]'!8)?x}                                                                                           / part 2, redefining: inverse rb
rr:rl                                                                                                                   / swap rr/rl
rl:rro
i:"fbgdceah"                                                                                                            / new input
{.(*y;x;|y 1)}/[i;|x]                                                                                                   / run backwards over inputs

"Problem 22"
i:+1_0:`p22                                                                                                             / input
k:(0'+i@)'30 37+\:!3                                                                                                    / extract vals
a:k 1;u:*k                                                                                                              / avail and used
(+/#:[a]>1+(a@<a)bin u@<u)-+/a>u                                                                                        / part 1
0N!"part 2: count by eye";                                                                                              / part 2

"Problem 23"
\l assembunny.k
r:ri:" "\:'0:`p23;
a:7;
(#:[r]>)f/0;a                                                                                                           / part 1
r:ri                                                                                                                    / reset r and a
a:12;                                                                
(#:[r]>)f/0;a                                                                                                           / part 2

"Problem 24"
st:,/(!#m),/:'&:'m:~"#"=i:0:`p24                                                                                        / st street map of all coords of input map m
n:{j,x@j:*<x}'i?\:/:l:8#.Q.n                                                                                            / coords of "0-7"
dj:0N*di:t!!:'t:1+!7                                                                                                    / global dict dj, how many steps from e.g 7 to each 0 1 2 3 ..
sm:(`u#st)!{c@&m ./:c:y+/:x}[,/-:\|:\0 1]':st                                                                           / street map of where each point can go
g:{dj[x 3;s@:&x[3]>s:n?a:?r@&~(r:,/sm x 2)in*x]:1+x 1;(a,*x;1+x 1;a;x 3)}                                               / iterate func (prev visited;count;new pos's;start pt)
{{x[3]>+/~^dj[x 3]}g/(();0;,n@x;x)}'!dj;                                                                                / find all distances b/w 2 points for each key di
p:(`u#+k,'|k:(&#:'di;,/di))!,/2#,:,/dj                                                                                  / map of distances b/w each 2 points
pp:0,'1+7{,/(>:'t=/:t:*x)@\:x:0,'1+x}/,!0                                                                               / all perms of paths, using arthur's prm from 2015 aoc (can also use shotgun if being lazy)
f:&/(+/p@1_{y,x}':)':                                                                                                   / min distance for set of travel paths 
f pp                                                                                                                    / part 1
f pp,'0                                                                                                                 / part 2, finish at 0

"Problem 25"
\l assembunny.k
r:" "\:'0:`p25;                                                                                                         / note, slight change in input, helps to speed up
i:(!0;0);                                                                                                               / init vals
m:100                                                                                                                   / max output string length to look for
:/(m>#*:){a::1+x 1;k::*i;{(k~ck#0 1)&m>ck:#k}f/0;(k;1+x 1)}/i                                                           / keep looking for output m#0 1
/                                                                                                                       / note: see www.reddit.com/r/adventofcode/comments/5k6yfu/2016_day_25_solutions/?st=ixgvda8q&sh=63c2eb51
/                                                                                                                       / for a discussion on simplifying the input to this problem, essentially the answer can be simplified to:
/                                                                                                                       / 2730-*/0'(" "\:'0:`p25).(1 2;1) 
