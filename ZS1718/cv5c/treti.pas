type tabulka = array [1..10000] of longint;
var Riadok: string;
    Vypis: file;
    I: word;
    T: tabulka;
    Pozice: longint;

begin Assign(vypis, 'ven3');
      rewrite(vypis, 1);
      for I:=1 to 10000 do T[I]:=0;
      blockwrite(Vypis, T, SizeOf(T));
      I:=0;
      Pozice:=SizeOf(T);
      while not eof do begin
        readln(Riadok);
        blockwrite(Vypis, Riadok, Length(Riadok)+1);
        Inc(I);
        T[I]:=Pozice;
        Pozice:=Pozice+Length(Riadok)+1;
      end;  
      Seek(Vypis, 0);
      blockwrite(Vypis, T, SizeOf(T));
      close(vypis)
end.