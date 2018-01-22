
var Riadok: string;
    Vypis: file;

begin Assign(vypis, 'ven1');
      rewrite(vypis, sizeof(Riadok));
      while not eof do begin
        readln(Riadok);
        blockwrite(Vypis, Riadok, 1)
      end;  
      close(vypis)
end.