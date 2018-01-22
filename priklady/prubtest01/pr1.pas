{Vytvořte proceduru, která z jednosměrného dynamického lineárního seznamu
odstraní prvek, jehož hodnota je zadána ve druhém parametru.  Prvním
parametrem je ukazatel na začátek seznamu.  Hodnoty jsou typu řetězec. 
Předpokládejte, že se zadaná hodnota v seznamu nachází nejvýše jednou. 
Doplňte všechny potřebné definice datových typů.}

type UkPrvek = ^Prvek; 
     Prvek = record  
        data: string;
        dalsi: UkPrvek;
     end;

procedure Odstran(var S: UkPrvek; D: string);
 var Pom: UkPrvek;
 begin if S<>nil then begin {test na prázdnost seznamu}
          if S^.data=D then begin {extra pro první prvek}
             Pom:=S;
             S:=S^.dalsi;
             dispose(Pom)
          end else begin
             Pom:=S; {vyhledání}
             while (Pom<>nil) and (Pom^.data<>D) do begin
                Predch:=Pom;
                Pom:=Pom^.dalsi
             end;
             if Pom<>nil then begin {nalezeno, mažeme}
                Predch^.dalsi:=Pom^.dalsi;
                dispose(Pom)
             end   
          end
       end
 end;