{
   row++;
   for(column=1;column<=10;column++) {
      a[ row "_" column ] = substr($1,column,1);
   }
}

END {
   for(i=1;;i++) {
      print "Step "  i;
      for(j=1;j<=10;j++) {
         for(k=1;k<=10;k++) {
            increment(j,k);
         }
      }

      flashes_per_step=0;
      for(j=1;j<=10;j++) {
         for(k=1;k<=10;k++) {
            if(a[j "_" k]>9) {
               flashes_per_step++;
               a[j "_" k]=0;
            }
         }
      }
      display();
      if(flashes_per_step==100) {
         print "All flashed!";
         exit;
      }
   }
}

function increment(r,c) {
   if((r<1)||(r>10)||(c<1)||(c>10)) {
      return;
   }
   a[ r "_" c]++;
   if(a[r "_" c] == 10 ) {
      flashes++;
      increment(r-1,c-1);
      increment(r-1,c);
      increment(r-1,c+1);
      increment(r,c+1);
      increment(r+1,c+1);
      increment(r+1,c);
      increment(r+1,c-1);
      increment(r,c-1);
   }
}

function display(i,j) {
   for(i=1;i<=10;i++) {
      for(j=1;j<=10;j++) {
         printf("%s",a[i "_" j]);
      }
      printf("\n");
   }
   printf("\n");  
}


