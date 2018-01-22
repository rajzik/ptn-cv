
var Riadok: string;
    Vypis: file;

begin Assign(vypis, 'ven2');
      rewrite(vypis, 1);
      while not eof do begin
        readln(Riadok);
        blockwrite(Vypis, Riadok, Length(Riadok)+1)
      end;  
      close(vypis)
end.