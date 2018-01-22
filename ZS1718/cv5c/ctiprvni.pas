

var C: longint;
    F: file;
    S: string;

begin Assign(F, 'ven1');
      reset(F, sizeof(string));
      read(C);
      while C>0 do begin
        if C<=FileSize(F) then begin
          seek(F, C-1);
          blockread(F, S, 1);
          writeln(S)
        end else writeln('Řetězec číslo ', C, ' v souboru není.');  
        read(C)
      end;
      Close(F)
end.