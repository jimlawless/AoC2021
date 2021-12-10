BEGIN {
   left="([{<";
   right=")]}>";
   stack[1]="dummy";
   sp=1;
   
   p[")"]=3;
   p["]"]=57;
   p["}"]=1197;
   p[">"]=25137;
      
}

{
   for(i=1;i<=length($1);i++) {
      c=substr($1,i,1);
	  if(index(left,c)>=1) {
	     push(c);
	  }
	  else {
	     expect=substr(right,index(left,pop()),1);
		 if(c!=expect) {
		    print "Expected " expect " , found " c ;
			total+=p[c];
			sp=1;
		    next;
         }
	  }
   }
}

END {
   print "\n" total;
}

function push(x) {
   stack[sp++]=x;
}

function pop() {
   sp--;
   return stack[sp];
}