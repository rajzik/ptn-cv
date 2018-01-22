var R: string;
    F: file;

begin Assign(F,'data1.bin');
      rewrite(F, sizeof(R)); 
      while not eof do begin
         readln(R);
         blockwrite(F, R, 1)
      end;
      close(F)
end.