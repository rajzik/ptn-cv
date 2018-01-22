uses modul;

var M: Matice;
    A: IndexR;
    B: IndexS;
    C: string;
    U: pointer;
    
procedure Jak(X: pointer; var G: text);
 begin write(G, string(X^))
 end;    

begin Init(M);
      while not eof do begin
        readln(A, B, C); Delete(C, 1, 1); // zrušení první mezery
        GetMem(U, Length(C)+1);
        string(U^):=C;
        Vloz(M, A, B, U);
      end;
      Vypis(M, @jak, output);
end.