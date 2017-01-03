# advent of code 2016

aoc2016.k - k versions

aoc2016.q - corresponding q translations

* Tried to credit people where possible, let me know if I've missed anything

* Only had a finite amount of energy for tidying things up and/or trying to optimize, so I'm sure many of these are neither the fastest, nor the tersest way

# running time

* Some of the problems run much faster when running with multiple cores (as they use peach), particularly 5, 11, 14 and 24
* I wouldn't recommend running 5 or 14 on an old laptop
* with a decent machine and using multiple cores, the whole thing runs through in under a minute, but much slower without

# assembunny (problems 12, 23 and 25)
* For these, I opted for manual alterations (as opposed to coding up the corresponding alterations to unravel loops) to the input p files. 
* Think there are plenty of discussions on why/how to do the alterations floating around on www.reddit.com/r/adventofcode for anyone that's interested
* Without doing these alterations, the code will likely run forever on those problems
