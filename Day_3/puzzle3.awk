{
   for(i=1;i<=length($1);i++) {
      c=substr($1,i,1);
      if(c=="0") {
         zero[i]++;
      }
      else {
         one[i]++;
      }
   }
} 

END {
   gamma="";
   epsilon="";
   for(j=1;j<i;j++) {
      if(zero[j]>one[j]) {
         epsilon=epsilon "0";
         e=e*2+0;
         gamma=gamma "1";
         g=g*2+1;
      }
      else {
         epsilon=epsilon "1";
         e=e*2+1;
         gamma=gamma "0";
         g=g*2+0;
      }
   }
   print epsilon " " e " " gamma " " g " " (g*e) ;
}