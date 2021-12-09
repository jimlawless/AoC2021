{
   count++;
   if(length($1)>width) {
      width=length($1);
   }
   for(i=1;i<=length($1);i++) {
      a[count "_" i]=substr($1,i,1);
   }
}

END {
   for(i=1;i<=count;i++) {
      for(j=1;j<=width;j++) {
         if(scan(i,j)==1) {
            risks[++rc]=a[i "_" j] + 1;
         }
      }
   }
   for(i=1;i<=rc;i++) {
      total+=risks[i];
   }
   print total;
}

function scan(row,column) {
   matches=0;
   
   #top
   if(row==1) { 
      matches++;
   }
   else {
      matches+=( a[row "_" column]< a[(row-1) "_" column ]) ? 1 : 0 ;
   }
   
   #left
   if(column==1) {
      matches++;
   }
   else {
      matches+=( a[row "_" column]< a[row "_" (column-1) ]) ? 1 : 0 ;
   }
   
   #bottom
   if(row==count) {
      matches++;
   }
   else {
      matches+=( a[row "_" column]< a[(row+1) "_" column ]) ? 1 : 0 ;
   }
   
   #right
   if(column==width) {
      matches++;
   }
   else {
      matches+=(a[row "_" column]< a[row "_" (column+1) ]) ? 1 : 0;
   }
   if(matches==4) {
      return 1;
   }
   return 0;
}