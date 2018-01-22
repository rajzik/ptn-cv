
var R: string;
    F: file;

begin Assign(F, 'vystup1');
      rewrite(F, sizeof(R));
      while not eof do begin
         readln(R);
         blockwrite(F, R, 1);         
      end;
      Close(F)
end.