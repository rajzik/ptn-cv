var F: file;
    X: string;
    Poradi: longint;
    
begin Assign(F, 'vystup1');
      reset(F, sizeof(X));
      read(Poradi);
      while Poradi>0 do begin
         if Poradi<=FileSize(F) then begin
            seek(F, poradi-1);
            blockread(F, X, 1);
            writeln(X);
         end else writeln('Řetězec číslo ', Poradi, ' v souboru není.'); 
         read(Poradi)
      end;
      Close(F)
end.         