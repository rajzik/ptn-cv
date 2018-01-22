
var C: longint;
    F: file;
    R: string;

begin Assign(F, 'data1.bin');
      reset(F, sizeof(R));
      read(C);
      while C<>-1 do begin
         if C <= (FileSize(F) -1) then begin
            seek(F, C);
            blockread(F, R, 1);
            writeln(R)
         end else writeln('Pozor! Řetězec s číslem ', C, ' v souboru není.');   
         read(C)
      end;
      Close(F)
end.