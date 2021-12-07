# Advent of Code 2021 - Notes on Day 7 Challenges

I ran into a little problem in my first attempt at implementing the first challenge as I was keeping numbers as keys in associative arrays, but referencing them treated them as strings when I used the greater-than or less-than operators.  Math operations worked properly.  I tried multiplying the values by one to force the type perspective, but I just ended up rewriting the code that initially stored the numbers and the code that iterated over that array.

I didn't have time to address the second challenge before I left for work, but I did read the challenge details.  So, of course, I've been thinking about a solution off and on all day.  I suspected that I'd have to cache some values for computed distances, but I didn't implement that right off the bat.  Well, I don't know how long that script would've run because I gave up on it.  I added a cache associative array for the sum() function.

