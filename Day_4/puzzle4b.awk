BEGIN {
   FS=",";
   getline < "input4.txt";
   for(i=1;i<=NF;i++) {
      a[++count]=$i;
   }
   
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
   number_count=1;
   while(number_count<length(a)) {
      print "Called number: " a[number_count];
      for(i=1;i<n;i++) {
         if(wins[i]==1) {
            continue;
         }
         for(j=1;j<=5;j++) {
            for(k=1;k<=5;k++) {
               if(b[i "_" j "_" k]==a[number_count]) {
                  tmp=b[i "_" j "_" k];
                  b[i "_" j "_"  k]="*" tmp;
                  if(check_for_bingo()==1) {
                     print "Bingo! Board #" i  " , "  a[number_count];
                     final_calculations();
                     wins[i]=1;
                  }
               }
            }
         }
      }
      number_count++;
   }
}

function check_for_bingo() {
   for(w=1;w<=5;w++) {
      for(x=1;x<=5;x++) {
         if(substr(b[i "_" w "_" x],1,1)!="*") {
            break;
         }
      }
      if(x>5) {
         print "Row " w;
         return 1;
      }
      for(x=1;x<=5;x++) {
         if(substr(b[i "_" x "_" w],1,1)!="*") {
            break;
         }
      }
      if(x>5) {
         print "Column " w;
         return 1;
      }
   }
   if((substr(b[i "_1_1"],1,1)=="*")&&
      (substr(b[i "_2_2"],1,1)=="*")&&
      (substr(b[i "_3_3"],1,1)=="*")&&
      (substr(b[i "_4_4"],1,1)=="*")&&
      (substr(b[i "_5_5"],1,1)=="*")) {
      print "Diagonal, down.";
      return 1;
   }
   if((substr(b[i "_5_1"],1,1)=="*")&&
      (substr(b[i "_4_2"],1,1)=="*")&&
      (substr(b[i "_3_3"],1,1)=="*")&&
      (substr(b[i "_2_4"],1,1)=="*")&&
      (substr(b[i "_1_5"],1,1)=="*")) {
      print "Diagonal, up.";
      return 1;
   }
   return 0;
}

function final_calculations() {
   sum=0;
   for(w=1;w<=5;w++) {
      for(x=1;x<=5;x++) {
         v=b[i "_" w "_" x];
         printf("%3s ",v);
         if(substr(v,1,1)!="*") {
            sum+=v;
         }
      }
      printf("\n");     
   }
   print "Sum " sum ;
   print "Product " (sum*a[number_count]);
}
