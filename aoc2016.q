"Advent of code 2016 in q"

"Problem 1"
i:", "vs first read0`p1                                                                                                         / input (cred. arthur/atilla)
c:(0 1;1 0;0 -1;-1 0)                                                                                                           / coord moves
r:{(y _ x),y#x}                                                                                                                 / rotate, 3 or 1
x:first each c r\1 3@"L"=first each i                                                                                           / which direction to turn each step
y:value each 1_'i                                                                                                               / how many steps
sum abs sum x*y                                                                                                                 / part 1
min sum each abs where 1<count each group sums x where y                                                                        / part 2 (credit: arthur's +\x@&y)

"Problem 2"
d:"UDRL"!(-1 0;1 0;0 1;0 -1)                                                                                                    / dict of directions
i:read0`p2                                                                                                                      / input
1+/'3 1*/:1 2{x{2&0|y+x}/y}\d@i                                                                                                 / part 1
m:5 5#"  1   234 56789 ABC   D"                                                                                                 / matrix of chars (credit nick p for fixing my initial over complicated way)
.[m]each 2 0{x{(r;x)@null m . r:x+d y}/y}\i                                                                                     / part 2

"Problem 3"
sum sum[f]>2*max f:flip 0 each read0`p3                                                                                         / part 1
sum sum[g]>2*max g:flip raze 0N 3#/:f                                                                                           / part 2

"Problem 4"
i:flip{(raze -1 _ s;value last s:"-"vs first r;-1 _ last r:"[" vs x)}each read0 `p4                                             / inputs
f:{5#idesc(k@iasc k:key d)#d:count each group x}                                                                                / find 5 most common letters in string
sum i[1]@where i[2]~'f each first i                                                                                             / part 1
l:1500#.Q.a                                                                                                                     / at least as long as max i 1, could use 50+|/i 1
i[1](l@i[1]+.Q.a?first i)?"northpoleobjectstorage"                                                                              / part 2

"Problem 5 (slow due to md5 hashing)"
i:first read0`p5                                                                                                                / input
l:{md5 i,x}peach string til 30000000                                                                                            / precalc list of md5's, cores+peach
z:-3#'0x0 vs'til 16                                                                                                             / zeros
j:where l[;til 3] in z                                                                                                          / indexes where they start with 5 zeros
r:flip raze each string l j                                                                                                     / those
8#r 5                                                                                                                           / part 1
r[6]@r[5]?raze string til 8                                                                                                     / part 2

"Problem 6"
i:flip read0`p6                                                                                                                 / input
(first idesc count each group@)each i                                                                                           / part 1
(first iasc count each group@)each i                                                                                            / part 2

"Problem 7"
a:{x,reverse x}each l where not (l:raze a,/:\:a)in 2#/:a:.Q.a                                                                   / lists of abba acca ... 
c:{count[b]and not max raze(b:d x)within/:0N 2#where x in"[]"}                                                                  / check if supports TLS
d:{raze ss[x]each a}
sum c each read0`p7                                                                                                             / part 1
a:raze .Q.a@{x,/:_[1+x;l],'x}each l:til 26                                                                                      / list of aba etc.        
d:{asc ss[x]each(y;3#1 _ y)}
f:{max{{max{min y in'x}[x]each (0 1;1 0)}@ mod[y bin x;2]}[;where x in "[]"]each distinct d[x] each a}                          / check if supports SSL
sum f peach read0 `p7                                                                                                           / part 2

"Problem 8"
m:6 50#0b                                                                                                                       / matrix m
i:" "vs 'read0`p8                                                                                                               / input
rec:{.[`m;reverse til each value each "x"vs x 1;:;1b]}
ix:{(enlist;(::),)["x"=first a]@ value first reverse "="vs a:x 2}
rot:{.[`m;j;:;rotate[neg value x 4;m . j:ix x]]}
{value[3#first x]x}each i;                                                                                                      / run, modifying global m as we go
sum sum m                                                                                                                       / part 1
show " 1"@m                                                                                                                     / part 2

"Problem 9"
i:first read0`p9                                                                                                                / input
g:{m:value each "x"vs (r:0 1 1 _ '(0,x?"()") _ x) 1;                                                                            / iterate func, ssr "()" -> "[]"
        r[0],(prd[m]#ssr/[m[0]#r 2;"()";"[]"]),m[0]_r 2}
count ("("in)g/i                                                                                                                / part 1
h:{c:x 0;x:x 1;$[min"()"in x;                                                                                                   / (count;string) return count if no parenths, cut off leading chars before "(",
    [k:first w:x?"()"; m:first r:({value each "x"vs 1 _ x};1 _)@'(w-k) _ k _ x;                                                 / get vals of "12x3"->12 3, list of chars to decompress, (tot. count incl. subcounts; leftover str)
    (c+k+m[1]*first h/[(0;m[0]#r 1)];m[0] _ r 1)];(c+count x;"")]}                                                                
first h/[(0;i)]                                                                                                                 / part 2

"Problem 10"
f:flip i:(" I   *I   SI";" ")0:`p10                                                                                             / inputs
bot:output:B:()!()                                                                                                              / initialize dicts
bi:@[i[;where not ip:null i 2];1;`$]                                                                                            / bot inputs
p:flip[(i 0;"J"$i 1)]@where ip                                                                                                  / parameter inputs
B[bi 0]:flip bi@1+til 4;                                                                                                        / add bot rules to B dict
c:{if[1<sum not null r@:iasc r:distinct bot@x;s:B@x;
        @[;;,;].'q:flip (s 0 2;s 1 3;2#r);c each q[;1]@where{$[x=`output;not z in output y;2=count distinct bot@y]}.'q]};       / check function, call itself if we've just given a bot 2 inputs
{bot[y],:x;c y}.'p;                                                                                                             / run through each input param
bot?61 17i                                                                                                                      / part 1
first prd output@til 3                                                                                                          / part 2

"Problem 11"
n:4;                                                                                                                            / # of floors
i:value each read0`p11                                                                                                          / inputs 1 and 2 (elevator floor 0;elementA microchip flr 2 and generator flr 1; ....)
ia: {not max{(not(=). x@y)&x[y;0]in (x@t@where not(t:til w)in y)[;1]}[1 _ x]peach til w}                                        / check if a given configuration is allowed
c:{x[0],x[0]*0N 2#1 _ x}                                                                                                        / covert to (level;element 1;element 2 ...)
m:{x+/:c peach raze -1 1,/:\:l where l[;i]~\:count[i:where not x[0]=1 _ raze x]#0b};                                            / move possibilities
p:{s:distinct sr where ia peach sr:distinct raze m peach x 1;
        s:distinct asc s[;0],'asc peach s[;1+til w];                                                                            / iterate func (BFS, with much pruning)
            $[e in s@:where(not s in x 2)&{min raze[x]within 0 3}peach s;
        (1+x 0;());(1+x 0;s;distinct x[2],s)]}                                                                                  / (steps taken;current states; prev. states)
init:{is::(0;i;i:enlist x);w::count 1 _ x;                                                                                      / initialize (set globals l, w;end:e,init state:is)
            l::k where (sum peach k:neg[2*w]#'0b vs'til "j"$2 xexp w*2)within 1 2;
            e::(n-1),w#enlist 2#n-1;}
f:{init x;first {count x 1}p/is}                                                                                                / run function, more cores help massively (uses peach)
f first i                                                                                                                       / part 1
f i 1                                                                                                                           / part 2                                                                                                                        / part 2

"Problem 12"
\l assembunny.q
r:" "vs'read0`p12                                                                                                               / NB, build a custom fibonacci func for lines 9-15 (as that's whats happening to a in the loop)
a:b:c:d:0                                                                                                                       / idea to optimize from nick+rahul
(count[r]>)f/0;a                                                                                                                / part 1, modify a globally
a:b:d:0;c:1
(count[r]>)f/0;a                                                                                                                / part 2

"Problem 13"
c:t,/:\:t:til n:80                                                                                                              / coords of matrix
i:value first read0 `p13                                                                                                        / input
g:{(x*x+3+2*y)+y*y+1}                                                                                                           / func
d:(0 1;1 0;0 -1;-1 0)                                                                                                           / up/down/left/right
m:(n;0N)# not mod[(sum 0b vs i+g .)each raze c;2]                                                                               / matrix of 01b's, 1b=empty space
s:(0;();enlist 1 1);e:31 39;                                                                                                    / start and end vals
f:{(1+first x;distinct x[1],r;r:distinct r where(not r in x 1)&m ./:r:raze d+/:\:x 2)}                                          / iterate func
first {not e in last x}f/s                                                                                                      / with pruning
count distinct first 1 _ 50 f/s                                                                                                 / count distinct places in 50 moves

"Problem 14 (slow due to md5 hashing)"
s:first read0 `p14                                                                                                              / salt
t:3#'.Q.n,16#.Q.a                                                                                                               / triples
l:{raze string md5 s,string x}peach til 30000                                                                                   / precalc a list of md5 hashes with salt (cores help)
f:{w first iasc i w:where 0<count each i:ss[l x]each t}                                                                         / index of first triple
g:{(1+first x;t@ f 1+first x)}
h:{(first b;0<count raze ss[;5#b 1]each l(first b:{""~x 1}g/(first x;""))+1+til 1000)}                                          / check the next 1000 for a quintuple
first last 64{first[{not x 1}h/x],0b}\(1;0b)                                                                                    / get first 64 such indexes
l:{2017{raze string md5 x}/s,string x}peach til 30000                                                                           / part 2, redefine l, run last line again peach+cores
first last 64{first[{not x 1}h/x],0b}\(1;0b)                            

"Problem 15"
i:"j"$("   I       F";" ")0:`p15                                                                                                / input
r:flip {5000000#y+til x}.'flip i                                                                                                / positions of discs
f:{x?mod[a-1+til count a;a:first y]}                                                                                            / look for configuration
f[r;i]                                                                                                                          / part 1
f[r,'5000000#til 11;i,'11 0]                                                                                                    / part 2, additional values, or flip flip ...

"Problem 16"
i:read0`p16
f:{{not mod[count x;2]}{not 1=sum each 0N 2#x}/y#(y>count@){x,0b,reverse not x}/x} 
f["B"$'first i]each 272 35651584                                                                                                / parts 1 and 2

"Problem 17"
i:first read0 `:p17                                                                                                             / input
c:(0 -1;0 1;-1 0;1 0)                                                                                                           / coord move
d:"UDLR"                                                                                                                        / direction
m:4 4#1b                                                                                                                        / matrix valid positions
r:first each {raze{$[3 3~x 1;enlist x;flip (x[0],/:d w u;
        r u:where m ./:r:x[1]+/:c w:where (4#raze string md5 first x)in"bcdef")]}each x}/[enlist(i;0 0)]                        / run over
count[i] _ r first iasc count each r                                                                                            / part 1
neg count[i]-max count each r                                                                                                   / part 2

"Problem 18"
i:"^"=first read0`p18                                                                                                           / input
f:{sum sum not (y-1){not(prev x)=1 _ x,0b}\x}                                                                                   / simiplify to this, (nick psaris suggested final simplification)
f[i]each 40 400000                                                                                                              / part 1 and 2  

"Problem 19"
i:value first read0`p19                                                                                                         / input
first first -2#{$[1=mod[count x;2];1 _ ;]x 2*til ceiling .5*count x}\[1+til i]                                                  / part 1 alternatively, from http://www.exploringbinary.com/powers-of-two-in-the-josephus-problem 
/                                                                                                                               / 1+2*i-2 xexp floor xlog[2;i]
i-3 xexp floor xlog[3;i]                                                                                                        / part 2 (credit: u/natemago and others from reddit), my original solution was too slow+ugly to post
/                                                                                                                               / think thomas smyth also posted a similar approach

"Problem 20"
x:flip maxs x:asc value each ' "-"vs'read0 `p20                                                                                 / from nick psaris (his solution was so much nicer than mine had to put it here)
g:0|-1+x[0]-prev x[1]                                                                                                           / gap
-1+x[0]first where g>0                                                                                                          / p1
sum g                                                                                                                           / p2

"Problem 21"
x:{(first each 2#x;{$[x in .Q.a;::;value]x}each first each x where 1=count each x)}each " "vs 'read0`p21                        / inputs
i:"abcdefgh"
mp:{(c#a),x[b],(c:y 1) _ a:(b#x),(1+b:first y) _ x}                                                                             / move to position
rp:{@[x;reverse j;:;x j:a+til 1+y[1]-a:first y:asc y]}                                                                          / rev pos
sp:{@[x;reverse y;:;x y]}                                                                                                       / swap pos
sl:{@[x;(where x=)each y;:;reverse y]}                                                                                          / swap letter
r:{rotate[y*first z;x]}                                                                                                         / rotate
rl:r[;1]                                                                                                                        / rotate left
rro:rr:r[;-1]                                                                                                                   / rotate right (o=orig)
rb:rbo:{rro[x;1+i+3<i:x?y]}                                                                                                     / rotate based on pos (o=orig)
{value(first y;x;y 1)}/[i;x]                                                                                                    / run over inputs
rb:{m@(rbo[;y]each m:rl[x]each til 8)?x}                                                                                        / part 2, redefining: inverse rb
rr:rl                                                                                                                           / swap rr/rl
rl:rro
i:"fbgdceah"                                                                                                                    / new input
{value(first y;x;reverse y 1)}/[i;reverse x]                                                                                    / run backwards over inputs                                                                                 / run backwards over inputs

"Problem 22"
i:flip 1 _ read0`p22                                                                                                            / input
k:(value each flip i@)each 30 37+\:til 3                                                                                        / extract vals
a:k 1;u:first k                                                                                                                 / avail and used
(sum count[a]>1+(asc a)bin asc u)-sum a>u                                                                                       / part 1
0N!"part 2: count by eye using:";                                                                                               / part 2
show(1+max{"J"$1 _'-2#"-"vs first" "vs x}each flip i)#flip(a;u)                                                                 / turn available/used into a matrix, solve by pen/paper/eye

"Problem 23"
\l assembunny.q
r:ri:" "vs'read0`p23;
a:7;
(count[r]>)f/0;a                                                                                                                / part 1
r:ri
a:12;                                                                
(count[r]>)f/0;a                                                                                                                / part 2

"Problem 24"
st:raze(til count m),/:'where each m:not "#"=i:read0 `p24                                                                       / st street map of all coords of input map m
n:{j,x j:first iasc x}each i?\:/:l:8#.Q.n                                                                                       / coords of "0-7"
dj:0N*di:t!til each t:1+til 7                                                                                                   / global dict dj, how many steps from e.g 7 to each 0 1 2 3 ..
sm:(`u#st)!{c where m ./:c:y+/:x}[(0 1;1 0;0 -1;-1 0)]each st                                                                   / street map of where each point can go
g:{dj[x 3;s@:where x[3]>s:n?a:distinct r where 
        not(r:raze sm x 2)in first x]:1+x 1;(a,first x;1+x 1;a;x 3)}                                                            / iterate func (prev visited;count;new pos's;start pt)
{{x[3]>sum not null dj[x 3]}g/(();0;enlist n@x;x)} each key dj;                                                                 / find all distances b/w 2 points for each key di
p:(`u#flip k,'reverse k:(where count each di;raze di))!raze 2#enlist raze dj                                                    / map of distances b/w each 2 points
pp:0,'1+7{raze(idesc each t=/:t:first x)@\:x:0,'1+x}/enlist til 0                                                               / all perms of paths, using arthur's prm from 2015 aoc (can also use shotgun if being lazy)
f:{min(sum p 1 _ {y,x}prior)each x}                                                                                             / min distance for set of travel paths 
f pp                                                                                                                            / part 1
f pp,'0                                                                                                                         / part 2, finish at 0

"Problem 25"
\l assembunny.q                        
r:" "vs'read0`p25;                                                                                                              / note, slight change in input, helps to speed up
i:(til 0;0);                                                                                                                    / init vals
m:100                                                                                                                           / max output string length to look for
last(m>count first@){a::1+x 1;k::i 0;{(k~ck#0 1)&m>ck:count k}f/0;(k;1+x 1)}/i                                                  / keep looking for output m#0 1
/                                                                                                                               / note: see www.reddit.com/r/adventofcode/comments/5k6yfu/2016_day_25_solutions/?st=ixgvda8q&sh=63c2eb51
/                                                                                                                               / for a discussion on simplifying the input to this problem, essentially the answer can be simplified to:
/                                                                                                                               / 2730-*/0'(" "\:'0:`p25).(1 2;1) 
