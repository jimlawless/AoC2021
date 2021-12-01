
{ arr[++count]=$1}
END {
   increased=0;
   for(i=2;i<=count;i++) {
      if(arr[i]>arr[i-1]) {
         increased++;
      }
   }
   print increased;
}
