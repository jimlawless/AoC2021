BEGIN {
   tbl[2]=1;
   tbl[4]=1;
   tbl[3]=1;
   tbl[7]=1;
}

{
   for(i=1;i<=NF;i++) {
      if($i=="|") {
         break;
      }
   }
   i++;
   for(;i<=NF;i++ ) {
      if(tbl[length($i)]==1) {
         count++;
      }
   }
}

END {
   print count;
}
