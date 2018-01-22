var R: string;
    F: file;

begin Assign(F,'data2.bin');
      rewrite(F, 1); 
      while not eof do begin
         readln(R);
         blockwrite(F, R, Length(R)+1)
      end;
      close(F)
end.