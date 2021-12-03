{
   og[++count]=$1; 
   co[count]=$1;
}
END {
   pos=0;
   max=length(og[1]);
   while((length(og)>1) && (pos<max)) {
      z=0;
      o=0;
      pos++;
      for(i in og) {
         if(substr(og[i],pos,1)=="1") {
            o++;
         }
         else {
            z++;
         }
      }
      if(o>=z) {
         keep="1";
      }
      else {
         keep="0";
      }
      for(i in og) {
         if(substr(og[i],pos,1)!=keep) {
            delete og[i];
         }
      }
   }
   for(i in og) {
      print og[i];
      og_num=b2i(og[i]);
      print og_num;
      
   }
   
   pos=0;
   max=length(co[1]);

   while((length(co)>1) && (pos<max)) {
      z=0;
      o=0;
      pos++;
      for(i in co) {
         if(substr(co[i],pos,1)=="1") {
            o++;
         }
         else {
            z++;
         }
      }
      if(z<=o) {
         keep="0";
      }
      else {
         keep="1";
      }
      for(i in co) {
         if(substr(co[i],pos,1)!=keep) {
            delete co[i];
         }
      }
   }
   for(i in co) {
      print co[i];
      co_num=b2i(co[i]);
      print co_num;
   }
   print og_num * co_num;
}

function b2i(s,a,i) {
   a=0;
   for(i=1;i<=length(s);i++) {
      a=a*2+substr(s,i,1);
   }
   return a;
}