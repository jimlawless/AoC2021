BEGIN {
   left="([{<";
   right=")]}>";
   stack[1]="dummy";
   sp=1;
   
   p[")"]=1;
   p["]"]=2;
   p["}"]=3;
   p[">"]=4;
   listndx=1;   
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
			sp=1;
		    next;
         }
	  }
   }
   total=0;
   while(sp!=1) {
      total*=5;
      total+=p[substr(right,index(left,pop()),1)];
   }
   list[listndx++]=total;
   print total;
}

END {
   asort(list,list2);
   print "\n"list2[listndx/2];
}

function push(x) {
   stack[sp++]=x;
}

function pop() {
   sp--;
   return stack[sp];
}