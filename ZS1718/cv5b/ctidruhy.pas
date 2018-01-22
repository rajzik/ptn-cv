var F: file;
    X: string;
    Poradi, I: longint;
    
procedure CtiRetezec(var S: file; var R: string);
 begin blockread(S, R[0], 1);   // blockread(S, R, 1);
       blockread(S, R[1], ord(R[0])) // blockread(S, R[1], Length(R))
 end;
    
begin Assign(F, 'vystup2');
      read(Poradi);
      while Poradi>0 do begin
         I:=1;
         reset(F, 1);
         while (I<=Poradi) and not eof(F) do begin
            CtiRetezec(F, X);
            Inc(I)
         end;   
         if I>Poradi then writeln(X)
         else writeln('Řetězec číslo ', Poradi, ' v souboru není.'); 
         read(Poradi)
      end;
      Close(F)
end.         