type cisla = 1..49;
     Mnozina = set of cisla;
     Vyskyty = array [1..49] of word;
var M: Mnozina;
    C, I: byte;
    Radku: word;
    V: Vyskyty;
begin

      assign(F, 'sportka.txt');
      reset(F);
      read(F,C);
      radku:=0;
      M:=[];
      FillChar(Vyskyty, sizeof(Vyskyty), 0);
      while C<>0 do begin
        Inc(radku);
        M:=M+[C];
        Inc(V[C]);
        for I:=1 to 5 do begin
           read(F, C);
           M:=M+[C];
           Inc(V[C]);
        end;
        read(F,C)
      end;

      for I:=1 to 49 do 
        if V[I]=radku then write(I);
      for I:=1 to 49 do 
        if not (I in M) then write(I)
end.             