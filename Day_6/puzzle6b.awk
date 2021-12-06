BEGIN { FS="," }
{
   for(i=1;i<=NF;i++) {
      buckets[$i]++;
   }
}
END {
   for(j=1;j<=(256+1);j++) {
      tmp=buckets[0];
      for(k=1;k<=8;k++) {
         buckets[k-1]=buckets[k];
      }
      buckets[6]+=tmp;
      buckets[8]=tmp;
   }
   for(k=0;k<8;k++) {
      total+=buckets[k];
   }
   print total;
}
