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
   top3[1]=1;
   top3[2]=1;
   top3[3]=1;

   for(i=1;i<=count;i++) {
      for(j=1;j<=width;j++) {
         if(scan(i,j)==1) {
            revisit1[ ++rcount ]=i;
            revisit2[ rcount ]=j;
         }
      }
   }

   for(i=1;i<=rcount;i++) {
      basin_count=0;
      find_basin(revisit1[i],revisit2[i]);
      if(basin_count>1) {
         top3[4]=basin_count;
         asort(top3,tmp);
         top3[1]=tmp[2];
         top3[2]=tmp[3];
         top3[3]=tmp[4];
      }            
   }
   print top3[1]*top3[2]*top3[3];
}

function find_basin(row,column,c,matches) {
   c=a[row "_" column];
   if(c==9) {
      return;
   }
   if(c!=9) {
      a[row "_" column]=9;
      basin_count++;
      if(row!=1) {
         find_basin(row-1,column);
      }
      if(column!=1) {
         find_basin(row,column-1);
      }
      if(column!=width) {
         find_basin(row,column+1);
      }
      if(row!=count) {
         find_basin(row+1,column);
      }
   }
}

function scan(row,column,matches) {
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
