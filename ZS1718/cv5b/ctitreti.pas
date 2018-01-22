const MaxRetezcu = 10000;
type Tabulka = array [1..MaxRetezcu] of longint;
var F: file;
    X: string;
    Poradi: longint;
    T: Tabulka;
    
procedure CtiRetezec(var S: file; var R: string);
 begin blockread(S, R[0], 1);   // blockread(S, R, 1);
       blockread(S, R[1], ord(R[0])) // blockread(S, R[1], Length(R))
 end;
    
begin Assign(F, 'vystup3');
      reset(F, 1);
      blockread(F, T, SizeOf(T));
      read(Poradi);
      while Poradi>0 do begin
         if (Poradi<=MaxRetezcu) and (T[Poradi]>0) then begin
            Seek(F, T[Poradi]);
            CtiRetezec(F, X);
            writeln(X)
         end else writeln('Řetězec číslo ', Poradi, ' v souboru není.'); 
         read(Poradi)
      end;
      Close(F)
end.         