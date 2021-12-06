BEGIN { FS="," }
{
   for(i=1;i<=NF;i++) {
      fish[++count]=$i;
   }
}
END {
   for(j=1;j<=80;j++) {
      printf("Day %d: ",j);
      add=0;
      for(k=1;k<=count;k++) {
         fish[k]=fish[k]-1;
         if(fish[k]==-1) {
            add++;
            fish[k]=6;
         }
      }
      printf("\n");
      for(k=1;k<=add;k++) {
         fish[++count]=8;
      }
   }
   print length(fish);
}
