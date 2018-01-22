var Z, heslo: char;
    S: byte;
    F: file of byte;

begin if Paramcount>0 then 
          Heslo:=ParamStr(1)
      else Heslo:='A';
      Assign(F, 'sifra.dat');
      rewrite(F);    
      while not eof do begin
        read(Z);
        s:=ord(Z) xor ord(Heslo);
        write(F,S)
      end;
      Close(F)
end.      