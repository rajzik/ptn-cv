const MaxRetezcu = 10000;
type Tabulka = array [1..MaxRetezcu] of longint;
var R: string;
    F: file;
    T: Tabulka;
    I: word;
    Pozice: longint;

begin Assign(F, 'vystup3');
      rewrite(F, 1);
      for I:=1 to MaxRetezcu do T[I]:=0;
      blockwrite(F, T, SizeOf(T));
      I:=0;
      Pozice:=SizeOf(T);
      while not eof do begin
         Inc(I);
         T[I]:=Pozice;
         readln(R);
         blockwrite(F, R, Length(R)+1);         
         Pozice:=Pozice+Length(R)+1
      end;
      seek(F, 0);
      blockwrite(F, T, Sizeof(T));
      Close(F)
end.