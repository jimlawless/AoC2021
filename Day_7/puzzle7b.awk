BEGIN { FS="," }
{
   min=0;
   max=0;
   for(i=1;i<=NF;i++) {
      pos[i]=$i;
      if($i<min) {
         min=$i;
      }
      if($i>max) {
         max=$i;
      }
   }
   
   lowtotal=min+1;
   lowpos=0
   for(i=min;i<=max;i++) {
      total=0;
      for(j=1;j<=NF;j++) {
         x=pos[j];
         if(x>i) {
            total+=sum((x-i));
         }
         else {
            total+=sum((i-x));
         }
      }
      if(i==min) {
         lowtotal=total;
         lowpos=i;
      }
      if(total<lowtotal) {
         lowtotal=total;
         lowpos=i;
      }
   }
   print lowpos " " lowtotal;
}

function sum(x,i,a) {
   if(cache[x]!="") {
      return cache[x];
   }
   a=0;
   for(i=1;i<=x;i++) {
      a+=i;
   }
   cache[x]=a;
   return a;
}