
{ arr[++count]=$1}
END {
   for(i=1;i<=(count-2);i++) {
      b[i]=arr[i]+arr[i+1]+arr[i+2];
      print b[i];
   }
   increased=0;
   for(i=2;i<=count-2;i++) {
      if(b[i]>b[i-1]) {
         increased++;
      }
   }
   print increased;
}
