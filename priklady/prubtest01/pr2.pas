{Je dán lineární jednosměrný dynamický seznam s datovou složkou typu
pointer.  Napište funkci, která vybere z tohoto seznamu prvek s maximální
hodnotou a nabude hodnoty ukazatele na tuto hodnotu.  Pro porovnání hodnot
připravte vhodný podprogram, který bude předán jako parametr této funkci. 
Dalším parametrem bude ukazatel na seznam.  Doplňte všechny potřebné
definice datových typů.}

type UkPrvek = ^Prvek; 
     Prvek = record  
        data: pointer;
        dalsi: UkPrvek;
     end;

     TypGT = function (A, B: pointer): boolean;

function VyberMax(X: UkPrvek; GT: TypGT): pointer;
 var Pom: UkPrvek; Max: pointer;
 begin if X<>nil then begin
          Pom:=X;
          Max:=Pom^.data;
          Pom:=Pom^.dalsi;
          while Pom<>nil do begin
             if GT(Pom^.data, Max) then Max:=Pom^.data;
             Pom:=Pom^.dalsi
          end;
          VyberMax:=Max
       end else VyberMax:=nil
 end;