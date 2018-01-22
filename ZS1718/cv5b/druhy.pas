
var R: string;
    F: file;

begin Assign(F, 'vystup2');
      rewrite(F, 1);
      while not eof do begin
         readln(R);
         blockwrite(F, R, Length(R)+1);         
      end;
      Close(F)
end.