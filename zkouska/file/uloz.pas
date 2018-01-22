//type soubor = file of string;
var R: string;
    F: file; // G: soubor;
begin
      Assign(F, 'data3.bin');
      rewrite(F, 1);      
      while not eof do begin
        readln(R);
        blockwrite(F, R, Length(R)+1)
      end;
      Close(F)
end.