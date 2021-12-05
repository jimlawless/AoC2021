BEGIN { 
   FS="[ ,]+";
}
{
   x1=$1;
   y1=$2;
   x2=$4;
   y2=$5;
   if(x1==x2) {
      for(y=min(y1,y2);y<=max(y1,y2);y++){
         c=a[x1 "_" y];
         if(c=="") {
            a[x1 "_" y]="1";
         }
         else {
            a[x1 "_" y]=(c+1) "";
            if((c+1)==2) {
               count++;
            }
         }
      }
      next;
   }
   if(y1==y2) {
      for(x=min(x1,x2);x<=max(x1,x2);x++) {
         c=a[x "_" y1];
         if(c=="") {
            a[x "_" y1]="1";
         }
         else {
            a[x "_" y1]=(c+1) "";
            if( (c+1)==2) {
               count++;
            }
         }
      }
      next   
   }
   xinc=incval(x1,x2);
   yinc=incval(y1,y2);
   y=y1;
   for(x=x1;x!=(x2+xinc);x+=xinc) {
      c=a[x "_" y];
      if(c=="") {
         a[x "_" y]="1";
      }
      else {
         a[x "_" y]=(c+1) "";
         if( (c+1)==2) {
            count++;
         }
      }
      y+=yinc;
    }
}

END {
   print count;
}

function max(n1,n2) {
   return (n1>n2) ? n1 : n2 ;
}

function min(n1,n2) {
   return (n1<n2) ? n1 : n2 ;
}

function incval(n1,n2) {
   if(n1<n2) {
      return 1;
   }
   return -1;
}
