
var C, Pozice: longint;
    F: file;
    R: string;

begin Assign(F, 'data2.bin');
      read(C);
      while C<>-1 do begin
         reset(F, 1);
         Pozice:=0;
         while (Pozice<=C) and not eof(F) do begin
            Inc(Pozice);
            blockread(F, R, 1);
            blockread(F, R[1], Length(R));
         end;
         if Pozice>C then
            writeln(R)
         else writeln('Pozor! Řetězec s číslem ', C, ' v souboru není.');   
         read(C)
      end;
      Close(F)
end.