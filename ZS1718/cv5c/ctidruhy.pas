

var C, I: longint;
    F: file;
    S: string;

procedure Ctiretezec(var F: file; var X: string);
 begin blockread(F, X, 1);
       blockread(F, X[1], ord(X[0]));
 end;

begin Assign(F, 'ven2');
      read(C);
      while C>0 do begin
        reset(F, 1);
        I:=1;
        while (I<=C) and not eof(F)  do begin
          Ctiretezec(F, S);
          Inc(I)
        end;  
        if I>C then writeln(S)
           else writeln('Řetězec číslo ', C, ' v souboru není.');  
        read(C)
      end;
      Close(F)
end.