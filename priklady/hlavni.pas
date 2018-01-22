uses modul;

var M: Matice;
    X: IndexR;
    Y: IndexS;
    U: pointer;
    den: string[3];
    hodina: byte;
    cinnost: string;

function KteryDen(X:string):IndexR;
 begin if X='po ' then KteryDen:=1;
       if X='út' then KteryDen:=2;
       if X='st ' then KteryDen:=3;
       if X='čt' then KteryDen:=4;
       if X='pá' then KteryDen:=5;
       if X='so ' then KteryDen:=6;
       if X='ne ' then KteryDen:=7;
 end;

function KteraHodina(X: byte): IndexS;
 begin if X in [7..19] then KteraHodina:=X-6
          else KteraHodina:=1
 end;
 
procedure Rozvrh(X: pointer; var G: text);
 begin if X<>nil then 
          write(G, string(X^):7,'|')
       else write(G,' ':7, '|')
 end;

begin
      Init(M);
      while not eof do begin
        readln(den, hodina, cinnost[1], cinnost);
        X:=KteryDen(Den);
        Y:=KteraHodina(hodina);
        GetMem(U, Length(Cinnost)+1);
        string(U^):=cinnost;
        Vloz(M, X, Y, U)
      end;
      Vypis(M, @Rozvrh, output)
end.