type Tabulka = array [1..10000] of longint;

var R: string;
    F: file;
    T: Tabulka;
    Pozice: longint;
    I: word;

begin Assign(F,'data3.bin');
      rewrite(F, 1);
      for I:=1 to 10000 do T[I]:=0;
      Pozice:=SizeOf(T); 
      I:=0;
      blockwrite(F, T, SizeOf(T));
      while not eof do begin
         readln(R);
         Inc(I); T[I]:=Pozice;
         blockwrite(F, R, Length(R)+1);
         Pozice:=Pozice+Length(R)+1
      end;
      seek(F,0);
      blockwrite(F, T, SizeOf(T));
      close(F)
end.