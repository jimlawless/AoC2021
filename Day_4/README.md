# Advent of Code 2021 - Day 4 Challenges

I found that completing the Day 4 challenge in AWK was a lot of fun.  I think that the problem would have been more easily handled in an OOP language or a language that permits the creation of record structures of some sort, but I managed to do with with AWK.

Instead of modeling the bingo cards as a list of bingo card objects, I treated the the card representation itself as a five by five array.  The list of cards was then managed in a growing array as the card input was read.  Standard AWK really isn't supposed to support multidimensional arrays.  I've read that it inserts "@" between string representations of the index for each dimension together and holds those in a single associative array.  GNU AWK (GAWK) is supposed to have direct support for multidimensional arrays, but I didn't end up using any of those.  I took the concatenated key approach manually, using the underscore character to separate the indexes.

One of the first challenges that I ran into was that the file contents had a varied structure. The first line of input was the series of numbers that would normally be read aloud in a bingo competition.  Each number was separated by commas.  Then, blank lines separated the five by five sets of numbers that represented the various bingo cards. I decided to complete all of the work in the BEGIN pattern rather than trying to use state variables or something to control a first-time pattern followed by patterns for consuming the card input.

I directly invoked AWK's **getline** command which normally occurs outside of the formal code of an AWK script. This reads the next line and parses it based on the field-separater delimiter **FS** into the $0, $1, $2 ...etc. fields.  In order to process the first line, I had to reset the FS value from its normal whitespace value to a comma.  This made reading the first line into an array pretty painless.

  BEGIN {
     FS=",";
     getline < "input4.txt";
     for(i=1;i<=NF;i++) {
        a[++count]=$i;
     }

My text editor worked against me when trying to process this input, initially.  The values of the single line of input wrapped in my text editor; they looked like two lines, so I had added code to process a second line.  This temporarily had skewed the rest of the input which took me some time to diagnose.

After getting those values loaded, I had to change the FS value to a space to correctly read an parse the rest of the card input.

     FS=" ";
     n=1;
     while(1) {
        if((getline < "input4.txt")<=0) {
           break;
        }
        for(j=1;j<=5;j++) {
           getline < "input4.txt";
           for(k=1;k<=5;k++) {
              b[n "_" j "_" k]=$k;
           }
        }
        n++;
     }

After loading the cards into associative array **b** and having already loaded the list of numbers into array **a** I was now ready to loop through the numbers, "marking" the spots in each logical card and then checking for a bingo.  When marking a number, I changed the entry in the array to hold the specified number with an asterisk as a sign that the number had been marked.  When checking for a bingo, the script then looked at the first character of each entry to see if it held an asterisk to determine if it had been marked.

To verify my entry, I displayed information about the winning card.

    ...
    Called number: 78
    Called number: 32
    Called number: 39
    Called number: 11
    Called number: 44
    Row 5
    Bingo! Board #69 , 44
     98  74  36 *23   6
     65  17 *78  95  96
     68  63  47  16  18
     87 *30  53  51  57
    *69 *11 *44 *75 *89
    Sum 947
    Product 41668

When implementing the second part of the challenge, I removed the call to **exit** from the script and I added an array called **wins**.  As each board that held a bingo won, I placed the index of that board from the outer array into wins.  When processing called numbers, the code skips attempting to process any board that had already won.  The final winning board is displayed in the output with the appropriate values.

This was a fun challenge!
