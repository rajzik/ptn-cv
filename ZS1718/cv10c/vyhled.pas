{Implementujte abstraktní datový typ Vyhledávací tabulka pomocí stromového
hledání a pomocí tabulky s rozptýlenými hesly.  Obě implementace vytvořte
pro práci s libovolnými daty.  Vložte do struktury slova získaná ze
vstupního textu, u slov zaznamenejte počet jejich výskytů.  Analyzujte
chování obou implementací se stejnými daty a porovnejte je.
}

uses m_vyhl_tab, slova;

type TypData = record
       Slovo: string;
       Vyskytu: longword
     end;  
     UkData = ^TypData;

var R: string;
    VT: VyhlTab;
    P: UkData;
    Kde: Umisteni;

function Porovnani(A, B: Prvek): shortint;
 var X, Y: string;
 begin X:=TypData(A^).Slovo;
       Y:=TypData(B^).Slovo;
       if X<Y then Porovnani:=-1
       else if X=Y then Porovnani:=0
            else Porovnani:=1 
 end;
 
function Rozptyluj(A: Prvek): Indexy;
 var X: string; Soucet: longword; I: byte;
 begin X:=TypData(A^).Slovo;
       if X='' then Rozptyluj:=1
       else begin
         Soucet:=0;
         for I:=1 to Length(X) do Soucet:=Soucet+ord(X[I]);
         Rozptyluj:=Soucet mod Max + 1
       end;
 end; 


begin VT.Start(@Porovnani, @Rozptyluj);
      while not eof do begin
         R:=DejSlovo(input);
         // Vytvoření ukazatele P na potřebná data
         new(P);
         P^.Slovo:=R;
         P^.Vyskytu:=1;
         Kde:=VT.Hledej(Prvek(P));
         if Kde=nil then VT.Vloz(Prvek(P))
         else begin // bylo nalezeno -> zvýšíme počet výskytů
            Inc(Typdata(Kde^).Vyskytu);
            dispose(P)
         end
      end;
      VT.Analyza(output)
end.